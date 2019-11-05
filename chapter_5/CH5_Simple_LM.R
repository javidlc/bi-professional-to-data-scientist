#######################
#Chapter 5, Listing XX to Listing XX
#######################

#Listing XXXX
# Start by cleaning the environment
rm(list=ls())
# Set a random seed for reproducability
set.seed(42)

# DATA SET UP
data <- readRDS("salary_data.RDS")

# Viz the data
library(ggplot2)
plot <- ggplot() +
  geom_point(data=data, aes(x=yo_serve, y=salary), size=2, color='blue')

# Split dataset
trainset_size <- floor(0.75 * nrow(data))
trainset_indices <- sample(seq_len(nrow(data)), size = trainset_size)
# Assign observations to training and testing sets
trainset <- data[trainset_indices, ]
testset <- data[-trainset_indices, ]

# Rowcounts to check
nrow(trainset)
nrow(testset)
nrow(data)

# Create first linear model
simple_lm = lm(formula = salary ~ yo_serve, data = trainset)

# plot the regression diagnostic graphs
plot(simple_lm, which=1)
plot(simple_lm, which=3)
plot(simple_lm, which=2)
