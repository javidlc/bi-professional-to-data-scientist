#### Simple arithmetic & Variables ####

# 1. Convert the 34 degrees celcius to farenheit (you may need to look up the formula) and assign it to the variable farenheit_thirtyfour. Print it out to confirm your result.

# Answer:
farenheit_thirtyfour <- (34 * (9/5)) + 32
print(farenheit_thirtyfour)

# 2. The population of Australia at the end of 2017 and 2018 was 24.45 and 24.77 million respectively. Create a variable aus_pop_17 and aus_pop_18 and assign the appropriate population (in millions) to these variables. Now calculate the percentage increase in population and assign to the variable percent_change. Print out your answer to confirm your result.

# Answer:
aus_pop_17 <- 24.45
aus_pop_18 <- 24.77

percent_change <- ((aus_pop_18-aus_pop_17)/aus_pop_17)*100
print(percent_change)

# 3. The total area of Australia is 7.692 million sq km. Calculate the population density at the end of 2018 and assign to the variable pop_density_18. Print out your answer to confirm your result.

# Answer:
pop_density_18 <- aus_pop_18/7.692
print(pop_density_18)

# 4. Create a factor variable called top_sales_cities which includes the citites "New York", "Beijing" and "London". Assume there is no relevant order to these cities. Use both the str() and print() function to analyse your answer to confirm your result.

# Answer:
top_sales_cities <- factor(c("New York", "Beijing", "London"))
str(top_sales_cities)
print(top_sales_cities)

# 5. Convert the below variable into a number first and then convert it to USD (current exchange rate 1EU=1.12USD) as it is currently denominated in euros. Store the final USD result in the variable usd_amount. Print out your result to confirm your answer.

euro_amount <- "1.56"

# Answer:
euro_amount_num <- as.numeric(euro_amount)
print(euro_amount_num)

usd_amount <- euro_amount_num * 1.12
print(usd_amount)

#### Vectors ####

# 1. Convert the following vector of euro denominated figures into USD. Save the result into usd_amount_vector. Round your answer to 2 decimal places since we are dealing with currencies. Print out your result to confirm your answer.

euro_amount_vector <- c(1.56, 2.24, 1.55, 1.23, 1.89)

# Answer:
usd_amount_vector <- euro_amount_vector * 1.12
usd_amount_vector <- round(usd_amount_vector,2)
print(usd_amount_vector)

# 2. Create a boolean vector from the given vector below (all_numbers) based on whether the number is positive. Assign this to the variable name positive_numbers_bool. Use this to index into the original vector and assign this new vector to the variable name positive_numbers_vect. Print out your result to confirm your answer.

all_numbers <- c(-24,23,16,-145,27,89,99,467,-231,67)

# Answer:
positive_numbers_bool <- all_numbers> 0
print(positive_numbers_bool)

positive_numbers_vect <- all_numbers[positive_numbers_bool]
print(positive_numbers_vect)

# 3. Subset the all_numbers vector to only include numbers that are positive and even. Assign to the variable positive_even_numbers. Try to do this in one line. Print out your result to confirm your answer.

all_numbers <- c(-24,23,16,-145,27,89,99,467,-231,67)

# Answer:
positive_even_numbers <- all_numbers[(all_numbers > 0) & (all_numbers %% 2 == 0)]
print(positive_even_numbers)

# 4. Subet the all_codes vector to only include the numbers in the vector chosen_numbers. Assign this to the variable relevant_codes. You will find %in% very helpful. Print out your result to confirm your answer.

all_codes <- c(1,2,3,4,5,6,7,8,9,23,45,9,15,2,2,12,12,6,14,12)
chosen_numbers <- c(9,23,12,2)

# Answer:
relevant_codes <- all_codes[all_codes %in% chosen_numbers]
print(relevant_codes)

# 5. Subset the vector all_sales_items to only include the first 4 items. Assign this to a variable called top_sales_items. Print out your result to confirm your answer.

all_sales_items <- c("hat", "coat", "gloves", "pants", "ski poles", "swimmers", "ski jacket", "thick boots")

# Answer:
top_sales_items <- all_sales_items[1:4]
print(top_sales_items)

#### If Else statements & Loops ####

# 1. You have been given a messy list of mixed data types. You only want to extract the numbers. Write a for loop that will iterate through the provided messy_list and only print the numbers.

messy_list <- list(14,345,"hat",4,"car",6, TRUE, FALSE, 9,15, 15)

# Answer:
for (x in messy_list){
  if (typeof(x)=="double"){
    print(x)
  }
}


# 2. Write a for loop to iterate through the sales_figures list which contains the sales figures of different sales reps for the last quarter. If the sales rep met the standard KPI of 150 units, print out "(name) met the KPI" else print out "(name) did not meet the KPI". Inserting (name) for each sales rep's name.

sales_figures <- list(250,340,100,45,600)
names(sales_figures) <- c("John", "Mary", "Suzie", "Bill", "Anne")

# Answer:
for (i in 1:length(sales_figures)) {
  rep_name <- names(sales_figures)[i] # Extract the rep name
  if (sales_figures[[i]] > 150){
    response <- paste(rep_name, "met the KPI") # Past stitches together our statement to print
    print(response)
  }
  else {
    response <- paste(rep_name, "did not meet the KPI")
    print(response)
  }
}

# 3. Repeat the above question, except instead of using a for-loop, simply subset the list based on the condition and assign to two different lists sales_good and sales_bad. Then print out each list.

sales_figures <- list(250,340,100,45,600)
names(sales_figures) <- c("John", "Mary", "Suzie", "Bill", "Anne")

# Answer:
sales_good <- sales_figures[sales_figures > 150]
sales_bad <- sales_figures[sales_figures < 150]

print(sales_good)
print(sales_bad)


#### Functions ####

# 1. A classic computer programming question is the 'Fizz Buzz' challenge. Write a function (called fizzbuzz_machine) that takes a number from 1 to 20 (and ONLY 1-20) as an input. For multiples of three print “Fizz” instead of the number and for the multiples of five print “Buzz”. For numbers which are multiples of both three and five print “FizzBuzz”. You can test your function by running the lines below.

# Test your function
for (x in seq(20)){
  print(x)
  fizzbuzz_machine(x)
}

# Answer:
fizzbuzz_machine <- function(number){
  if ((number >20 ) | (number < 1 )){
    print("Invalid Number")
  }
  else if ((number %% 5 == 0 ) & (number %% 3 == 0)){
    print("FizzBuzz")
  }
  else if(number %% 3 == 0 ){
    print("Fizz")
  }
  else if(number %% 5 == 0 ){
    print("Buzz")
  }
}

# 2. Write a function called return_largest_num that takes a 1-d vector of numbers and returns the largest element in a list. You can test your function with the test_vect_1 below. It should return 122.

test_vect_1 = c(122,2,4,55,3,2,4,5)
return_largest_num(test_vect_1)

# Answer:
return_largest_num <- function(input_vect){
  largest = input_vect[1]
  for (num in input_vect){
    if (num > largest){
      largest = num
    }
  }
  return(largest)
}

# 3. Write a function called profit_margin that determines the profit margin of an item as a percentage of the sales price. It should take in a sales price and a cost price as arguments.

# Answer:
profit_margin <- function(cost_price, sales_price){
  profit <- (sales_price - cost_price) / sales_price * 100
  return(profit)
}

profit_margin(60, 120)

#### Dataframes ####

# 1. Assign the built in ‘trees’ dataset to a dataframe called ‘tree_data’ then create a new dataframe called ‘big_trees’ that only has trees with a Girth greater than 12 and a Height greater than 80. Do not use ‘which’ or ‘subset’ to do this. Display the number of rows and columns of big_trees.

# Answer:
tree_data <- trees
big_trees <- trees[(tree_data$Girth > 12) & (tree_data$Height > 80),]
dim(big_trees) # OR one could us nrow(big_trees) and ncol(big_trees)

# 2. Repeat exercise (1) using the subset function and call this dataframe big_trees_subset

# Answer:
big_trees_subset <- subset(trees, Girth > 12 & Height > 80)

# 3. Assign the built in 'iris' dataset to a dataframe called 'iris_data'. Add a new column to this dataframe called 'sepal_ratio' which is the 'Sepal.Length' divided by the 'Sepal.Width'

# Answer:
iris_data <- iris
iris_data$sepal_ratio <- iris_data$Sepal.Length/iris_data$Sepal.Width

# 4. Assign the ‘mtcars’ dataset to a new dataframe called ‘my_cars’. Use the ‘scale’ function on the mpg column to create a new variable called mpg_scaled and add this to the my_cars dataframe. What is the mean and SD of this new variable?

# Answer:

my_cars <- mtcars
my_cars$mpg_scaled <- as.vector(scale(my_cars$mpg)) # as.vector important here
sd(my_cars$mpg_scaled)
mean(my_cars$mpg_scaled)

# 5. Using the profit_margin function created above, add a new column called profit_percent to the product_sales dataframe below. Make sure you round the values to 2 decimal places.

items <- c("product1", "product2", "product3", "product4")
sale_price <- c(200,450,180,95)
cost_price <- c(150, 200, 160, 25)
product_sales <- data.frame(items, sale_price, cost_price)

# Answer:
product_sales$profit_percent <- round(profit_margin(product_sales$cost_price, product_sales$sale_price), 2)
