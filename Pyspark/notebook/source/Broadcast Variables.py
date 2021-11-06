# Databricks notebook source
rawRdd = sc.textFile("/FileStore/tables/weather.csv")
cityRdd = sc.textFile("/FileStore/tables/zips_city.csv")
print(" -- RAW DATA -- ")
print(rawRdd.take(5))
print(" -- CITY INFO -- ")
print(cityRdd.take(5))

# COMMAND ----------

# MAGIC %md
# MAGIC ## Get the maximum temperature for every city

# COMMAND ----------



# COMMAND ----------

# MAGIC %md
# MAGIC ### Reduce side join

# COMMAND ----------

def getZipTemperature(input_record):
  _, zip_code, temperature = input_record.split(",")
  return (int(zip_code), int(temperature))


yearTempRdd = rawRdd.map(getZipTemperature)
maxTempRdd = yearTempRdd.reduceByKey(lambda x, y: max(x, y))

zipsCityRdd = cityRdd.map(lambda x: (int(x.split(",")[0]), x.split(",")[1]))
resultRdd = zipsCityRdd.join(maxTempRdd).map(lambda x: (x[1][0], x[1][1]))
display(resultRdd.collect())


# COMMAND ----------

# MAGIC %md
# MAGIC ### Map side join

# COMMAND ----------

zipsCityDict = {int(x.split(",")[0]): x.split(",")[1] for x in cityRdd.collect()}
print("This dictionary will be broadcasted: {}".format(zipsCityDict))
zipsCityBdct = sc.broadcast(zipsCityDict)

def getCityTemperature(input_record):
  _, zip_code, temperature = input_record.split(",")
  city = zipsCityBdct.value.get(int(zip_code), "NA")
  return (city, int(temperature))


cityTempRdd = rawRdd.map(getCityTemperature)
maxTempRdd = cityTempRdd.reduceByKey(lambda x, y: max(x, y))

display(maxTempRdd.collect())
