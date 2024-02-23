set.seed(12345)
x <- rbeta(n=500, shape1=2, shape2=2)

#Estimate the density and see the problems in the estimation
plot(density(x),col='red')
curve(dbeta(x, shape1=2,shape2=2),add=T)
rug(x)

#Use the probit to transform and then estimate and plot
x_transf =  qnorm(x)
kde = density(x_transf)
plot(kde, col='red')
curve(dnorm(x),add=T)
rug(x_transf)

#Undo the transformation and plot the resulting estimation which should be better
kde_transf = kde
kde_transf$x = pnorm(kde_transf$x)
kde_transf$y = 1/(dnorm(kde_transf$x))* kde_transf$y
plot(kde_transf, col='red')
curve(dbeta(x, shape1=2,shape2=2),add=T)
