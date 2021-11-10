from pyspark.sql.functions import unix_timestamp, from_unixtime
from pyspark.sql import SparkSession,Window,DataFrame
import datetime
from pyspark.sql.functions import  col, lit, udf, datediff, lead, explode
from pyspark.sql.types import StringType,BooleanType,DateType,LongType,ArrayType
from typing import List
from pyspark.sql.functions import to_date 

spark = SparkSession.builder.appName('SparkByExamples.com').getOrCreate()

# simpleData = [("10-09-2016","1",),
#     ("11-09-2016","2",),
#     ("12-09-2016","3",),
#     ("14-09-2016","4",)
#   ]

# columns = ["startDate","counter"]
# df = spark.createDataFrame(data = simpleData, schema = columns)
# # df.show()
# # df.printSchema()

# df2 = df.withColumn("counter",col("counter").cast(LongType())) \
#     .withColumn("startDate",col("startDate").cast(DateType()))
    
# df2.printSchema()
# df2.show()

simpleData = [("01-01-2006",1),
    ("01-01-2006",2),
    ("01-01-2006",3)
  ]

columns = ["jobStartDate","salary"]
df = spark.createDataFrame(data = simpleData, schema = columns)
df.printSchema()
df.show(truncate=False)

# df2 = df.withColumn("jobStartDate",col("jobStartDate").cast(DateType())) \
#     .withColumn("salary",col("salary").cast(LongType()))

# df2.printSchema()
# df2.show(truncate=False)

df1 = df.select(to_date(df.jobStartDate, 'dd-mm-yyyy').alias('jobStartDate'),"salary")
df1.printSchema()
df1.show(truncate=False)


    
def _get_next_dates(start_date, diff):
    return [start_date + datetime.timedelta(days=days) for days in range(1, diff)]

def get_fill_dates_df(df: DataFrame, date_column: str, group_columns: List[str], fill_column: str) -> DataFrame:
    get_next_dates_udf = udf(_get_next_dates, ArrayType(DateType()))

    window = Window.orderBy(*group_columns, date_column)

    return df.withColumn("_diff", datediff(lead(date_column, 1).over(window), date_column)) \
        .filter(col("_diff") > 1).withColumn("_next_dates", get_next_dates_udf(date_column, "_diff")) \
        .withColumn(fill_column, lit("0")).withColumn(date_column, explode("_next_dates")) \
        .drop("_diff", "_next_dates")


#fill_df = get_fill_dates_df(df1, "jobStartDate", [], "salary")



fill_df.show()
# df3 = df.union(fill_df)
# df3.show()

