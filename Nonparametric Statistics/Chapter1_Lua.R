# Exercise 1.16
n = 1:200
shape=2*n
rate=n+1

plot(n,n*(rgamma(n,shape,rate)-2),type='l',col='green')
lines(n,n^(1/2)*(rgamma(n,shape,rate)-2),col='red')
lines(n,n^(1/3)*(rgamma(n,shape,rate)-2),col='blue')