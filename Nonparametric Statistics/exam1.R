set.seed(10); 

X=rnorm(100);

kde = density(X, kernel = 'gaussian', bw = bw.SJ(X, method = 'dpi'))

str(kde)
kde

library(ks)

kde= ks::kde(X, h = bw.SJ(X, method = 'dpi'))

kde$eval.points

ks::kde(X, h = bw.SJ(X, method = 'dpi'), eval.points = 0)




bw.SJ(X, method = 'dpi')


# a)
n = 100
sample = rexp(n, 1)
# b) logarithm tranformation 
logsample = log(sample)
kde = density(logsample)
plot(kde)
lines(seq(-5,3,0.01), dexp(seq(-5,3,0.01)),col='red')

# Undo transformation 
kde_transf = kde
kde_transf$x = log(kde_transf$x)
kde_transf$y = kde_transf$y*1/kde_transf$x
plot(kde_transf)


# a)
n = 100
x = rexp(n, 1)
# b) logarithm tranformation 
#Estimate the density and see the problems in the estimation
plot(density(x),col='red')
curve(dexp(x),add=T)
rug(x)


#Use the probit to transform and then estimate and plot
x_transf =  qnorm(x)
kde = density(x_transf)
plot(kde, col='red')
curve(dnorm(x),add=T)
rug(x_transf)

# Undo transformation 
kde_transf = kde
kde_transf$x = pnorm(kde_transf$x) # reverse qnorm with pnorm
kde_transf$y = 1/(dnorm(kde_transf$x))* kde_transf$y
plot(kde_transf, col='red')
curve(dbeta(x, shape1=2,shape2=2),add=T)
