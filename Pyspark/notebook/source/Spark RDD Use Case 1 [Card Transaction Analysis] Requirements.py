# Databricks notebook source
# MAGIC %md
# MAGIC 1. Read the file from storage (__/FileStore/tables/card_transactions.json__)
# MAGIC 2. File has json records
# MAGIC 3. Each record has fields:
# MAGIC     * user_id
# MAGIC     * card_num
# MAGIC     * merchant
# MAGIC     * category
# MAGIC     * amount
# MAGIC     * ts

# COMMAND ----------

# MAGIC %md
# MAGIC For the one month (1st Feb to 29th Feb 2020: __1580515200 <= ts < 1583020800__), perform below analysis:
# MAGIC 1. Get the total amount spent by each user
# MAGIC 2. Get the total amount spent by each user for each of their cards
# MAGIC 3. Get the total amount spend by each user for each of their cards on each category
# MAGIC 4. Get the distinct list of categories in which the user has made expenditure
# MAGIC 5. Get the category in which the user has made the maximum expenditure
