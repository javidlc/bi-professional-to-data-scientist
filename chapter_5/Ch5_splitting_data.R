#######################
#Chapter 5, Listing XX to Listing XX
#######################

#Listing XXXX
# Splitting into train and test set

# Start by cleaning the environment
rm(list=ls())

# We will use rental dataset
salary_data <- readRDS("salary_data.RDS")

# Check the structure of the variables in the data
str(salary_data)

# Set a random seed for reproducability
set.seed(42) 

# We want to partition our data into 70% for training, 30% for testing
# 1. Create data partition row list

## Determine how many entities constitute 75% of the sample size
# Use floor to round down to nearest integer
trainset_size <- floor(0.75 * nrow(salary_data))

# Get indices of observations to be assigned to training set
# This is via randomly picking observations using the sample function
trainset_indices <- sample(seq_len(nrow(salary_data)), size = trainset_size)

# Print out to see what we just created
trainset_indices[1:3] 

# Assign observations to training and testing sets
trainset <- salary_data[trainset_indices, ]
testset <- salary_data[-trainset_indices, ]

# Rowcounts to check
nrow(trainset)
nrow(testset)
nrow(salary_data)