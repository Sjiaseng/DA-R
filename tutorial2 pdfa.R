#question 1
data <- c(1,2,2,0,1,2,0,1,2)

converted_data <- factor(data, levels = c(0,1,2), labels = c("low", "medium","high")) 

converted_data2 <- ifelse(data==0,"low",ifelse(data==1,"medium","high"))

#question 2
mymatrix = matrix(c(1,2,3,4), nrow = 2, ncol = 2)
mymatrix

#question 3
another_matrix = matrix(c(1,2,3,4), nrow = 2, ncol = 2)
rownames(another_matrix) = c("Row1","Row2")
colnames(another_matrix) = c("Col1", "Col2")
another_matrix

#question 4
matrix1 = matrix(c(1,2,3,4,5,6), nrow = 2, ncol = 3)
matrix2 = matrix(c(6,5,4,3,2,1), nrow = 2, ncol = 3)

add = matrix1 + matrix2 
subtract = matrix1 - matrix2
multiply = matrix1 * matrix2
divide = matrix1 / matrix2

add
subtract
multiply
divide

#question 5
matrix3 = matrix(c("a","b","c","d","e","f","g","h","i","j","k","l"), nrow = 3, ncol = 4)
rownames(matrix3) = c("Row1","Row2","Row3")
colnames(matrix3) = c("Col1", "Col2","Col3","Col4")
matrix3
matrix3[2,3]
matrix3[3,]
matrix3[,4]

#question 6
matrix4 = matrix(c(1,2,3,4,5,6), nrow = 2, ncol = 3)
number1 = matrix4[2,3]
number2 = matrix4[1,2]

matrix4
result = number1 + number2
result

#question 7
matrix5 = matrix(c("a","b"), nrow = 1, ncol = 2)
matrix6 = matrix(c("c","d","e","f"), nrow = 2, ncol = 2)

combined_matrix1 <- rbind(matrix5, matrix6)

#question 8
matrix7 = matrix(c("a"), nrow = 1, ncol = 1)
matrix8 = matrix(c("b","c"), nrow = 1, ncol = 2)

combined_matrix2 <- cbind(matrix7, matrix8)
combined_matrix2

#question 9
matrix9 = matrix(c(1,2,3,4), nrow = 2, ncol = 2)
min(matrix9)
max(matrix9)

#question 10
matrix10 = matrix(c(1,2,3,4,5,6,7,8,9), nrow = 3, ncol = 3)

max_index <- which(matrix10 == max(matrix10), arr.ind = TRUE)
min_index <- which(matrix10 == min(matrix10), arr.ind = TRUE)

matrix10
max_index
min_index

#question 11
matrix11 = matrix(c("a","b","c","d","e","f","g","h","i"), nrow = 3, ncol = 3)
matrix12 = matrix(c("j","k","l","m","n","o","p","q","r"), nrow = 3, ncol = 3)

combine_array <- array(c(matrix11, matrix12), dim = c(3, 3, 2))
print(combine_array)

#question 12
matrix13 = matrix(c("a","b","c","d","e","f","g","h","i"), nrow = 3, ncol = 3)
matrix14 = matrix(c("j","k","l","m","n","o","p","q","r"), nrow = 3, ncol = 3)
combine_array2 <- array(c(matrix13, matrix14), dim = c(3, 3, 2))
print(combine_array2[2, , 2])
print(combine_array2[3, 3, 1])

#question 13
my_vector <- c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24)
my_3d_array <- array(my_vector, dim = c(2, 3, 4))
print(my_3d_array)

#question 14
vectora <- c("John", "Jane", "Bob", "Alice")
vectorb <- c(25, 30, 22, 28)
vectorc <- c("New York", "Los Angeles", "Chicago", "San Francisco")
vectord <- c(90, 85, 88, 92)
my_data_frame <- data.frame(Name = vectora, Age = vectorb, City = vectorc, Score = vectord)

print(my_data_frame)

#question 15
my_data_frame2 <- data.frame(
  Name = c("John", "Jane", "Bob", "Alice"),
  Age = c(25, 30, 22, 28),
  City = c("New York", "Los Angeles", "Chicago", "San Francisco"),
  Score = c(90, 85, 88, 92)
)
age_column <- my_data_frame2$Age

#question 16
my_data_frame3 <- data.frame(
  Name = c("John", "Jane", "Bob", "Alice"),
  Age = c(25, 30, 22, 28),
  City = c("New York", "Los Angeles", "Chicago", "San Francisco"),
  Score = c(90, 85, 88, 92)
)

first_two_rows <- my_data_frame3[1:2, ]

#question 17
my_data_frame4 <- data.frame(
  Name = c("John", "Jane", "Bob", "Alice"),
  Age = c(25, 30, 22, 28),
  City = c("New York", "Los Angeles", "Chicago", "San Francisco"),
  Score = c(90, 85, 88, 92)
)
my_data_frame4$Gender <- c("Male", "Female", "Male", "Female")
print(my_data_frame4)

#question 18
my_data_frame5 <- data.frame(
  Name = c("John", "Jane", "Bob", "Alice"),
  Age = c(25, 30, 22, 28),
  City = c("New York", "Los Angeles", "Chicago", "San Francisco"),
  Score = c(90, 85, 88, 92)
)

new_row <- data.frame(
  Name = "Eve",
  Age = 26,
  City = "Seattle",
  Score = 95
)

updated_data_frame <- rbind(my_data_frame5, new_row)

#question 19
my_data_frame6 <- data.frame(
  Name = c("John", "Jane", "Bob", "Alice"),
  Age = c(25, 30, 22, 28),
  City = c("New York", "Los Angeles", "Chicago", "San Francisco"),
  Score = c(90, 85, 88, 92)
)

updated_data_frame = subset(my_data_frame6, select = -c(Name))
print(updated_data_frame)

#question 20
vector1 = c("a","b","c")
vector2 = c("d","e","f")
mydataframe <- data.frame(
  Name = c("John", "Jane", "Bob", "Alice")
)
list_data = list("Hello", 1, vector1, vector2, mydataframe)
print(list_data)

#question 21
x <- list(mt = matrix(1:6, nrow = 2), 
          lt = letters[1:8], 
          n = c(1:10))
print(x)
print(x[1])
print(x[2])