from pyspark.sql import SparkSession
from lib.logger import Log4j
from lib.utils import *

spark = SparkSession.builder.master("local[1]") \
                    .appName('SparkByExamples.com') \
                    .getOrCreate()

logger = Log4j(spark)
logger.info("Starting HelloSpark")

data = [("James","Smith","USA","CA"),("Michael","Rose","USA","NY"), \
    ("Robert","Williams","USA","CA"),("Maria","Jones","USA","FL") \
  ]

columns = ["firstname", "lastname", "country","state"]

df = spark.createDataFrame(data = data,schema=columns)

df.show()

logger.info(df.rdd.collect())

logger.info(df.collect())


first_names=df.rdd.map(lambda x: x[0]).collect()
states=df.rdd.map(lambda x: x[3]).collect()

logger.info(first_names)
logger.info(states)

states2=df.select(df.state).collect()

logger.info(states2)

states3=df.rdd.map(lambda x: x.state).collect()
logger.info(states3)

states4=df.select(df.state).rdd.flatMap(lambda x: x).collect()
logger.info(states4)

states5=df.select(df.state).toPandas()['state']
states6=list(states5)
logger.info(states6)

pandDF=df.select(df.state,df.firstname).toPandas()
logger.info(list(pandDF['state']))
logger.info(list(pandDF['firstname']))