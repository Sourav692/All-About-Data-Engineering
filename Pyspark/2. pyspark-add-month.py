from pyspark.sql import SparkSession
from pyspark.sql.functions import *
from pyspark.sql import SparkSession
from lib.logger import Log4j
from lib.utils import *
import pandas as pd

spark = SparkSession.builder.appName('SparkByExamples.com').getOrCreate()

logger = Log4j(spark)

from pyspark.sql.functions import col,expr
data=[("2019-01-23",1),("2019-06-24",2),("2019-09-20",3)]

#Using Sql Way
df1 = spark.createDataFrame(data).toDF("date","increment").select(col("date"),col("increment"),expr("add_months(to_date(date,'yyyy-MM-dd'),cast(increment as int))").alias("inc_date"))
df1.show()
df_pd = df1.toPandas()
#print("df_pd")
#print(df_pd)
logger.info(str(df_pd))

#Using Spark Syntax
# df2 = spark.createDataFrame(data).toDF("date","increment").select(col("date"),col("increment"), add_months(to_date("date",'yyyy-MM-dd'),1).alias("inc_date"))
# df2.show()
# #logger.info(df2.columns)


    