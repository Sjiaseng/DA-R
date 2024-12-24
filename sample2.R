install.packages("summarytools")
library(summarytools)
library(dplyr)
library(ggplot2)
data(iris)
View(iris)
#descriptive analysis
#========================
#summarize and present the dataset attributes in a meaningful and understandable.
#overall description of your data (min, max...)
#An overview of the data's main features, patterns, and trends. 
#data understand, explore, present, decision making - distribution of data.
#compare, generate hyphothesis, clean etc.
#summary, mean, max, median, min, sum, nrow etc.
dfSummary(iris) #summary()
descr(iris)
descr(iris$Sepal.Length) # summary
freq(iris$Sepal.Length) #like table - frequency


#dispersion analysis
#=====================
#for distribution and variability of data.
#spread or dispersion of a set of data points around the average value.
#near to zero (equal mean)
var(iris$Sepal.Length) #variance

# measure of the dispersion or spread of data points around the mean. 
#square root of the variance.
sd(iris$Sepal.Length) # standard deviation

#interquatile range
q1 <- quantile(iris$Sepal.Length, 0.25)
q3 <- quantile(iris$Sepal.Length, 0.75)
iqr <- q3 - q1
message("1st Quartile:", q1)
message("3rd Quartile", q3)
message("Interquartile Range:", iqr)

#regression analysis 
#returns : correlation matrix or a single correlation coefficient 
#result: 0->1 (strong(close to 1) positive relationship, both variable increase),
#result: 0->-1 (strong(close to -1) negative linear relationship, 1 variable increase and 1 variable decrease)
sepalCor <- cor(iris$Sepal.Length, iris$Sepal.Width)
print(paste("Correlation between sepal length and width", sepalCor))
iris %>% ggplot(aes(x = Sepal.Length, y = Sepal.Width)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  labs(title = "Scatter Plot - Correlation",
       x = "Sepal length (Length)",
       y = "Sepal Width (Width)")
  
cor_matrix <- cor(iris[c(1,2,3,4)]) #many variables
print(cor_matrix)
View(cor_matrix)
df1 = as.data.frame(as.table(cor_matrix))
View(df1)

df1 %>% ggplot(aes(x = Var1, y = Var2, fill = Freq)) +
  geom_tile() +
  scale_fill_gradient(low = "white", high = "blue") +
  theme_minimal() +
  labs(title = "Correlation on iris variables")


model <- lm(Sepal.Length~Petal.Length, data=iris) 
summary(model)
#or
ggplot(iris, aes(x = Petal.Length, y = Sepal.Length)) +
  geom_point() +                         # Add scatter points
  geom_smooth(method = "lm", formula = y ~ x, se = FALSE, color = "blue") +  # Add linear regression line
  labs(title = "Scatter Plot with Linear Regression Line",
       x = "Petal Length",
       y = "Sepal Length")


#factor analysis
#==================
install.packages("psych")
library(psych)
factres <- fa(r = iris[,c(1:4)],
         nfactors = 4,
         rotate = "varimax") # 4 factor with orthogonal rotation method
summary(factres)
print(factres)

# Discriminant Analysis - using Linear Discriminant Analysis
library(MASS)
#detect if the within-class covariance matrix is singular
lda_result <- lda(Species ~ ., data = iris)
print(lda_result)
LDA_prediction=predict(lda_result)
conf_matrix <- table(LDA_prediction$class, iris$Species)
print(conf_matrix) # classification to evaluate the performance of a predictive model.
summary(conf_matrix)

#time series 
library(nycflights13)
View(flights)
flights$date <- as.Date(paste(flights$year, flights$month, flights$day, sep = "-"))
#departure delay
updatedFlight = flights[flights$dep_delay>0,]

View(updatedFlight)
depDeplaybyMonth <-updatedFlight %>% 
  filter(!is.na(month)) %>% 
  group_by(month) %>% 
  summarise(count = n())
View(depDeplaybyMonth)
ts(depDeplaybyMonth$count, start = depDeplaybyMonth$month, frequency = 12)
depDeplaybyMonth %>% ggplot(aes(x = month, y = count )) +
  geom_line() +
  scale_x_continuous(breaks = 1:12) + #fixed the x-axis value
  labs(title = "departure delay in 2013",
       x = "Month",
       y = "Frequency") 


# ANN
install.packages("neuralnet")
library(neuralnet)
library(caret)
View(iris)
# Setosa col data (setosa -1 vs. non-setosa - 0)
iris$Setosa <- ifelse(iris$Species == "setosa", 1, 0)

# Split the dataset into training and testing sets
set.seed(123)
sampleData <- createDataPartition(iris$Setosa, p = 0.8, list = FALSE)
trainData <- iris[sampleData, ]
testData <- iris[-sampleData, ]

# Train ANN model
ann_model <- neuralnet(
  Setosa ~ Sepal.Length + Sepal.Width + Petal.Length + Petal.Width,
  data = trainData,
  hidden = c(5, 3),  #hidden layers # and neurons# in each layer
  linear.output = TRUE
)

# Make predictions using test set
predictions <- predict(ann_model, newdata = testData, type = "response")
predicted_classes <- ifelse(predictions > 0.8, 1, 0)

# Evaluate the model
conf_matrix <- confusionMatrix(factor(predicted_classes), factor(testData$Setosa))
print(conf_matrix)


#decision Tree 
#================
install.packages("rpart")
install.packages("rpart.plot")
library(rpart)
library(rpart.plot)
treeModel = rpart(Species ~ ., data = iris)
print(treeModel)
summary(treeModel)
rpart.plot(treeModel, type = 2, extra = 1, nn = TRUE) # extra (0-9), type (0-5), nn => node number

#evolutionary programming (Genetic Algorithm)
install.packages("GA")
library(GA)

# set initial parameter values - basedon existing data
initial_params <- c(
  a = mean(iris$Sepal.Length)^2,
  b = mean(iris$Sepal.Width),
  c = mean(iris$Petal.Length)
)

funQuadratic <- function(arg) {
  a <- arg[1]
  b <- arg[2]
  c <- arg[3]
  return(sum((iris$Sepal.Length^2 - a * iris$Sepal.Length - b)^2) + c)
}
set.seed(123)

# execute Genetic Algorithm
ga_result <- ga(
  type = "real-valued",
  fitness = funQuadratic,
  lower = c(0, 0, 0),
  upper = c(10, 10, 10),
  popSize = 50,
  maxiter = 100,
  run = 100,
  pcrossover = 0.8,
  pmutation = 0.1,
  elitism = 2
)

# Print the best solution 
cat("Best solution:", ga_result@solution, "\n")
cat("fitness value:", ga_result@fitnessValue, "\n")

plot(ga_result)


#for hypothesis testing - h1 , h0
#========================
#other way to test the relationship between variables 
#review the statistic figure and p-value provided.
#ANOVA (Analysis of Variance) : compare means across multiple groups
#Chi-Square Test : association between categorical variables
#t-test : compare means between two groups.


#H0: The mean of sepal length for both "setosa" and "versicolor" species are equal.
#H1: The mean of sepal length for both "setosa" and "versicolor" species are not equal.

tTest <- t.test(iris$Sepal.Length[iris$Species == "setosa"], iris$Sepal.Length[iris$Species == "versicolor"])
print(tTest)
#p-value < 2.2e-16 (very small)
#conclusion : reject H0



