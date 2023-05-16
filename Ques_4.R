library(MASS)
data(mammals)


# a)Pearson correlation coefficient
cor(mammals$body, mammals$brain, method = "pearson")

# Spearman correlation coefficient
cor(mammals$body, mammals$brain, method = "spearman")


# b)Plot the data using the plot command
plot(mammals$body, mammals$brain, xlab = "Body Weight", 
     ylab = "Brain Weight", main = "Mammals Data")


# c)Plot the logarithm (log) of each variable 
plot(log(mammals$body), log(mammals$brain), xlab = "Log Body Weight", 
     ylab = "Log Brain Weight", main = "Mammals Data (Log)")