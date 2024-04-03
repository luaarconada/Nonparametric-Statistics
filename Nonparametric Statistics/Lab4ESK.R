##### Plotting bivariate normal ######

library(mvtnorm)

mu = c(0, 0)
sigma = rbind(c(1.5, 0.25),c(0.25,1))

ngrid <- 50
x <- seq(-4, 4, length = ngrid)
y <- seq(-4, 4, length = ngrid)
dens <- dmvnorm(as.matrix(expand.grid(x, y)), mu, sigma)
dens <- matrix(dens, ngrid, ngrid)
image(x, y, dens)
contour(x, y, dens, add = TRUE)

library(manipulate)
par(mar=rep(1,4))
manipulate({
  persp(x, y, dens,theta = theta, phi = phi,col="lightblue",zlab="f(x,y)")
},theta=slider(min=-30,max=30,initial=0,step=5),
phi=slider(min=0,max=90,initial=15,step=5))
