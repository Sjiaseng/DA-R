#example 1
display <- function(){
  print("Welcome to PFDA Class!")
}

display()

#example 2
twosum <- function (x , y){
  z = x + y;
  return(z);
}

twosum(9,10)

#default argument
twosum <- function (x , y = 9){
  z = x + y;
  return(z);
}
twosum(5) # default for y is 9
twosum(5, 10) # can change default argument

# example 3
two_sum <- function(){
  x = 5;
  y = 9;
  z = x + y; 
  return(z);
}


#example 4
two_sum <- function(){
  x = as.integer(readline(prompt = "Enter your first number: "))
  y = as.integer(readline(prompt = "Enter your second number: "))
  z = x + y;
  return(z);
}

#example 5
calculation <- function(x,y){
  add = x + y
  sub = x - y
  mul = x * y
  div = x / y
  return(c(Addition = add, Subtraction =  sub, Multiplication = mul, Division = div))
}

calculation(1,2)

library(zeallot)

#unpack example 5
c(add, sub, mul, div) %<-% calculation(4,2)


#question 1 

question1 <- function(){
  myBool = "True";
  while(myBool == "True"){
      radius = as.integer(readline(prompt = paste("Enter value for radius (cm): ")));
      print("Calculate :")
      print("A. Area")
      print("C. Circumference") 
      print("D. Diameter")
      print("E. Exit")
      option = readline(prompt = paste("Please Select an Option: "));
      
      if(option == "a"){
        answer = pi * radius * radius;
        cat("Area is: ", answer);
        break;
      }else if (option == "c"){
        answer = 2 * pi * radius;
        cat("Circumference is: ", answer);
        break;
      }else if (option == "d"){
        asnwer = radius * 2
        cat("Diameter is: ", answer);
        break;
      }else if (option == "e"){
        break;
      }else{
        print("Invalid Option")
      }
      
    }
}

question1()

#question 3

countmatrix <- function(){
    mymatrix = matrix(c(-1,-2,3,4,5,6), nrow = 2 , ncol = 3)
    positive = 0;
    negative = 0;
    
    for(i in 1:nrow(mymatrix)){
      for(j in 1:ncol(mymatrix)){
        if(mymatrix[i,j] > 0){
          positive = positive + 1;
        }else{
          negative = negative + 1;
        }
      }
    }
    print(positive)
    print(negative)
}

countmatrix();
