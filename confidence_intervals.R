mu <- 5
sd <- 1

m <-50 #poèet výzkumù
n <-15 #poèet respondentù ve výzkum

samples <- matrix(nrow=m, ncol=n)

for (i in 1:m) {
 samples[i, ] <- rnorm(n, mean=mu, sd=sd)
}

dim(samples)
prumery <- apply(samples, 1, mean)
hist(prumery)

t.test(samples[1, ])

intervaly <- apply(samples, 1, function(x){ t.test(x)$conf.int} )
intervaly <- t(intervaly)
plot.data <- as.data.frame(cbind(
	mean=apply(intervaly, 1, mean), 
	margin=apply(intervaly, 1, function(x){max(x)-mean(x)}),
	out=apply(intervaly, 1, function(x){(min(x) >= 5) | (max(x) <= 5) })
	))

table(plot.data$out)
head(intervaly, 2)
head(plot.data, 2)

y <- plot.data$mean
err <- plot.data$margin
plotCI(1:m,y,err)
abline(a=mu, b=0, col="red")