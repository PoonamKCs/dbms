
#Install the Package
install.packages("DMwR2")
library(DMwR2)
data("algae")

# a)Histogram to show the distribution of the values of algae 6
hist(algae$a6, main = "Histogram of Algae a6", xlab = "Algae a6 Values", ylab = "Frequency",col = "#009999")

# b)distribution of the values of size 3.
table(algae$size == 3)

# c)check visually if oPO4 follows a normal distribution.
qqnorm(algae$oPO4, main = "QQ plot")
qqline(algae$oPO4, lwd = 2, lty = 2)

# d)use boxplot to understand the values of NO3 are distributed across the sizes of river.
par(mar=c(1,3,1,3))           #set the margin
boxplot(algae$NO3 ~ algae$size, main = "Distribution of NO3 Across River Sizes", 
        xlab = "Size Of River", ylab = "NO3 Values")

# e)use a box plot to check if the distribution of algae a1 varies with the speed of the river
boxplot(algae$speed ,algae$a1, main = "Distribution of Algae a1 Across speed of the river", 
     xlab = "River Speed", ylab = "Values of Algae a1 ")

# f)relationship between the frequencies of algae a1 and a6.
plot(algae$a1 ,algae$a6,  main = "Relationship Between Algae a1 and a6", 
        xlab = "Algae a1 Values", ylab = "Algae a6 Values",col="red",cex = 1)



