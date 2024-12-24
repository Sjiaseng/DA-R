library(ggplot2)
library(dplyr)
library(nycflights13)

flights = nycflights13::flights

# Question 1
delay_sorted <- flights %>%
  filter(arr_delay >= 180) %>%
  select(flight, arr_delay) 


print(delay_sorted)

# Question 2
flight_data <- flights %>%
  filter(arr_delay >= 180, dep_delay == 0) %>%
  select(flight, arr_delay, dep_delay) 

print(flight_data)

# Question 3
delayed_flights <- flights %>%
  filter(arr_delay >= 60, dep_delay >= 0, (arr_delay - dep_delay) > 50) %>%
  mutate(difference = arr_delay - dep_delay) %>%
  select(flight, arr_delay, dep_delay, difference)

print(delayed_flights)

# Question 4
depart <- flights %>%
  filter(dep_time >= 0 , dep_time  <= 0500) %>%
  select(flight, dep_time) 

print(depart)

# Question 4 Second Method
depart <-flights %>%
  filter(between(dep_time, 0 ,500))

# Question 5
latest <- flights %>%
  filter(arr_delay >= 60, dep_delay >= 0) %>%
  mutate(difference = arr_delay - dep_delay) %>%
  filter(difference == max(difference)) %>%
  select(flight, difference)

print(latest)

# Question 6 
distance <- flights %>%
  filter(air_time == max(air_time, na.rm = TRUE)) %>%
  select(flight, air_time)

print(distance)

# Question 6 & 7 Second Method  
distance -> flights %>%
  arrange(asc(air_time)) %>%
  slice(1)

distance2 -> flights %>%
  arrange(desc(air_time)) %>%
  slice(1)

# Question 7
distance2 <- flights %>%
  filter(air_time == min(air_time, na.rm = TRUE)) %>%
  select(flight, air_time)

print(distance2)

# Question 8
info <- flights %>%
  select(flight, origin, dest)

print(info)

# Rename Using select()
info <- flights %>%
  select(flight_number = flight, origin, destination = dest)

# Remove column using select (minus symbol)
flights %>%
  select(-dep_delay)

flights %>%
  select(-c(dep_delay, arr_delay))

# Question 9
june_flights <- flights %>%
  filter(month == 6 & year == 2013) %>%
  select(flight, origin, dest)

print(june_flights)

# Question 10
max_departure <- flights %>%
  filter(day == 1 & month == 1 & year == 2013) %>%
  filter(dep_delay == max(dep_delay, na.rm = TRUE)) %>%
  select(flight, carrier, origin, dest, dep_delay)

print(max_departure)


