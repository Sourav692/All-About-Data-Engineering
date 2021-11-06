# Databricks notebook source
# MAGIC %md Python built-in functions

# COMMAND ----------

my_list = [11, 12, 17, 14, 10, 13]
odd_numbers = list(filter(lambda x: x%2 != 0, my_list))

print("odd_numbers = {}".format(odd_numbers))

def square(x):
  return x**2

squared_numbers = list(map(square, my_list))

print("squared_numbers = {}".format(squared_numbers))


from functools import reduce
max_number = reduce(lambda x, y: x if x>y else y, my_list)
print("max_number = {}".format(max_number))

# COMMAND ----------

# MAGIC %md
# MAGIC Operations with RDD

# COMMAND ----------

my_list = [11, 12, 17, 14, 10, 13]
rdd = sc.parallelize(my_list)

# COMMAND ----------

rdd

# COMMAND ----------

rdd.getNumPartitions()

# COMMAND ----------

print(rdd.collect())

# COMMAND ----------

odd_numbers_rdd = rdd.filter(lambda x: x%2 != 0)

# COMMAND ----------

odd_numbers_rdd

# COMMAND ----------

lsit_of_odd_numbers = odd_numbers_rdd.collect()
print("RDD of odd numbers = {}".format(lsit_of_odd_numbers))

# COMMAND ----------

sorted_rdd = rdd.sortBy(lambda x: x).collect()
print("Sorted RDD = {}".format(sorted_rdd))

# COMMAND ----------

max_val = rdd.reduce(lambda x, y: x if x>y else y)
print("The max value from the RDD is {}".format(max_val))

# COMMAND ----------

# MAGIC %md
# MAGIC Aggregations with RDD

# COMMAND ----------

input_rdd = sc.textFile("/FileStore/tables/weather.csv", 2)

# COMMAND ----------

print(input_rdd.getNumPartitions())

# COMMAND ----------

# MAGIC %md
# MAGIC Select only year and temperature to generate PairRDD

# COMMAND ----------

selected_fields_rdd = input_rdd.map(lambda line: (int(line.split(",")[0].split("-")[0]), int(line.split(",")[2])))

# COMMAND ----------

selected_fields_rdd

# COMMAND ----------

print(selected_fields_rdd.collect())

# COMMAND ----------

# MAGIC %md
# MAGIC Get the maximum temperature corresponding to each year

# COMMAND ----------

max_temperature_rdd = selected_fields_rdd.reduceByKey(lambda x, y: x if x>y else y)

# COMMAND ----------

result = max_temperature_rdd.collect()

# COMMAND ----------

print(result)

# COMMAND ----------


