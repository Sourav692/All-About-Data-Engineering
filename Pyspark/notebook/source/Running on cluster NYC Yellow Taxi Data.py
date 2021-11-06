'''
7.7 Million records
For the january month of 2019, trip data is here
wget https://s3.amazonaws.com/nyc-tlc/trip+data/yellow_tripdata_2019-01.csv
'''

'''
VendorID
tpep_pickup_datetime
tpep_dropoff_datetime
passenger_count
trip_distance
RatecodeID
store_and_fwd_flag
PULocationID
DOLocationID
payment_type
fare_amount
extra
mta_tax
tip_amount
tolls_amount
improvement_surcharge
total_amount
congestion_surcharge
'''



# Ignore the first record in the first partition
def skipHeader(index, iter):
  current_row_num = -1
  for record in iter:
    current_row_num += 1
    if index == 0 and current_row_num == 0:
      continue
    yield record


trip_rdd = sc.textFile("/tmp/y_tripdata_2019-01.csv")
trip_rdd_without_header = trip_rdd.mapPartitionsWithIndex(skipHeader)

trip_rdd.first()
trip_rdd_without_header.first()

trip_rdd_without_header.cache()

# Get total bill generated per day

def getDateBillPair(trip_data_iter):
	for data in trip_data_iter:
		data_tokens = data.split(",")
		date, total, surcharge = data_tokens[1].split(" ")[0], float(data_tokens[16]), 0 if str(data_tokens[17]) == '' else float(data_tokens[17])
		if date >= "2019-01-01" and date <= "2019-01-31":
			yield (date, total + surcharge)

total_bill_per_day_rdd = trip_rdd_without_header.mapPartitions(getDateBillPair).reduceByKey(lambda x, y: x + y)
for date, bill in total_bill_per_day_rdd.collect():
	print("Date: {}, Total Bill: {}".format(date, bill))


# Get total trip distance per day

def getDateDistancePair(trip_data_iter):
	for data in trip_data_iter:
		data_tokens = data.split(",")
		date, distance = data_tokens[1].split(" ")[0], float(data_tokens[4])
		if date >= "2019-01-01" and date <= "2019-01-31":
			yield (date, distance)

total_distance_per_day_rdd = trip_rdd_without_header.mapPartitions(getDateDistancePair).reduceByKey(lambda x, y: x + y)
for date, bill in total_distance_per_day_rdd.collect():
	print("Date: {}, Total Distance: {}".format(date, bill))


trip_rdd_without_header.unpersist()