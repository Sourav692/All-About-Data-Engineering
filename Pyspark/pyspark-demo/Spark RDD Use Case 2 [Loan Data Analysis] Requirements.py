# Databricks notebook source
# MAGIC %md
# MAGIC __Input__
# MAGIC 1. Configuration JSON file: (JSON file Consists of input file location, output file location, delimiter in the actual data file)
# MAGIC   - The configuration file is at: __/FileStore/tables/auto_loan.json__
# MAGIC 2. Auto Loan Datasets: 
# MAGIC It has following fields
# MAGIC   - application_id
# MAGIC   - customer_id
# MAGIC   - car_price
# MAGIC   - car_model
# MAGIC   - customer_location
# MAGIC   - request_date
# MAGIC   - loan_status
# MAGIC 
# MAGIC 3. The input location and delimiter is present in the configuration file (Hint: Use *sc.wholeTextFiles* to read the configuration file and then parse it using the json module)
# MAGIC 
# MAGIC 4. The first line of the file is the header

# COMMAND ----------

# MAGIC %md
# MAGIC __Perform following analysis__
# MAGIC 
# MAGIC 1. The month in which maximum loan requests were submitted in the last one year [2019-04-01 to 2020-03-31]
# MAGIC 
# MAGIC 2. Max, Min and Average number of applications submitted per customer id
# MAGIC 
# MAGIC 3. Top 10 highest car price against which applications got approved
# MAGIC 
# MAGIC 4. For each customer location, top 5 car models which have most loan applications
