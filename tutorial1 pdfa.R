#part 1
5+17
10-7
4*3*5
18/9
9%%4
(5*8)+(12-7)

#part 2
weeks <- 4
hoursPerWeek = 40
assign('hourlyRate',50)
x = 100
rm(x)

#part 3
a = TRUE
b = FALSE
class(a)
is.logical(a)
a

class(b)
is.logical(b)
b

name = 'kulo'
class(name)
is.character(name)
is.integer(name)
is.numeric(name)

#part 4,5,6 + take home ques 1
test_marks = c(25,10,5,20,25)
test_marks

exam_marks = c(60,25,0,50,60)
exam_marks

total_marks = test_marks + exam_marks
total_marks

pass = total_marks >= 50
pass

names(total_marks) <- c('a','b','c','d','e')
print(total_marks)
length(total_marks)

#part 7
min(total_marks)
max(total_marks)
mean(total_marks)
median(total_marks)

#take home ques 2
round(547.8)
length(total_marks)
sqrt(9)
substr('abcd',2,4)
strsplit('hello world', ' ')
paste('welcome to', 'PFDA')
nchar('hello')