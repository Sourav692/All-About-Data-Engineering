2020-01-10,123212,14
2019-02-11,223221,15
2020-03-12,423224,16
2018-02-14,623221,11
2020-01-11,332262,12
2019-01-12,223221,13
2020-02-10,123289,18
2019-02-10,423202,10





year_max_temp_dict = {}

for line in open('/tmp/weather.csv', 'r').readlines():
  full_date, zip, temperature = line.split(",")
  temperature = int(temperature)
  year, month, day = [int(field) for field in full_date.split("-")]
  if year not in year_max_temp_dict:
    curr_max_temp = temperature
  else:
    existing_temp = year_max_temp_dict[year]
    curr_max_temp = max(temperature, existing_temp)
  year_max_temp_dict[year] = curr_max_temp

for year in year_max_temp_dict:
  print("Maximum temperature for the year {} is {}".format(year, year_max_temp_dict[year]))