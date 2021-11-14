# Databricks notebook source
import json
raw_rdd = sc.textFile("/FileStore/tables/card_transactions.json")
input_rdd = raw_rdd.map(lambda x: json.loads(x)).filter(lambda x: 1580515200 <= x.get("ts") < 1583020800).cache()
display(input_rdd.take(1))

# COMMAND ----------

# MAGIC %md
# MAGIC #### Total amount spent by each user

# COMMAND ----------

user_expense_rdd = input_rdd.map(lambda x: (x.get('user_id'), x.get('amount')))
result_rdd = user_expense_rdd.reduceByKey(lambda x, y: x + y)
display(result_rdd.take(2))

# COMMAND ----------

# MAGIC %md
# MAGIC #### total amount spent by each user for each of their cards

# COMMAND ----------

user_expense_rdd = input_rdd.map(lambda x: ((x.get('user_id'), x.get('card_num')), x.get('amount')))
result_rdd = user_expense_rdd.reduceByKey(lambda x, y: x + y)
display(result_rdd.take(2))

# COMMAND ----------

# MAGIC %md
# MAGIC #### total amount spend by each user for each of their cards on each category

# COMMAND ----------

user_expense_rdd = input_rdd.map(lambda x: ((x.get('user_id'), x.get('card_num'), x.get('category')), x.get('amount')))
result_rdd = user_expense_rdd.reduceByKey(lambda x, y: x + y)
display(result_rdd.take(2))

# COMMAND ----------

# MAGIC %md
# MAGIC #### distinct list of categories in which the user has made expenditure

# COMMAND ----------

def initialize(value):
  return set([value])

def add(agg, value):
  agg.add(value)
  return agg

def merge(agg1, agg2):
  agg1.update(agg2)
  return agg1

# COMMAND ----------

user_category_rdd = input_rdd.map(lambda x: (x.get('user_id'), x.get('category')))
result_rdd = user_category_rdd.combineByKey(initialize, add, merge)
print(result_rdd.take(2))

# COMMAND ----------

# MAGIC %md
# MAGIC #### category in which the user has made the maximum expenditure

# COMMAND ----------

user_expense_rdd = input_rdd.map(lambda x: ((x.get('user_id'), x.get('category')), x.get('amount')))
user_category_expense_rdd = user_expense_rdd.map(lambda x: (x[0][0], (x[0][1], x[1])))

def get_max_amount(category_amount_tuple_1, category_amount_tuple_2):
  if category_amount_tuple_1[1] > category_amount_tuple_2[1]:
    return category_amount_tuple_1
  else:
    return category_amount_tuple_2

result_rdd = user_category_expense_rdd.reduceByKey(lambda x, y: get_max_amount(x, y))
display(result_rdd.take(4))
