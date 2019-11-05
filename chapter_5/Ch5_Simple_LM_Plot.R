#######################
#Chapter 5, Listing XX to Listing XX
#######################

#Listing XXXX
# Start by cleaning the environment
rm(list=ls())
# Set a random seed for reproducability
set.seed(42)

# Read in library
library(ggplot2)

# Create some X values
X <-  seq(0, 10, 0.1)

# Create some noise so the Y doesn't match perfectly
noise <- rnorm(n=length(X), mean=0, sd=1.5)
Y <-  10 + 1.5 * X + noise

# Join data together
data <- data.frame(X, Y)

# Plot data and line
ggplot(data, aes(X, Y)) + 
  geom_point() +   
  geom_smooth(method = "lm", se = FALSE, col = "red")
