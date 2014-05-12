set.seed(123)
data <- c(sample(1:10, 15, replace=TRUE), sample(15:17, 2, replace =TRUE))
prumer <- mean(data)
prumer 
hist(data)
abline(v=prumer, col="red")

# Interval spolehlivosti - Normální rozdìlení
ci.l <- prumer + qnorm(0.025)*sd(data)/sqrt(length(data))
ci.u <- prumer + qnorm(0.975)*sd(data)/sqrt(length(data))

interval <- cbind(ci.l, ci.u)
interval
# Pokud by bylo provedeno 100 vızkumù, potom by pouze ~5 z nich 
# stanovilo interval, ve kterém není skuteèná hodnota prùmìru (mu)
# Je te 


# Interval spolehlivosti - Studentovo rozdìlení
t.test(data)

# Bootstrap
n.boot <- 100 # kolik replikací?
m <- 15 # kolik pozorování je vybráno?
boot.data <- matrix(0, nrow=n.boot, ncol=m)

for (i in 1:n.boot){
boot.data[i, ] <- sample(data, 15)
}

boot.prumery <- apply(boot.data, 1, mean)
hist(boot.prumery)
quantile(boot.prumery, probs=c(0.025, 0.975))