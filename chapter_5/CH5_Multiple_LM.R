#######################
#Chapter 5, Listing XX to Listing XX
#######################

#Listing XXXX
# Start by cleaning the environment
rm(list=ls())

# Set a random seed for reproducability
set.seed(42) 

# We will use rental data
rent_data <- readRDS('rent_data.rds')

# Take a look at the geo_mapping to add context
geo_mapping <- readRDS('cluster_postcode_mapping.rds')

# Split dataset
trainset_size <- floor(0.75 * nrow(rent_data))
trainset_indices <- sample(seq_len(nrow(rent_data)), size = trainset_size)
# Assign observations to training and testing sets
trainset <- rent_data[trainset_indices, ]
testset <- rent_data[-trainset_indices, ]

# Rowcounts to check
nrow(trainset)
nrow(testset)
nrow(rent_data)

#Listing XXXX
# Create first multiple linear model
rent_lm = lm(formula = price_pw ~., data = trainset)

# Analyse the model output, take note of the p-values and Adjusted R-squared
summary(rent_lm)

# Make predictions
rent_predictions <- predict.lm(rent_lm, newdata = testset, type="response")

# Stitch together predictions & actuals
prediction_actual <- as.data.frame(cbind(actual=testset$price_pw, predicted=rent_predictions))

# Create an RMSE function
rmse <- function(predicted, actual){
  squared_differences <- sum((predicted-actual)^2)
  average_squared_diff <- squared_differences/length(predicted)
  rmse <- sqrt(average_squared_diff)
  return(rmse)
}

# Call RMSE function on our predictions
rent_lm_rmse <- rmse(prediction_actual$predicted, prediction_actual$actual)
rent_lm_rmse
