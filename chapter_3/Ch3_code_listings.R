#######################
#Chapter 3
#######################


# This is a comment
# R as a calculator - basic numerical operations
21*35
(2017-2014)/(2017-2000)
25^3 #exponentiation
25**3 #also exponentiation
23%%10 #modulo (returns remainder of dividing first number by second)


# Create two variables 
a_number <- 10
another_number <- 3
# Check that they are available
a_number
another_number


# Add, multiply, divide and exponentiate the variables
a_number + another_number
a_number*another_number
a_number/another_number
a_number^another_number


# Relational (conditional) operators to compare values. 
a_number==another_number #lhs equal to rhs
a_number!=another_number #lhs not equal to rhs
a_number>another_number  #lhs greater than rhs
a_number<another_number  #lhs less than rhs


# To clear specific objects from memory
rm(list=c("a_number","another_number")) #c is the "combine" function which we'll see soon
# Check that they are gone
ls()


# To clear all objects from memory (be careful when doing this!!)
rm(list=ls())


#Simple datatypes
name <- "Sydney"
logical_value <- TRUE
number <- 1.2
int <- 1L #suffix L tells R to treat this as an integer 

# The typeof function returns the datatype of the variable
typeof(name)
typeof(logical_value)
typeof(int)


# The str function gives the internal structure of an R object
str(name)
str(logical_value)
str(number)
str(int)


#factors
gender <- factor(c("Male","Female"))
gender
#internal structure
str(gender)


#Simple datatypes

name <- "Sydney"
logical_value <- TRUE
number <- 1.2
int <- 1L #suffix L tells R to treat this as an integer 

# The typeof function returns the datatype of the variable
typeof(name)
typeof(logical_value)
typeof(number) 
typeof(int)


# The str function gives the internal structure of an R object
str(name)
str(logical_value)
str(number)
str(int)


#factors
gender <- factor(c("Male","Female"))
gender
#internal structure
str(gender)
size <- factor(c("Small","Medium","Large"))
str(size)
ordered_size <- factor(c("Small", "Medium", "Large"),
                       levels=c("Small", "Medium", "Large"),ordered=TRUE)
str(ordered_size)


# Create a vector
vector_1 <- c(10,20,30,40,50,60,70,80,90,100)
vector_1 #print it 


# You can access individual elements using the [] notation: 
vector_1[5]


# Do some simple math operations on vector_1. What do you notice?
vector_1 +10
vector_1 /2


length(vector_1)


vector_2 <- c(-10,-20,-30,-40,-50,-60,-70,-80,-90,-100)
# Add vectors
vector_1 +vector_2 
# Multiply them
vector_1*vector_2
# Divide them
vector_1/vector_2


vector_3 <- c(-10,-20)
vector_1 +vector_3


# Increasing sequence from 3 to 10
3:10
# Decreasing sequence from 10 to 3
10:3


# Try creating a vector containing elements of different types
vector_4 <- c("a",1,FALSE)
vector_4
vector_4[2]+1 


# Conditional access
which(vector_1>20)
# Prints indexes (locations) of elements that satisfy the condition


# For actual values, pass these indexes on to the vector
vector_1[which(vector_1>20)]
which(vector_1<20 | vector_1>50)


# Create vector containing the values you want to filter by
desired_numbers <- c(10,40,90)
# Compare original vector to desired numbers, returns a logical vector
vector_1 %in% desired_numbers
# Pass this vector to original vector
vector_1[vector_1 %in% desired_numbers]


v1 <- 1:3
v2 <- 4:6
v3 <- 7:9


m <- matrix(1:9,nrow = 3,)
m


nrow(m)
ncol(m)
dim(m) # 3 rows, 3 cols 3x3


m[1,2] #element in row 1, col2
m[2,3] #element in row2, col3


m[1,] #first row
m[,3] #third column


x <- -5
if (x > 0) {
  print("Positive number")
} else{
  print("Negative number")
}


x <- 0
if (x < 0) {
  print("Negative number")
} else if (x > 0) { 
  print("Positive number")
} else {
  print("Zero")
}


#seq() function returns a sequence of numbers
seq(from = 1, to = 10)


seq(to=10)
seq(1,10)
seq(10)


seq(from = 1, to = 10, by = 0.5)
# Equivalent to the following using "length.out" parameter
seq(from = 1, to = 10, length.out=19)


rep(1,20)
rep(TRUE,14)


sqrt(10) #square root
abs(-10) #absolute value
log(10)#natural logarithm
min(c(1,2,3,4))
max(1:4)
min(c(1,-1,2,3,-4,6))
max(c(1,-1,2,3,-4,6))


# Create a vector of numbers
v <- c(13,17,19,23,29,31,37,43,47,53)

sqrt_v  <- rep(0,length(v)) #create a vector of zeros 

# Loop through v, calculating the sqrt at each step
for (i in 1:length(v)){ #for every element in the vector
  sqrt_v[i] <- sqrt(v[i])} #calculate the square root

sqrt_v #print result


sqrt(v) # a single line!


x <- 5
while(x < 10){ # Set the condition and start the loop
  print(x) # The code inside the loop
  x =  x + 1 
}


mean(v) #average (arithmetic mean)
var(v) #variance
sd(v) #std deviation 


# Set seed to ensure reproducibility
set.seed(42)
# Generate 10 uniformly distributed variables between 0 and 1
runif(n = 10) 
runif(n = 10,min = 1, max = 1000)


greet <- function(user_name){
  greeting  <- paste("Hello",user_name)
  return(greeting)
}
greet("Kailash")


greeting


greet()


greet <- function(user_name=NULL){
  if (is.null(user_name)){
    greeting <- "Please enter your name."
  } else {
    greeting <- paste("Hello",user_name)
  }
  return(greeting)
}
greet()



lst <- list("Joe",30, 1987L, "Sydney")
lst


lst[1]
lst[[1]]



lst_1 <- list(fname="Joe",age=30,yob=1987L,residence="Sydney")
lst_1


# Referencing by name (can also reference by number)
lst_1["fname"]
lst_1[["fname"]]
lst_1$fname



first_name <- c("Joe", "Jen", "Jack")
last_name <- c("Bloggs","Craig","Mack")
age <- c(30,25,20)


df_1 <- data.frame(first_name,last_name, age, stringsAsFactors = FALSE)#A
df_1



str(df_1)


df_2 <- data.frame(first_name,last_name, age)
str(df_2)


typeof(df_1)


typeof(df_1[1])
typeof(df_1[[1]])
df_1[1]
df_1[[1]]


df_1$gender <- as.factor(c("Male","Female","Male"))
str(df_1)


data()


str(mtcars)


head(mtcars)


mtcars[1:6,]


mtcars[,1:4]


mtcars[,-(1:2)]


# Specific named columns
head(mtcars[,which(names(mtcars) %in% c("mpg","cyl"))])


# Models that have mileage > 20 mpg
mtcars[mtcars$mpg>20,]


mtcars[mtcars$mpg>20 & mtcars$cyl==6,]


# Add a column with a conditional computation
mtcars$mpg_rating <- as.factor(ifelse(mtcars$mpg>20,"good","poor"))
ncol(mtcars)
str(mtcars)


# By mpg_rating
table(mtcars$mpg_rating)

# By cylinders and mpg_rating
table(mtcars$cyl,mtcars$mpg_rating)


# To write a dataset out to disk
write.csv(x=mtcars,file="mtcars.csv") 
# Writes to current working directory

# Read it back in
mtcars2 <- read.csv(file="mtcars.csv")
# Check that the data has been read in correctly
str(mtcars2)



test_df <- read.csv(file = "test.csv")
test_df


mean(test_df$Col2)


mean(test_df$Col2, na.rm = TRUE)




