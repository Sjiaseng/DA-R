rm(list = ls())
shell("cls")

library(readxl)
library(arules)
library(arulesViz)
library(dplyr)

install.packages('readxl')
install.packages('arules')
install.packages('arulesViz')
install.packages('dplyr')

#load data and do some check 
exceldata = read_excel("C:\\Users\\user\\Desktop\\Rstudio\\Online Retail.xlsx")                                                                            
dfdata = data.frame(exceldata)

#quick check
summary(dfdata)
glimpse(dfdata)
dim(dfdata)

#remove duplicate rows
dfdata = unique(dfdata)
nrow(dfdata)

#remove rows with stockcode == 'POST'
dfdata = dfdata %>% filter(StockCode!='POST')
nrow(dfdata)

# do some cleaning - remove any rows with empty columns
dfdata <- dfdata[complete.cases(dfdata),]
nrow(dfdata)

head(dfdata,10)

#Question 7 - Which are the two products that have customers purchased together often?
#Market Basket Analysis

#order the records based on invoice number
dfdata <- dfdata[order(dfdata$InvoiceNo),]
head(dfdata,10)

# Write our dataframe to a csv file
write.csv(dfdata, "OnlineRetail_MarketBasket.csv")

# Read that csv back as transaction records
trans <- read.transactions(
  file = "OnlineRetail_MarketBasket.csv",
  format = "single",
  header=TRUE,
  sep = ",",
  cols=c("InvoiceNo","StockCode"),
  rm.duplicates = TRUE
)
apriori(trans,parameter=list(support=0.001,confidence=0.9)) -> rules
rules <- sort(rules, by='confidence', decreasing = TRUE)
inspect(rules[1:10])

#----
class(trans)
summary(trans)
inspect(head(trans))
itemFrequency(trans)
itemFrequencyPlot(trans,topN=15,type="absolute")
summary(rules)
