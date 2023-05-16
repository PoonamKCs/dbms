

# Read the file Coweeta.CSV 
MyData = read.csv("C:\\Users\\HP\\Desktop\\Poonam 4th sem\\Poonam R Programming\\coweeta.csv") 

# a)count the number of observations per species. 
df<-table(MyData$species)


# b)take a subset of the data including only those species with at least 10 observations. 
df2 <- subset(MyData, species %in% names(df)[df >=10 ])
df2


# c) plot of biomass versus height
ggplot(MyData, aes(x = biomass, y = height, color = species)) +
  geom_point(shape = 13) +
  ggtitle("Biomass vs Height") +
  theme(plot.title = element_text(face = "italic"))


# d)log-transform biomass, and redraw the plot. 
MyData$log_biomass <- log(MyData$biomass)

#plot
ggplot(MyData, aes(x = log_biomass, y = height, color = species)) +
  geom_point(shape = 13) +
  ggtitle("Biomass vs Height") +
  theme(plot.title = element_text(face = "italic"))