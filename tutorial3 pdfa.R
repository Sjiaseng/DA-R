install.packages('readxl')
library("readxl")
?read_excel
exceldata = read_excel("C:\\Users\\user\\Desktop\\Rstudio\\Online Retail.xlsx")                                                                   
class(exceldata)
dfdata = data.frame(exceldata)
dfdata

#quick checks
class(dfdata)
head(dfdata,5)
tail(dfdata,5)
nrow(dfdata)
ncol(dfdata)
dim(dfdata)
summary(dfdata)
colnames(dfdata)
mean(dfdata$Quantity)
mean(dfdata$UnitPrice)
duplicated(dfdata)
dfdata = unique(dfdata)
nrow(dfdata)

install.packages("dplyr")
library("dplyr")

#filter NA data.
dfdata = dfdata %>% filter(!is.na(dfdata$Description) & !is.na(dfdata$StockCode) & !is.na(dfdata$CustomerID) & dfdata$StockCode!='POST')

#question 1
length(unique(dfdata$StockCode))

library(dplyr)
n_distinct(dfdata$StockCode)

#question 2
summarised = dfdata %>% group_by(StockCode) %>% summarise(sum_qty = sum(Quantity))
ordered = summarised %>% arrange(desc(sum_qty))
top5 = head(ordered,5)
top5

#question 3
answer = length(unique(dfdata$Description))
answer

#question 4
customer = dfdata %>% group_by(CustomerID) %>% summarise(sum_qty = sum(Quantity * UnitPrice))
mydata = customer %>% arrange(desc(sum_qty))
customerid = head(mydata,1)
customerid

#question 5
invoice = dfdata %>% group_by(InvoiceNo) %>%  summarise(myamt = n_distinct(StockCode))
mydata = invoice %>% arrange(desc(myamt))
invoiceid = head(mydata, 1)
invoiceid

#question 6
mydata = dfdata %>% group_by(Country, StockCode) %>% summarise(myamt = sum(Quantity)) %>%
arrange(Country, desc(myamt)) %>% group_by(Country) %>% slice(1)

mydata

#question 7
myproduct = dfdata %>% group_by(CustomerID) %>% arrange(StockCode) %>%
summarise(product_pair = toString(unique(StockCode)))

pair_counts = myproduct %>% count(product_pair)

top_pairs = pair_counts %>% arrange(desc(n)) %>% slice(1:2)

top_pairs

#further references (Lab4_Question7.R)
#https://www.analyticsvidhya.com/blog/2021/10/a-comprehensive-guide-on-market-basket-analysis/