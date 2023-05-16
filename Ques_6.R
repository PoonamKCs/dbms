# a)Do two simulations of a binomial number with n = 100 and p = 0.5

b1 <- rbinom(10, 100, 0.5)
b2 <- rbinom(10, 100, 0.5)
summary(b1)
summary(b2)
# checking similarity and differences
sd(b1)          
sd(b2)
hist(b1)
hist(b2)


# b)Do a simulation of the normal two times.
N1  <- rnorm(10, mean = 10, sd = 10)
N2 <- rnorm(10, mean = 100, sd = 100)
summary(N1)
summary(N2)
# checking similarity and differences
sd(N1)          
sd(N2)
hist(N1)
hist(N2)
