#######################
#Chapter 5, Listing XX to Listing XX
#######################

#Listing XXXX
# Start by cleaning the environment
rm(list=ls())
# Set a random seed for reproducability
set.seed(42) 

# Get data from spurious correlations website
# http://tylervigen.com/spurious-correlations
cheese <- c(29.8, 30.1, 30.5, 30.6, 31.3, 31.7, 32.6, 33.1, 32.7,32.8)
bedsheets <- c(327, 456, 509, 497, 596, 573, 661, 741, 809, 717)
all_data <- as.data.frame(cbind(cheese, bedsheets))

# Construct simple linear regression
silly_lm = lm(formula = bedsheets ~cheese, data = all_data)

# Print out the results
summary(silly_lm)