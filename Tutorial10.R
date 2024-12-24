library(ggplot2)
library(dplyr)
library(nycflights13)

flights = nycflights13::flights

# Question 1 Note: can use floor(525/100)
minute_flights <- flights %>%
  mutate(dep_time_minutes = (dep_time %/% 100) * 60 + (dep_time %% 100)) %>%
  select(flight, dep_time, dep_time_minutes)

minute_flights

# Question 2
# Mutate will change the value of the column and create a new column
# Transform will change the value of the original column
delay_88 <- flights %>%
  mutate(new_arr_delay = ifelse(flight == 88, arr_delay + 46, arr_delay)) %>%
  filter(flight == 88) %>%
  select(flight, arr_delay, new_arr_delay)

delay_88

# Question 3
carrier_summary <- flights %>%
  group_by(carrier) %>%
  summarize(
    num_flights = n(),
    new_air_time = mean(air_time, na.rm = TRUE),  
    furthest = max(distance),  
    shortest = min(distance)
  ) %>%
  arrange(desc(num_flights))

carrier_summary

# Question 4 Note: can use filter(between(month,6,9))
flight_summary <- flights %>%
  filter(month >= 6 & month <= 9) %>%
  group_by(origin, dest) %>%
  summarize(
    num_flights = n(),
    average = mean(air_time, na.rm = TRUE),
    furthest = max(distance),  
    shortest = min(distance)
  ) %>%
    arrange(desc(num_flights))   
  
flight_summary
  
# Question 5
destination_summary <- flights %>%
  group_by(dest) %>%
  summarize(number_of_carrier = n_distinct(carrier)) %>%
  filter(number_of_carrier >= 5) %>%
  arrange(number_of_carrier)

destination_summary

# Question 6
destination_avg <- flights %>%
  group_by(dest) %>%
  summarise(mean_arr_delay = mean(arr_delay, na.rm = TRUE)) %>%
  filter(mean_arr_delay > 10) %>%
  arrange(mean_arr_delay)

destination_avg

# Question 7
carrier_departure <- flights %>%
  group_by(carrier) %>%
  summarise(mean_dep_delay = mean(dep_delay, na.rm = TRUE)) %>%
  arrange(mean_dep_delay) %>%
  slice(1)

carrier_departure

# Question 8
carrier_highest <- flights %>%
  group_by(carrier) %>%
  summarise(number_of_flight = n()) %>%
  arrange(desc(number_of_flight)) %>%
  slice(1)

carrier_highest
