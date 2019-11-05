#######################
#Chapter 5, Listing XX to Listing XX
#######################

#Listing XXXX
# Start by cleaning the environment
rm(list=ls())
# Set a random seed for reproducability
set.seed(42)

# Create some X values
X <-  seq(0, 10, 0.1)

# Create very small noise so the Y doesn't match perfectly
noise <- rnorm(n=length(X), mean=0, sd=0.5)
Y <-  10 + 1.5 * X + noise

# Join data together
data <- data.frame(X, Y)

# Run the regression
amazing_lm <- lm(Y~X, data=data)

plot(amazing_lm, which=1)
plot(amazing_lm, which=3)
plot(amazing_lm, which=2)
