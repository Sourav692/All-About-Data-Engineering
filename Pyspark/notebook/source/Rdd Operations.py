# Databricks notebook source
# Creation of RDD from elements in memory

rdd = sc.parallelize([1, 2, 3, 4, 4, 4, 2], 4)
print("created numbers rdd with %d partitions" % rdd.getNumPartitions())

myCollection = "Spark Unified Computation Engine : Big Data Processing Made Simple".split(" ")
words = sc.parallelize(myCollection, 2)
print("created words rdd with %d partitions" % words.getNumPartitions())

# COMMAND ----------

def startsWithS(individual):
  return individual.startswith("S")

# COMMAND ----------

# Apply filter transformation

filteredWords = words.filter(lambda word: startsWithS(word))
filteredWords.collect()

# COMMAND ----------

# Apply map transformation

mapTransformation = words.map(lambda word: (word, word[0], word.startswith("S")))
display(mapTransformation.collect())

# COMMAND ----------

filteredWords = mapTransformation.filter(lambda record: record[2])
display(filteredWords.take(5))

# COMMAND ----------

# Perform sorting
words.sortBy(lambda word: len(word) * -1).collect()

# COMMAND ----------

words.sortBy(lambda word: len(word) * -1).take(2)

# COMMAND ----------

# Perform reduce operation
# Sum of all numbers from 1 to 20
# Sn = n*(n1 + nl) / 2 (Sum of A.P.)

print("Sum of numbers from 1 to 20 is: %d" % sc.parallelize(range(1, 21)).reduce(lambda x, y: x + y))

# COMMAND ----------

# Get the word with the highest length

def wordLengthReducer(leftWord, rightWord):
  if len(leftWord) > len(rightWord):
    return leftWord
  else:
    return rightWord

words.reduce(wordLengthReducer)


# COMMAND ----------

# Apply a function for every partition

def processingFunction(iter):
  result = []
  result.append("Starting the processing...")
  result += [(len(i), i) for i in iter]
  result.append("Finishing the processing!")
  return result 

transformedWords = words.mapPartitions(processingFunction)
for i in transformedWords.collect():
  print(i)

# COMMAND ----------

# Apply a function for every partition, using the information about the index of the partition

def indexedFunc(partitionIndex, withinPartitionIterator):
  return ["partition: {} => {}".format(partitionIndex, x) for x in withinPartitionIterator]

words.mapPartitionsWithIndex(indexedFunc).collect()

# COMMAND ----------

# MAGIC %md
# MAGIC ### Some more actions on rdd

# COMMAND ----------

rdd = sc.parallelize([100, 2, 3, 3, 410, 3, 3, 3, 4, 104, 2])
print("Entire rdd: %s" % rdd.collect())
print("Number of elements in the rdd: %d" % rdd.count())
print("Distinct elements in the rdd: %s" % rdd.distinct().collect())
print("First element in the rdd: %d" % rdd.first())
print("Random two elements in the rdd: %s" % rdd.take(2))
print("Frequency of each element in the rdd: %s" % rdd.countByValue())
print("Maximum element in the rdd: %s" % rdd.max())
print("Minimum element in the rdd: %s" % rdd.min())
print("Bottom 2 elements in the rdd: %s" % rdd.takeOrdered(2))
print("Top 2 elements in the rdd: %s" % rdd.takeOrdered(2, key = lambda x: -x))
