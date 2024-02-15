# Exercise 1.16
n = 1:200
shape=2*n
rate=n+1

plot(n,n*(rgamma(n,shape,rate)-2),type='l',col='green')
lines(n,n^(1/2)*(rgamma(n,shape,rate)-2),col='red')
lines(n,n^(1/3)*(rgamma(n,shape,rate)-2),col='blue')


# Example 1.7
library(manipulate)
manipulate({
  gamma=rgamma(150,shapeslider,rateslider)
  plot(seq(0,10,by=0.1),pgamma(seq(0,10,by=0.1),shapeslider,rateslider),type='l',col='blue',lwd=2,xlab='',ylab='')
  lines(seq(0,10,by=0.1),ecdf(gamma)(seq(0,10,by=0.1)),col='green',lwd=2)
  lines(seq(0,10,by=0.1),pexp(seq(0,10,by=0.1),1/(mean(gamma))),col='red',lwd=2)
  },
  shapeslider=slider(min=1,max=2,initial=1.75,step=0.25),
  rateslider=slider(min=1,max=2,initial=1.75,step=0.25))


