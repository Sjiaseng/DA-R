library(ggplot2)
library(dplyr)

dfdata = ggplot2::diamonds

#Question 1a
ggplot(dfdata, aes(x = color)) +
  geom_bar()

#Question 1a
ggplot(dfdata, aes(x = color, fill = color)) +
  geom_bar() +
  geom_text(stat = "count", aes(label = ..count..), vjust = -1)

#Question 1b
ggplot(dfdata, aes(x = carat))+
  geom_histogram(stat = "count")+
  geom_density(aes(y = ..count..), adjust = 4)

#Question 1c
ggplot(dfdata, aes(x = carat))+
  geom_boxplot()

#Question 2
vector = c(1,2,3,4,NA,6,7,8,NA,NA)
min(vector, na.rm = TRUE)
max(vector, na.rm = TRUE)
mean(vector, na.rm = TRUE)
median(vector, na.rm = TRUE)

#Question 3
minutes = c(1,1,1, 3,4, 4, 4,4,5,5,5,5)
sensorReading = c(10,NA,NA,5,NA,11,10,8,7,NA,8,9)
categorical <- c("good", "normal", "bad", NA, "normal", "good", "good", "bad", NA, "good", NA, "good")

mydata = data.frame(minutes, sensorReading, categorical)
mydata

library(DataExplorer)
install.packages("DataExplorer")
plot_missing(mydata)

# Q3 1st Method 
mydata$sensorReading[is.na(mydata$sensorReading)] <- mean(mydata$sensorReading, na.rm = TRUE)
mydata

# Q3 2nd Method
mydata$sensorReading <- replace(mydata$sensorReading, is.na(mydata$sensorReading), mean(mydata$sensorReading, na.rm = TRUE))
mydata

#3rd method
mode <- function(x){
  u <- unique(x)
  tab <- tabulate(match(x,u))
  u[tab == max(tab)]
}

uni <- unique(mydata$categorical)
uni
tab <- tabulate(match(mydata$categorical, uni))
uni[tab == max(tab)]
mydata$categorical[is.na(mydata$categorical)] <- mode(mydata$categorical)
mydata

