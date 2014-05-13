library(pwr) #install.packages("pwr")
effect.size <- (0.12-0.10)/0.06
pwr.t.test(d = effect.size , sig.level = 0.05, 
	      power = 0.8, type = c("two.sample"),
		alternative="greater" ) # parametr n= pro počet pozorování
