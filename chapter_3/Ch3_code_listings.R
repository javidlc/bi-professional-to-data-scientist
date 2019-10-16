#######################
#Chapter 3, Listing 3.01 to 3.73
#######################

# Listing 3.01
# This is a comment
# R as a calculator - basic numerical operations
21*35
(2017-2014)/(2017-2000)
25^3 #exponentiation
25**3 #also exponentiation
23%%10 #modulo (returns remainder of dividing first number by second)

#Listing 3.02
# Create two variables 
a_number <- 10
another_number <- 3
# Check that they are available
a_number
another_number

#Listing 3.03
# Add, multiply, divide and exponentiate the variables
a_number + another_number
a_number*another_number
a_number/another_number
a_number^another_number

#Listing 3.04
# Relational (conditional) operators to compare values. 
a_number==another_number #lhs equal to rhs
a_number!=another_number #lhs not equal to rhs
a_number>another_number  #lhs greater than rhs
a_number<another_number  #lhs less than rhs

#Listing 3.05
# To clear specific objects from memory
rm(list=c("a_number","another_number")) #c is the "combine" function which we'll see soon
# Check that they are gone
ls()

#Listing 3.06
# To clear all objects from memory (be careful when doing this!!)
rm(list=ls())

#Listing 3.07
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

#Listing 3.08
#factors
gender <- factor(c("Male","Female"))
gender
#internal structure
str(gender)

# Listing 3.09
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

# Listing 3.10
#factors
gender <- factor(c("Male","Female"))
gender
#internal structure
str(gender)

# Listing 3.11
size <- factor(c("Small","Medium","Large"))
str(size)

#Listing 3.12
ordered_size <- factor(c("Small", "Medium", "Large"),
                       levels=c("Small", "Medium", "Large"),ordered=TRUE)

str(ordered_size)


#  Listing 3.13
# Create a vector
vector_1 <- c(10,20,30,40,50,60,70,80,90,100)
vector_1 #print it 

#  Listing 3.14
# You can access individual elements using the [] notation: 
vector_1[5]

#  Listing 3.15
# Do some simple math operations on vector_1. What do you notice?
vector_1 +10
vector_1 /2

#  Listing 3.16
length(vector_1)

#  Listing 3.17
vector_2 <- c(-10,-20,-30,-40,-50,-60,-70,-80,-90,-100)
# Add vectors
vector_1 +vector_2 
# Multiply them
vector_1*vector_2
# Divide them
vector_1/vector_2

#  Listing 3.18
vector_3 <- c(-10,-20)
vector_1 +vector_3

#  Listing 3.19
# Increasing sequence from 3 to 10
3:10
# Decreasing sequence from 10 to 3
10:3

#  Listing 3.20
# Try creating a vector containing elements of different types
vector_4 <- c("a",1,FALSE)
vector_4

#  Listing 3.21
vector_4[2]+1 

#  Listing 3.22
# Conditional access
which(vector_1>20)
# Prints indexes (locations) of elements that satisfy the condition

#  Listing 3.23
# For actual values, pass these indexes on to the vector
vector_1[which(vector_1>20)]

#  Listing 3.24
which(vector_1<20 | vector_1>50)

#  Listing 3.25
# Create vector containing the values you want to filter by
desired_numbers <- c(10,40,90)
# Compare original vector to desired numbers, returns a logical vector
vector_1 %in% desired_numbers
# Pass this vector to original vector
vector_1[vector_1 %in% desired_numbers]


# Listing 3.26
v1 <- 1:3
v2 <- 4:6
v3 <- 7:9


# Listing 3.27
m <- matrix(1:9,nrow = 3,)
m

# Listing 3.28
nrow(m)
ncol(m)
dim(m) # 3 rows, 3 cols 3x3

# Listing 3.29
m[1,2] #element in row 1, col2
m[2,3] #element in row2, col3

# Listing 3.30
m[1,] #first row
m[,3] #third column

# Listing 3.31
x <- -5
if (x > 0) {
  print("Positive number")
} else{
  print("Negative number")
}

# Listing 3.32
x <- 0
if (x < 0) {
  print("Negative number")
} else if (x > 0) { 
  print("Positive number")
} else {
  print("Zero")
}

#  Listing 3.33
#seq() function returns a sequence of numbers
seq(from = 1, to = 10)

#  Listing 3.34
seq(to=10)
seq(1,10)
seq(10)

# Listing 3.35
seq(from = 1, to = 10, by = 0.5)
# Equivalent to the following using "length.out" parameter
seq(from = 1, to = 10, length.out=19)

# Listing 3.36
rep(1,20)
rep(TRUE,14)

# Listing 3.37
sqrt(10) #square root
abs(-10) #absolute value
log(10)#natural logarithm
min(c(1,2,3,4))
max(1:4)
min(c(1,-1,2,3,-4,6))
max(c(1,-1,2,3,-4,6))

# Listing 3.38
# Create a vector of numbers
v <- c(13,17,19,23,29,31,37,43,47,53)

sqrt_v  <- rep(0,length(v)) #create a vector of zeros 

# Loop through v, calculating the sqrt at each step
for (i in 1:length(v)){ #for every element in the vector
  sqrt_v[i] <- sqrt(v[i])} #calculate the square root

sqrt_v #print result

# Listing 3.39
sqrt(v) # a single line!

# Listing 3.40
x <- 5
while(x < 10){ # Set the condition and start the loop
  print(x) # The code inside the loop
  x =  x + 1 
}

# Listing 3.41
mean(v) #average (arithmetic mean)
var(v) #variance
sd(v) #std deviation 

# Listing 3.42
# Set seed to ensure reproducibility
set.seed(42)
# Generate 10 uniformly distributed variables between 0 and 1
runif(n = 10) 
runif(n = 10,min = 1, max = 1000)

# Listing 3.43
greet <- function(user_name){
  greeting  <- paste("Hello",user_name)
  return(greeting)
}
greet("Kailash")

# Listing 3.44
greeting

# Listing 3.45
greet()

# Listing 3.46
greet <- function(user_name=NULL){
  if (is.null(user_name)){
    greeting <- "Please enter your name."
  } else {
    greeting <- paste("Hello",user_name)
  }
  return(greeting)
}
greet()


#  Listing 3.47
lst <- list("Joe",30, 1987L, "Sydney")
lst

# Listing 3.48
lst[1]
lst[[1]]


# Listing 3.49
lst_1 <- list(fname="Joe",age=30,yob=1987L,residence="Sydney")
lst_1

# Listing 3.50
# Referencing by name (can also reference by number)
lst_1["fname"]
lst_1[["fname"]]
lst_1$fname


#  Listing 3.51
first_name <- c("Joe", "Jen", "Jack")
last_name <- c("Bloggs","Craig","Mack")
age <- c(30,25,20)

# Listing 3.52
df_1 <- data.frame(first_name,last_name, age, stringsAsFactors = FALSE)#A
df_1


# Listing 3.53
str(df_1)

# Listing 3.54
df_2 <- data.frame(first_name,last_name, age)
str(df_2)

# Listing 3.55
typeof(df_1)

# Listing 3.56
typeof(df_1[1])
typeof(df_1[[1]])
df_1[1]
df_1[[1]]

#Listing 3.57
df_1$gender <- as.factor(c("Male","Female","Male"))
str(df_1)

#Listing 3.58
data()

# Listing 3.59
str(mtcars)

# Listing 3.60
head(mtcars)

# Listing 3.61
mtcars[1:6,]

# Listing 3.62
mtcars[,1:4]

# Listing 3.63
mtcars[,-(1:2)]

# Listing 3.64
# Specific named columns
head(mtcars[,which(names(mtcars) %in% c("mpg","cyl"))])

# Listing 3.66
# Models that have mileage > 20 mpg
mtcars[mtcars$mpg>20,]

# Listing 3.67
mtcars[mtcars$mpg>20 & mtcars$cyl==6,]

# Listing 3.68
# Add a column with a conditional computation
mtcars$mpg_rating <- as.factor(ifelse(mtcars$mpg>20,"good","poor"))
ncol(mtcars)
str(mtcars)

# Listing 3.69
# By mpg_rating
table(mtcars$mpg_rating)

# By cylinders and mpg_rating
table(mtcars$cyl,mtcars$mpg_rating)

# Listing 3.70
# To write a dataset out to disk
write.csv(x=mtcars,file="mtcars.csv") 
# Writes to current working directory

# Read it back in
mtcars2 <- read.csv(file="mtcars.csv")
# Check that the data has been read in correctly
str(mtcars2)


# Listing 3.71
test_df <- read.csv(file = "test.csv")
test_df

# Listing 3.72
mean(test_df$Col2)

# Listing 3.73
mean(test_df$Col2, na.rm = TRUE)




