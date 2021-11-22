# Databricks notebook source
import json

# COMMAND ----------

conf = json.loads(sc.wholeTextFiles('/FileStore/tables/auto_loan.json').collect()[0][1])

input_location = conf.get("input_location")
output_locatin = conf.get("output_location")
delimiter = conf.get("delimiter")

# COMMAND ----------

input_rdd = sc.textFile(input_location).filter(lambda record: not record.startswith("application_id"))

# COMMAND ----------

# MAGIC %md
# MAGIC #### The month in which maximum loan requests were submitted in the last one year [2019-04-01 to 2020-03-31]

# COMMAND ----------

month_count_rdd = input_rdd.filter(lambda x: x.split(",")[5] >= "2019-04-01" and x.split(",")[5] < "2020-04-01").map(lambda record: (int(record.split(delimiter)[5].split("-")[1]), 1)).reduceByKey(lambda x, y: x + y)
count_month_rdd = month_count_rdd.map(lambda x: (x[1], x[0]))
result = count_month_rdd.takeOrdered(1, key=lambda x: -1 * x[0])
display(result)

# COMMAND ----------

# MAGIC %md
# MAGIC #### Max, Min and Average number of applications submitted per customer id

# COMMAND ----------

def initialize(num_applications):
  return (num_applications, num_applications, num_applications, 1)

def add(aggregated_values, num_applications):
  max_val = max(aggregated_values[0], num_applications)
  min_val = min(aggregated_values[1], num_applications)
  total = aggregated_values[2] + num_applications
  count = aggregated_values[3] + 1
  return max_val, min_val, total, count

def merge(agg1, agg2):
  max_val = max(agg1[0], agg2[0])
  min_val = min(agg1[1], agg2[1])
  total = agg1[2] + agg2[2]
  count = agg1[3] + agg2[3]
  return max_val, min_val, total, count

# COMMAND ----------

customer_applications_rdd = input_rdd.map(lambda record: (record.split(delimiter)[1], 1)).reduceByKey(lambda x, y: x + y)
num_applications_rdd = customer_applications_rdd.map(lambda x: (1, x[1]))
result_rdd = num_applications_rdd.combineByKey(initialize, add, merge)
max_val, min_val, total, count = result_rdd.collect()[0][1]
print("max: {}, min:{}, avg: {}".format(max_val, min_val, round(float(total)/count, 3)))

# COMMAND ----------

# MAGIC %md
# MAGIC #### Top 10 highest car price against which applications got approved

# COMMAND ----------

approved_car_loans = input_rdd.filter(lambda x: x.split(delimiter)[6] == 'approved')
price_application_rdd = approved_car_loans.map(lambda record: (int(record.split(delimiter)[2]), record.split(delimiter)[0]))
result = price_application_rdd.takeOrdered(10, key=lambda x: -1 * x[0])
print("price-application: {}".format(result))

# COMMAND ----------

# MAGIC %md
# MAGIC #### For each customer location, top 5 car models which have most loan applications in the last month

# COMMAND ----------

from pyspark.rdd import portable_hash

def partition_func(key):
	return portable_hash(key[0])

def key_func(key):
	return key

# COMMAND ----------

location_model_count_rdd = input_rdd.map(lambda x: ((x.split(delimiter)[4], x.split(delimiter)[3]), 1)).reduceByKey(lambda x, y : x + y)
location_count_model_rdd = location_model_count_rdd.map(lambda x: ((x[0][0], x[1]), x[0][1]))
sorted_rdd = location_count_model_rdd.repartitionAndSortWithinPartitions(partitionFunc=partition_func, keyfunc=key_func, ascending=False)

# COMMAND ----------

TOP_N = 5
def get_top_values(records):
  last_location = None
  current_rank = 0
  for record in records:
    current_location, num_applications, car_type = record[0][0], record[0][1], record[1]
    if current_location != last_location:
      last_location = current_location
      current_rank = 1
    else:
      current_rank += 1
    if current_rank <= TOP_N:
      yield current_location, num_applications, car_type, current_rank
    else:
      continue

# COMMAND ----------

result_rdd = sorted_rdd.mapPartitions(get_top_values)
display(result_rdd.collect())
