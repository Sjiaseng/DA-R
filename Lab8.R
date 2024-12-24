library(ggplot2);
library(dplyr);
library(nycflights13);
library(gapminder);

dfdata = ggplot2::economics

#Question 1a
ggplot (dfdata, aes(x = date, y = pop)) +
  geom_line() +
  xlab("Year") + 
  ylab("Total Population") + 
  ggtitle("Month of Data Collection")

#Question 1b
newdfdata = dfdata %>% filter(date < "2005-01-01")

#Question 2a
flights = nycflights13::flights
head(flights)

ggplot (flights, aes(x = carrier)) +
  geom_bar(stat = "count");

#Question 2b
ggplot (flights, aes(x = dep_delay)) +
  geom_bar(stat = "count");

#Question 2c
ggplot (flights, aes(x = arr_delay)) +
  geom_freqpoly();

#Question 2d
ggplot (flights, aes(x = arr_delay, y = dep_delay)) +
  geom_line()

#Question 2e
ggplot (flights, aes(x = origin, y = dest)) +
  geom_count()

#Question 2f
ggplot (flights, aes(x = origin, y = dep_delay, fill = origin)) +
  geom_boxplot()

#Question 2g
ggplot (flights, aes(x = dep_delay, fill = carrier, group = carrier)) +
  geom_histogram(binwidth = 20, alpha = 0.6)
  ylim(0, 20000)

#Question 2h
ggplot (flights, aes(x = dep_delay, fill = carrier)) +
  geom_histogram(binwidth = 20 , alpha = 0.6) +
  facet_wrap(~carrier, scales = "free")

# facet_grid (all in one scale)
# facet_wrap(might have different scale for each distribution)
# alpha (transparency)
# scales = "free"
# ylim(0,20000)
