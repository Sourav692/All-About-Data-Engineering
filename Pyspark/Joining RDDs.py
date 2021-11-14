# Databricks notebook source
# MAGIC %md
# MAGIC Types of joins

# COMMAND ----------

firstRdd   = sc.parallelize([(1, 2), (3, 4), (3, 6), (3, 6), (1, 3)])
secondRdd  = sc.parallelize([(3, 9), (2, 3)])

# COMMAND ----------

display(firstRdd.collect())

# COMMAND ----------

display(secondRdd.collect())

# COMMAND ----------

# join: Perform an inner join between two RDDs
print(firstRdd.join(secondRdd).collect())

# COMMAND ----------

# rightOuterJoin: Perform a join between two RDDs where the key must be present in the first RDD
print(firstRdd.rightOuterJoin(secondRdd).collect())

# COMMAND ----------

# leftOuterJoin: Perform a join between two RDDs where the key must be present in the other RDD
print(firstRdd.leftOuterJoin(secondRdd).collect())

# COMMAND ----------

# MAGIC %md
# MAGIC Joining data files

# COMMAND ----------

rawRdd = sc.textFile("/FileStore/tables/weather.csv")
cityRdd = sc.textFile("/FileStore/tables/zips_city.csv")
print(" -- RAW DATA -- ")
print(rawRdd.take(5))
print(" -- CITY INFO -- ")
print(cityRdd.take(5))

# COMMAND ----------

def getZipTemperature(input_record):
  _, zip_code, temperature = input_record.split(",")
  return (int(zip_code), int(temperature))


zipTempRdd = rawRdd.map(getZipTemperature)
maxTempRdd = zipTempRdd.reduceByKey(lambda x, y: max(x, y))

zipsCityRdd = cityRdd.map(lambda x: (int(x.split(",")[0]), x.split(",")[1]))
joinedRdd = zipsCityRdd.join(maxTempRdd)
resultRdd = joinedRdd.map(lambda x: (x[1][0], x[1][1]))

# COMMAND ----------

display(resultRdd.collect())
