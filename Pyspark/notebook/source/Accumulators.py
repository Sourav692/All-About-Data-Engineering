# Databricks notebook source
rawRdd = sc.textFile("/FileStore/tables/ebook.txt")

# COMMAND ----------

# MAGIC %md
# MAGIC ### With caching

# COMMAND ----------

rawRdd.cache()  # This will save this RDD in memory when the first action is called

wordsRdd = rawRdd.flatMap(lambda x: [] if x == "" else x.split(" "))
pairRdd = wordsRdd.map(lambda x: (x, 1))
wordCountRdd = pairRdd.reduceByKey(lambda x, y: x + y)

print("A sample word-count from the output rdd: %s" % wordCountRdd.take(1))
print("Number of blank lines: %d" % rawRdd.filter(lambda x: x == "").count())
print("Number of valid lines: %d" % rawRdd.filter(lambda x: x != "").count())
print("Number of short lines: %d" % rawRdd.filter(lambda x: x != "" and len(x.split(" ")) < 5).count())
print("Number of long lines: %d" % rawRdd.filter(lambda x: len(x.split(" ")) >= 5).count())
print("Number of words: %d" % wordsRdd.count())

# COMMAND ----------

# MAGIC %md
# MAGIC ### With accumulators

# COMMAND ----------

# Initialize the accumulators to 0

blank_lines = sc.accumulator(0)
valid_lines = sc.accumulator(0)
short_lines = sc.accumulator(0)
long_lines  = sc.accumulator(0)
num_words   = sc.accumulator(0)

# COMMAND ----------

# Define a method to generate words from lines, updating the accumulators at the same time

def generate_words(line):
	# Make the global variable accessible
	global blank_lines, valid_lines, short_lines, long_lines, num_words
	if line == "":
		blank_lines += 1
		return []
	else:
		valid_lines += 1
		words = line.split(" ")
		num_words += len(words)
		if len(words) < 5:
			short_lines += 1
		else:
			long_lines += 1
		return words

# COMMAND ----------

rawRdd.unpersist()  # This will unpersist this RDD from memory

wordsRdd = rawRdd.flatMap(generate_words)
pairRdd = wordsRdd.map(lambda x: (x, 1))
wordCountRdd = pairRdd.reduceByKey(lambda x, y: x + y)


# COMMAND ----------

print("A sample word-count from the output rdd: %s" % wordCountRdd.take(1))
print("Number of blank lines: %d" % blank_lines.value)
print("Number of valid lines: %d" % valid_lines.value)
print("Number of short lines: %d" % short_lines.value)
print("Number of long lines: %d" % long_lines.value)
print("Number of words: %d" % num_words.value)
