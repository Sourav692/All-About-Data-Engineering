# Databricks notebook source
input_rdd = sc.textFile("/FileStore/tables/weather.csv", 2)
selected_fields_rdd = input_rdd.map(lambda line: (int(line.split(",")[0].split("-")[0]), int(line.split(",")[2])))

# COMMAND ----------

max_temperature_rdd = selected_fields_rdd.reduceByKey(lambda x, y: x if x>y else y)

# COMMAND ----------

print("Max temperature RDD: {}".format(max_temperature_rdd.collect()))

# COMMAND ----------

print("Partitioner for the max_temperature_rdd is {}".format(max_temperature_rdd.partitioner.partitionFunc))

# COMMAND ----------

sorted_rdd = max_temperature_rdd.sortByKey()

# COMMAND ----------

print("Sorted RDD: {}".format(sorted_rdd.collect()))

# COMMAND ----------

print("Partitioner for the sorted_rdd is {}".format(sorted_rdd.partitioner.partitionFunc))

# COMMAND ----------

# MAGIC %fs
# MAGIC rm -r /FileStore/output/max_temperature

# COMMAND ----------

# MAGIC %fs
# MAGIC rm -r /FileStore/output/sorted_max_temperature

# COMMAND ----------

max_temperature_rdd.saveAsTextFile("/FileStore/output/max_temperature")

# COMMAND ----------

sorted_rdd.saveAsTextFile("/FileStore/output/sorted_max_temperature")

# COMMAND ----------

# MAGIC %fs
# MAGIC ls /FileStore/output/max_temperature

# COMMAND ----------

# MAGIC %fs
# MAGIC head /FileStore/output/max_temperature/part-00000

# COMMAND ----------

# MAGIC %fs
# MAGIC head /FileStore/output/max_temperature/part-00001

# COMMAND ----------

# MAGIC %fs
# MAGIC ls /FileStore/output/sorted_max_temperature

# COMMAND ----------

print(open("/dbfs/FileStore/output/sorted_max_temperature/part-00000", "r").read())

# COMMAND ----------

print(open("/dbfs/FileStore/output/sorted_max_temperature/part-00001", "r").read())
