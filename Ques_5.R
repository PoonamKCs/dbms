data(UScereal)
data1<-UScereal

# a)relationship between manufacturer and shelf 

ggplot(data1, aes(x=mfr, y=shelf, color = mfr)) + geom_point()


# b)relationship between fat and vitamins 
ggplot(data1, aes(x=vitamins, y=fat, color = vitamins)) + geom_boxplot()


# c)relationship between fat and shelf 
ggplot(data1, aes(x=shelf, y=fat, color = shelf)) + geom_point()


# d)relationship between carbohydrates and sugars 
ggplot(data1, aes(x=sugars, y=carbo, color = mfr)) + geom_point()


# e)relationship between fibre and manufacturer 
ggplot(data1, aes(x=mfr, y=fibre, color = mfr)) + geom_boxplot()


# f)relationship between sodium and sugars 
ggplot(data1, aes(x=sugars, y=sodium, color = mfr)) + geom_point()
