

# a)simulate a sample of 100 random data points from a normal distribution  
set.seed(1)
Rdata <- rnorm(100, mean=100, sd=5)


# b)visualize the vector created above using different plots
hist(Rdata, main = "Histogram of Rdata" , col = "yellow")                    #first plot
boxplot(Rdata, main = "Boxplot of Rdata")                                    #second plot
plot(Rdata, main = "Scatterplot of Rdata" , col = "blue" )                   #third plot


# c)test the hypothesis that the mean equals 100.
t.test(Rdata, mu = 100)


# d)using Wilcox test to test the hypothesis that mean equals 90.
wilcox.test(Rdata, mu = 90 , exact = TRUE)
