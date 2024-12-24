#install.packages("summarytools")

library(dplyr)
library(ggplot2)
library(summarytools)

# Descriptive Analysis

dfsummary(iris)
descr(iris)
descr(iris$Sepal.Length)  # summary
Freq(iris$Sepal.Length) # frequency table
var(iris$Sepal.Length) # variance
sd(iris$Sepal.Length) # standard deviation

# interquatile range
q1 <- quantile(iris$Sepal.Length, 0.25)
q3 <- quantile(iris$Sepal.Length, 0.75)
iqr <- q3 - q1
message("1st Quartile:", q1)
message("Interquartile Range:", iqr)

# correlationship
sepalCor <- cor(iris$Sepal.Length, iris$Sepal.Width)
cor_matrix <- cor(iris[c(1,2,3,4)])
df1 = as.data.frame(as.table(cor_matrix)) # generate other table

# geom_tile(), scale_fill_gradient(), theme_minimal()

# linear model
model <- lm(Sepal.Length~Petal.Length, data = iris)
summary(model)

# Factor Analysis

# install.packages("psych")

# library(psych)
# library(MASS)

# Factorial Analysis
# Discriminant Analysis









