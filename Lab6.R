#question 1
max_value = -Inf;
for (i in 1:5) {
  val = as.integer(readline(prompt = paste("Number", i, ":")));
  if(val > max_value){
    max_value = val
  }
}
paste("Maximum values is: ",max_value);

#question 2
value = 1;

for (i in 1:10){
  val = as.integer(readline(prompt = paste("Number", i, ":")));
  if(val > 0){
    value <- value * val;
  }
}
paste(value);

#question 3
while(TRUE){
  print("Please choose your favourite programming language:");
  print("1. C");
  print("2. Java");
  print("3. VB.NET");
  val = as.integer(readline(prompt = paste("Please enter an integer between 1 and 3: ")));
  x = switch( val, "C" , "Java", "VB.NET");
  print("Your favourite programming language is ", x);
  break;
}

#question 4
myvector = c(1,2,3,4,5);
total = 0;
i = 1;

for(i in myvector){
  total = total + myvector[i]
}
paste(total);

while(i <= length(myvector)){
  total = total + myvector[i];
  i = i + 1 ;
}
paste(total);

repeat
{
  total = total + myvector[i];
  i = i + 1 ;
  if(i > length(myvector))
  {
    break
  }
}
print(total);

#question 5
row = 1;
column = 1;
total = 0;
mymatrix <- matrix(c(1,2,3,4,5), nrow = 1, ncol = 5 );
j = 1;

for(i in mymatrix){
  total = total + mymatrix[row, column];
  column = column + 1;
}
paste(total);


while(j <= length(mymatrix)){
  total = total + mymatrix[row, column];
  column = column + 1;
}
paste(total);

repeat
{
  total = total + mymatrix[row, column];
  column = column + 1 ;
  j = j + 1;
  if(j > ncol(mymatrix))
  {
    break;
  }
}
print(total);

#take home exercise
url <- "http://stat.ethz.ch/Teaching/Datasets/WBL/legierung.dat" 
data <- read.table(url, header = TRUE) 

#question 1
vector = c(unique(data$temp))
vector

#question 2
data$breaking.class <- ifelse(data$breaking > mean(data$breaking), "high", "low")
data$breaking.class

#question 3
count_low <- sum(data$breaking.class == "low")
print(count_low)

#question 4
breaking = c(data$breaking);
total = 0;
count = 0;


for(i in breaking){
  total = total + i;
  if(total >= 250){
    count = count + 1;
    total = 0;
  }
}
print(count)


