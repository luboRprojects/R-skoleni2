# Propor�n� test
prop.test(x= c(750, 700), n=c(1000, 1000))

# Anal�za kontingen�n� tabulky
data.chi <- as.data.frame(matrix(c(30, 90, 60, 40),byrow=TRUE, ncol=2))
colnames(data.chi) <- c("CSR-ne", "CSR-ano")
rownames(data.chi) <- c("BSC", "non-BSC")
data.chi 

chisq.test(data.chi)

# Korela�n� anal�za:
url <- "http://archive.ics.uci.edu/ml/machine-learning-databases/00292/Wholesale%20customers%20data.csv"
data.in <- read.table(url, sep=",", header=TRUE)

cor(data.in[ ,c("Fresh", "Milk", "Grocery")])
cor.test(data.in$Fresh, data.in$Milk)
cor.test(data.in$Fresh, data.in$Milk, method = "spearman")

# Regresn� anal�za:
fit1 <- lm(Milk ~ Fresh, data = data.in)
summary(fit1)
plot(data.in$Milk, data.in$Fresh)
coef(fit1)
abline(a=coef(fit1)[1], b=coef(fit1)[2], col="red")
summary(fit1)
plot(fit1)