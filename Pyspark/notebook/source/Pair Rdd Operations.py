# Databricks notebook source
# Create a pair rdd
pairRdd = sc.parallelize([(1, 2), (3, 4), (3, 6), (3, 6), (1, 3)])
print("Created pair rdd with %d partitions" % pairRdd.getNumPartitions())

# COMMAND ----------

# MAGIC %md
# MAGIC ## Transformations over Pair RDD

# COMMAND ----------

# mapValues: Apply a function to each value of a pair RDD
display(pairRdd.mapValues(lambda x: x * 10).collect())

# COMMAND ----------

# flatMapValues: Apply a function that returns an iterator to each value of a pair RDD, and for each element returned, produce a key/value entry with the old key
# pairRdd = sc.parallelize([(1, 2), (3, 4), (3, 6), (3, 6), (1, 3)])

display(pairRdd.flatMapValues(lambda x: range(0, x)).collect())

# COMMAND ----------

# keys: Return an RDD of just the keys
print(pairRdd.keys().collect())

# COMMAND ----------

# values: Return an RDD of just the values
print(pairRdd.values().collect())

# COMMAND ----------

# sortByKey: Return an RDD sorted by the key
display(pairRdd.sortByKey().collect())

# COMMAND ----------

# reduceByKey: Combine values with the same key
display(pairRdd.reduceByKey(lambda x, y: x + y).collect())

# COMMAND ----------

# groupByKey: Group values with the same key
print("-- Retrieving the values present in the iterable --")
for g, v in pairRdd.groupByKey().collect():
  print("Group = {}, Values = {}".format(g, list(v)))

# COMMAND ----------

firstRdd   = sc.parallelize([(1, 2), (3, 4), (3, 6), (3, 6), (1, 3)])
secondRdd  = sc.parallelize([(3, 9), (2, 3)])

# COMMAND ----------

display(firstRdd.collect())

# COMMAND ----------

display(secondRdd.collect())

# COMMAND ----------

# subtractByKey: Remove elements with a key present in the other
display(firstRdd.subtractByKey(secondRdd).collect())

# COMMAND ----------

# cogroup: Group data from both RDDs sharing the same key
# firstRdd   = sc.parallelize([(1, 2), (3, 4), (3, 6), (3, 6), (1, 3)])
# secondRdd  = sc.parallelize([(3, 9), (2, 3)])

for g, (left_v, right_v) in firstRdd.cogroup(secondRdd).collect():
  print("Group = {}, Values from the left side = {}, Values from the right side = {}".format(g, list(left_v), list(right_v)))

# COMMAND ----------

# MAGIC %md
# MAGIC ## Actions over pair rdd

# COMMAND ----------

# pairRdd = sc.parallelize([(1, 2), (3, 4), (3, 6), (3, 6), (1, 3)])

print(pairRdd.countByKey())

# COMMAND ----------

print(pairRdd.collectAsMap())

# COMMAND ----------

print(pairRdd.lookup(3))

# COMMAND ----------

# MAGIC %md
# MAGIC Creating a pair RDD from an RDD of individual elements

# COMMAND ----------

rdd = sc.parallelize([100, 2, 3, 3, 410, 3, 3, 3, 4, 104, 2])

# Sum all the low numbers and all the high numbers
# Number less than 100 is low else high

print("Pair RDD = %s" % rdd.keyBy(lambda x: 'low' if x < 100 else 'high').collect())
print("Sum RDD = %s" % rdd.keyBy(lambda x: 'low' if x < 100 else 'high').reduceByKey(lambda x, y: x+y).collect())

groupedValues = rdd.groupBy(lambda x: 'low' if x < 100 else 'high').collect()
for g, v in groupedValues:
  print("Group: {}, Values: {}".format(g, list(v)))

# COMMAND ----------

# MAGIC %md
# MAGIC ## Examples

# COMMAND ----------

# MAGIC %md
# MAGIC ### Get the frequency of each word in a file

# COMMAND ----------

# Get the word count

linesCollection = "apple cherry orange\norange cherry mango".split("\n")
lines = sc.parallelize(linesCollection, 2)

# COMMAND ----------

lines.flatMap(lambda line: line.split(" ")).collect()

# COMMAND ----------

resultRdd = lines.flatMap(lambda line: line.split(" "))\
                 .map(lambda word: (word, 1))\
                 .reduceByKey(lambda x, y: x + y)\
                 .collect()
display(resultRdd)

# COMMAND ----------

# However in this specific counting demo, we could have used countByValue() method

resultRdd = lines.flatMap(lambda line: line.split(" "))\
                 .countByValue()
print(resultRdd)

# COMMAND ----------

# MAGIC %md
# MAGIC Reading from an input file and generate word count

# COMMAND ----------

rawRdd = sc.textFile("/FileStore/tables/ebook.txt")
wordsRdd = rawRdd.flatMap(lambda x: x.split(" "))
pairRdd = wordsRdd.map(lambda x: (x, 1))
wordCountRdd = pairRdd.reduceByKey(lambda x, y: x + y)
display(wordCountRdd.take(10))


# COMMAND ----------

# MAGIC %md
# MAGIC ### Get the maximum temperature for every year

# COMMAND ----------

def getYearTemperature(input_record):
  full_date, zip_code, temperature = input_record.split(",")
  year, month, day = [int(elem) for elem in full_date.split("-")]
  return (int(year), int(temperature))


rawRdd = sc.textFile("/FileStore/tables/weather.csv")
yearTempRdd = rawRdd.map(getYearTemperature)
maxTempRdd = yearTempRdd.reduceByKey(lambda x, y: max(x, y))
display(maxTempRdd.collect())
