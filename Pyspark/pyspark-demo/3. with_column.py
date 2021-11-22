from pyspark.sql import SparkSession
from pyspark.sql.functions import *
from pyspark.sql import SparkSession
from lib.logger import Log4j
from lib.utils import *

spark = SparkSession.builder.appName('SparkByExamples.com').getOrCreate()

logger = Log4j(spark)

data = [('James','Smith','M',3000),
  ('Anna','Rose','F',4100),
  ('Robert','Williams','M',6200), 
]

columns = ["firstname","lastname","gender","salary"]
df = spark.createDataFrame(data=data, schema = columns)
df.show()
logger.info(f"Columns in initial dataframe {df.columns}")

df1 = df.withColumn("bonus_percent",lit(0.5))
df1.show()
logger.info(f"Columns in dataframe1 {df1.columns}")

df2 = df1.withColumn("bonus_amount", col("salary")*0.3)
df2.show()
logger.info(f"Columns in dataframe2 {df2.columns}")

df3 = df2.withColumn("Full Name", concat(col("firstname"),lit(" "),col("lastname")))
df3.show()
logger.info(f"Columns in dataframe3 {df3.columns}")

df4 = df.withColumn("name", concat_ws(",","firstname",'lastname'))
df4.show()
logger.info(f"Columns in dataframe4 {df4.columns}")

#Add current date
from pyspark.sql.functions import current_date
df.withColumn("current_date", current_date()) \
  .show()


from pyspark.sql.functions import when
df.withColumn("grade", \
   when((df.salary < 4000), lit("A")) \
     .when((df.salary >= 4000) & (df.salary <= 5000), lit("B")) \
     .otherwise(lit("C")) \
  ).show()
    
# Add column using select
df.select("firstname","salary", lit(0.3).alias("bonus")).show()
df.select("firstname","salary", lit(df.salary * 0.3).alias("bonus_amount")).show()
df.select("firstname","salary", current_date().alias("today_date")).show()

#Add columns using SQL
df.createOrReplaceTempView("PER")
spark.sql("select firstname,salary, '0.3' as bonus from PER").show()
spark.sql("select firstname,salary, salary * 0.3 as bonus_amount from PER").show()
spark.sql("select firstname,salary, current_date() as today_date from PER").show()
spark.sql("select firstname,salary, " +
          "case salary when salary < 4000 then 'A' "+
          "else 'B' END as grade from PER").show()