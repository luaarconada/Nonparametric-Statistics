# Plotting bivariate normal

library(mvtnorm)

ngrid <- 50
x1 <- seq(-2, 4, length = ngrid)
x2<- seq(-3, 3, length = ngrid)

mu <- c(1,0)
sigma <- matrix(c(1,0.5,0.5,2), 2, 2)

ngrid <- 50
x1 <- seq(-2, 4, length = ngrid)
x2<- seq(-3, 3, length = ngrid)

#mu <- c(0,0)
#sigma <- matrix(c(1,0.9,0.9,1), 2, 2)

#ngrid <- 50
#x1 <- seq(-3, 3, length = ngrid)
#x2<- seq(-3, 3, length = ngrid)

#mu <- c(0,0)
#sigma <- matrix(c(1,0,0,1), 2, 2)
#ngrid <- 50
#x1 <- seq(-3, 3, length = ngrid)
#x2<- seq(-3, 3, length = ngrid)

dens <- dmvnorm(as.matrix(expand.grid(x1, x2)), mu, sigma)
dens <- matrix(dens, ngrid, ngrid)

image(x1, x2, dens)
contour(x1, x2, dens, add = TRUE)

image(x1, x2, dens, col=rainbow(100))
contour(x1, x2, dens, add = TRUE)

persp(x1,x2,dens, theta = 30, phi = 30, expand = 0.5, col = "lightblue",
      nticks = 2, ticktype = "detailed", shade=0.005)

# gamma: exp vs Fn

library(manipulate)

manipulate({
  
X=rgamma(n,shape=p,rate=lambda)

curve(pgamma(x,shape=p,rate=lambda),xlim=c(0,ceiling(max(X))),lwd=2)
curve(pexp(x,1/mean(X)),lwd=2,col="red",add=T)

Fn=ecdf(X)

curve(Fn(x),lwd=2,col="blue",add=T,type="s")

},n=slider(min=50,max=200,initial=50,step=50),
lambda=slider(min=0.5,max=2,initial=0.75,step=0.25),
p=slider(min=1,max=2,initial=1.75,step=0.25))


# Big and small o's

N=1000
n=1:N

  vec0=n^(1/12)*(rgamma(N,shape=2*n,rate=n+1)-2)

  vec1=n^(1/3)*(rgamma(N,shape=2*n,rate=n+1)-2)
  
  vec2=n^(1/2)*(rgamma(N,shape=2*n,rate=n+1)-2)
  
  vec3=n*(rgamma(N,shape=2*n,rate=n+1)-2)
  

X11()
par(mfrow=c(2,2),oma=rep(1,4),mar=rep(4.5,4))
plot(n,vec0,type="l", ylab=expression(n^(1/12)*X[n]))
plot(n,vec1,type="l", ylab=expression(n^(1/3)*X[n]))
plot(n,vec2,type="l", ylab=expression(n^(1/2)*X[n]))
plot(n,vec3,type="l", ylab=expression(n*X[n]))


N=1000
n=1:N

vec0=n^(1/12)*rnorm(N,0,1/sqrt(n))

vec1=n^(1/3)*rnorm(N,0,1/sqrt(n))

vec2=n^(1/2)*rnorm(N,0,1/sqrt(n))

vec3=n*rnorm(N,0,1/sqrt(n))


X11()
par(mfrow=c(2,2),oma=rep(1,4),mar=rep(4.5,4))

plot(n,vec0,type="l", ylab=expression(n^(1/12)*X[n]))
plot(n,vec1,type="l", ylab=expression(n^(1/3)*X[n]))
plot(n,vec2,type="l", ylab=expression(n^(1/2)*X[n]))
plot(n,vec3,type="l", ylab=expression(n*X[n]))
title(main = expression(X[n] %~% N(0,1/n)),outer=T)
