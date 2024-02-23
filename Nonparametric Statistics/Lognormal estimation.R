#Generate 100 samples from a lognormal
n = 500
x = rlnorm(n)

#Estimate the density of the lognormal
plot(density(x), xlim=c(0,15), ylim=c(0,0.7), col='red', main='Density of lognormal and estimated') #we see trouble in the tails and not only there
curve(dlnorm(x), from=0,to=15, n=n, add=T) #the true density of the lognormal
rug(x)

#Transform the data using the logarithm to a normal so we can use the gaussian kernel and estimate the density g
#Our t(x) from the formula is t(x)=log(x) 
#t: x -> log(x); t': x -> 1/x
logx = log(x)
kde = density(logx)
plot(kde, main='Density of transformed data and estimated', col='red')
curve(dnorm(x),add=T)
rug(log(x))

#We revert the transformation:
#t^{-1}: x->exp(x) and f: y->g(t(x))*1/x (inverse the transformation) to compare to the lognormal density
kde_transf = density(logx)
kde_transf$x = exp(kde_transf$x)
kde_transf$y = kde_transf$y * 1/kde_transf$x
plot(kde_transf, col='red', xlim=c(0,8), main='Final estimated density of lognormal and real')
curve(dlnorm(x), add=T)
rug(x)

#We simulate a lognormal and transform it so we have a normal. Then, we estimate the density and we reverse the
#transformation so we have a lognormal again and compare it to the initial estimation.