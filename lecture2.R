library(ggplot2);
library(dplyr);
library(nycflights13);
library(gapminder);

# data set
dfdata = nycflights13::flights
dfdata = head(dfdata)

# Question 1

# line graph
ggplot (dfdata, aes(x = air_time, y = distance)) +
  geom_line();

# path graph
ggplot (dfdata, aes(x = air_time, y = distance)) +
  geom_path();

# bar graph
ggplot (dfdata, aes(x = air_time, y = distance)) +
  geom_bar();

# histogram
ggplot (dfdata, aes(x = air_time)) +
  geom_histogram();

# frequency polygon
ggplot (dfdata, aes(x = air_time)) +
  geom_freqpoly();

# box plot 
ggplot (dfdata, aes(x = air_time)) +
  geom_boxplot();

ggplot (dfdata, aes(x = carrier, y = flight)) +
  geom_boxplot();

# scatter plot
ggplot (dfdata, aes(x = air_time, y = distance)) +
  geom_point();

# count plot
ggplot (dfdata, aes(x = air_time, y = distance)) +
  geom_count();

# question 2 & 3

ggplot(dfdata, aes(x = air_time, y = distance, color = dest, shape = dest)) +
  geom_point() +
  xlab("Air TIme") + # x axis
  ylab("Distance") + # y axis
  ggtitle("Air Time vs Distance") + # graph title
  facet_wrap(~dest)
