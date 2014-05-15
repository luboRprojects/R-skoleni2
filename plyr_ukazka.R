library(plyr)
url <- "http://www.fame.utb.cz/pokr/r_skoleni/cars.txt"
data <- read.table(url, sep=" ", header=TRUE)
str(data)

tapply(data$mpg, data$cyl, mean)

ddply(data, .(cyl), summarise,
	prum.spotreba = mean(mpg),
	max.vykon = max(hp),
	rozptyl.vykon = var(hp) )


ddply(data, .(cyl, gear), summarise,
	prum.spotreba = mean(mpg),
	max.vykon = max(hp),
	rozptyl.vykon = var(hp) )


boxplot(data$mpg ~ data$cyl)
with(data, boxplot(mpg  ~ cyl) )
