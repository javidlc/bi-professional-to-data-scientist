#######################
#Chapter 5, Listing XX to Listing XX
#######################

#Listing XXXX

# Clean our environment and set random seed for reproducability
rm(list = ls())
set.seed(42)

# Ridge regression and lasso can be trained using the glmnet package
library(glmnet)

# We will use rent data
rent_data <- readRDS('rent_data.rds')

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

#### Glmnet setup ####

# The glmnet package requires data be in separate x and y sets.  
# the predictor set, x, must be a matrix
x = model.matrix(~ ., trainset[, -(ncol(rent_data))])
y = trainset$price_pw

# We will use the glmnet function to train our model
# Have a look at the documentation,
?glmnet
# https://www.rdocumentation.org/packages/glmnet/versions/2.0-16/topics/glmnet

# Setting the alpha argument to 0 does ridge regression, 1 does lasso

#### Ridge Regression ####
# alpha = 0 specifies ridge regression.
ridge_reg = glmnet(x, y, family = 'gaussian', alpha = 0)

# Results
plot(ridge_reg, xvar = "lambda", label = TRUE)

# Nice plot using 'plot_glmnet' function from 'plotmo' package
library(plotmo)
plot_glmnet(ridge_reg, label=TRUE)

# Get our predictions
# We will simply pick a lambda (400)
prediction_ridge = predict(ridge_reg, 
                           newx = model.matrix(~ ., testset[, -ncol(rent_data)]), 
                           s = 400,
                           type='response')

# Get the RMSE
# Here we can use a package or feel free to reproduce the formula you used before.

#Get the RMSE
library(hydroGOF)
rmse_ridge <- rmse(as.vector(prediction_ridge), testset$price_pw)
rmse_ridge

#### LASSO Regression ####

#Simply repeat the code above, except set alpha to be 1
# alpha = 1 specifies lasso regression.
lasso_reg = glmnet(x, y, family = 'gaussian', alpha = 1)

# Results
plot(lasso_reg, xvar = "lambda", label = TRUE)
# Notice the number of vars on top is changing?

# Nice plot using 'plot_glmnet' function from 'plotmo' package
plot_glmnet(lasso_reg, label=TRUE)

# Get our predictions
# We will simply pick a lambda (7.4)
prediction_lasso = predict(lasso_reg, 
                           newx = model.matrix(~ ., testset[, -ncol(rent_data)]), 
                           s = 7.4,
                           type='response')

# Calculate RMSE
rmse_lasso <- rmse(as.vector(prediction_lasso), testset$price_pw)
rmse_lasso

#### Compare ####
rmse_ridge
rmse_lasso

# How to choose Lambda?

# cv.glmnet package will try several for you
ridge_reg_cv = cv.glmnet(x, y, family = 'gaussian', alpha = 0)

# You can plot this as well, which will plot lambda vs mse error
plot(ridge_reg_cv)

# We can see what the minimum lambda and lambda within 1standard deviation is
ridge_lambda_min <- ridge_reg_cv$lambda.min
ridge_lambda_1se <- ridge_reg_cv$lambda.1se

ridge_lambda_min
ridge_lambda_1se

# Now redo predictions with lambda 1se
ridge_fitted <- ridge_reg_cv$glmnet.fit
prediction_ridge_cv = predict(ridge_fitted, 
                           newx = model.matrix(~ ., testset[, -ncol(rent_data)]), 
                           s = ridge_lambda_1se,
                           type='response')

# Redo rmse calculations
rmse_ridge_cv <- rmse(as.vector(prediction_ridge_cv), testset$price_pw)
rmse_ridge_cv
