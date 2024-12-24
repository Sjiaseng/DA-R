#vector

# 1 to 10
v1 = 1:10 ; v1

# vector set
v2 = c(12,34,455,56); v2

# repeat hello 5 times
v3 = rep("hello", 5); v3

# 2 to 100 skip between 15 ints
v4 = seq(2,100,15); v4

# from 1 to 100 take 30 ( T = can repeat)
v5 = sample(1:100,30,T)

# frequency
table(v5)

# with decimal points
v6 = runif(30,0,10);

# round the decimals
v6 = floor(runif(30,0,10));

#frequncy
table(v6)
#index
v6[23]
# true false return
v6<5
# only value fit condition return
v6[v6<5]
# range of value (can assign to a variable)
val = v6[v6 > 5 & v6 < 8] 

v5[val] # index from another variable

v5[length(v5)]

# "-" is exclude / negation
x = v5[v5>80]
str(x)
v5[-x] 

v6[v6 == 4] = 5; # change all int "4" to "5".

# ignore a number in vector
v5[-c(1,2,6)]

# matrix = 2d, same datatype
m1 = matrix(v6,3,10)
# can put in different sequence also
m2 = matrix(ncol=3,nrow=10,data = v6)
# Note: if the argument is specified
v4a = seq(by = 20, from = 0, to = 100)

# list is 1d, different datatype
l1 = list("a", c(1,4,5), v4, rep(T,10), m1)
l1[[3]][5] # slicing, for list/vector etc 
l1[[4]][3:6] = F 

l2 = list(name = "Mary", age = 18, race = "chinese", val = c(23,45,45,2,1), status=T)

# all variable name in list
names(l2);

# accessing a list with datatype contain vectors
l2[[2]]
l2[['age']]
l2$age

# data frame
age = sample(18:23,20,T)
name = sample(LETTERS, 20, F)
location = sample(c("Sri Petaling","Bukit Jalil", "Ampong"), 20, T)

d1 = data.frame(age,name,location)

# add new column
d1 <- cbind(d1,sample(3000:5000,20,T))
# change column name
colnames(d1)[4] = "Salary"

# all column name status with "active" records
d1$Status = "Active"
# delete status column
d1$Status = NULL
#add new row (last row)
rbind(d1, list(30,"ZZ","Serdang","123"))

#data frame :
#every row is a list
#every column is a vector

View(d1)
# matrix[row, column]
d1[d1$age > 20,]
d1[d1$age == 21,]

# show only never update
d1[d1$age == 21,]$Salary + 100
# update the data
d1[d1$age == 21,]$Salary = d1[d1$age == 21,]$Salary + 100
# other method to call column
d1[d1$age == 21,'Salary'] # use column name
d1[d1$age == 21,4] # use index


