library(dplyr)
library(ggplot2)
library(summarytools)

# Question 1
dfdata = datasets::sleep
dfdata

# Question 2
nrow(dfdata)
ncol(dfdata)
summary(dfdata)
descr(dfdata)
size = object.size(dfdata)
print(size)
dim(dfdata)

# Question 3
str(dfdata)
# datatype of extra = number
# datatype of group = factor
# datatype of ID = factor
# group discrete
# id discrete
# extra continuous
ggplot(dfdata, aes(x = ID_numeric))+ geom_histogram()

# Question 4
aggregate(dfdata,extra~group, mean)
aggregate(dfdata,extra~group, max)


# Question 5
dfdata$group_numeric <- as.numeric(factor(dfdata$group))
dfdata$ID_numeric <- as.numeric(factor(dfdata$ID))

res = boxplot(dfdata$extra)
print(res$out)
# There are no Outliers.

# Question 6
missing_values <- sapply(dfdata, function(x) sum(is.na(x)))
missing_values
# no missing values

# Question 7
variance = var(dfdata[dfdata$group == "1", "extra"])
variance

# Question 8
correlation = cor(dfdata$ID_numeric, dfdata$extra)
correlation

# Question 9
ggplot(dfdata, aes(x = ID_numeric, y = extra))+
  geom_point()

dfdata$increment_hours <- dfdata$extra - dfdata$extra[1] 

ggplot(dfdata, aes(x = increment_hours, fill = group)) +
  geom_histogram() 

# Question 10
ggplot(dfdata, aes(x = group, y = increment_hours, fill = group)) +
  geom_boxplot()

