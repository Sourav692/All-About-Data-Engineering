# Databricks notebook source
# MAGIC %md
# MAGIC ## Performing multiple aggregations on data

# COMMAND ----------

# MAGIC %md
# MAGIC ### Get the maximum temperature for every year

# COMMAND ----------

def getYearTemperature(input_record):
  full_date, zip_code, temperature = input_record.split(",")
  year, month, day = [int(elem) for elem in full_date.split("-")]
  return (year, int(temperature))


rawRdd = sc.textFile("/FileStore/tables/weather.csv")
yearTempRdd = rawRdd.map(getYearTemperature)
maxTempRdd = yearTempRdd.reduceByKey(lambda x, y: max(x, y))
display(maxTempRdd.collect())

# COMMAND ----------

# MAGIC %md
# MAGIC ### Get the maximum temperature for every month

# COMMAND ----------

def getMonthTemperature(input_record):
  full_date, zip_code, temperature = input_record.split(",")
  _, month, _ = [int(elem) for elem in full_date.split("-")]
  return (month, int(temperature))


monthTempRdd = rawRdd.map(getMonthTemperature)
maxTempRdd = monthTempRdd.reduceByKey(lambda x, y: max(x, y))
display(maxTempRdd.collect())

# COMMAND ----------

# MAGIC %md
# MAGIC ### Get the maximum temperature for every zip code

# COMMAND ----------

def getZipTemperature(input_record):
  _, zip_code, temperature = input_record.split(",")
  return (int(zip_code), int(temperature))


zipTempRdd = rawRdd.map(getZipTemperature)
maxTempRdd = zipTempRdd.reduceByKey(lambda x, y: max(x, y))
display(maxTempRdd.collect())

# COMMAND ----------

# MAGIC %md
# MAGIC ## Persisting the RDD to avoid multiple reads

# COMMAND ----------

from pyspark.storagelevel import StorageLevel
rawRdd.persist(StorageLevel.MEMORY_ONLY)

# Ref: https://spark.apache.org/docs/latest/api/python/_modules/pyspark/storagelevel.html

# COMMAND ----------

# MAGIC %md
# MAGIC ### View the stage plan to verify if cache is being read

# COMMAND ----------

yearTempRdd = rawRdd.map(getYearTemperature)
maxTempRdd = yearTempRdd.reduceByKey(lambda x, y: max(x, y))
display(maxTempRdd.collect())

# COMMAND ----------

monthTempRdd = rawRdd.map(getMonthTemperature)
maxTempRdd = monthTempRdd.reduceByKey(lambda x, y: max(x, y))
display(maxTempRdd.collect())

# COMMAND ----------

zipTempRdd = rawRdd.map(getZipTemperature)
maxTempRdd = zipTempRdd.reduceByKey(lambda x, y: max(x, y))
display(maxTempRdd.collect())

# COMMAND ----------

rawRdd.unpersist()
