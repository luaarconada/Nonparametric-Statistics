#####
data(Auto, package = "ISLR")
X <- Auto$weight
Y <- Auto$mpg

library(np)
bw = npregbw(Y~X)
fit = npreg(bw)

xnew = 3500
pred = predict(fit, newdata = data.frame(X=3500))
pred

#############

library(ks)
iris=iris
Y = iris$Species
X=iris$Petal.Length
bw = hkda(x=X, x.group=Y, bw = 'plugin')
model=kda(x=X, x.group=Y,hs=bw)
error = compare(x.group=model$x.group, est.group=model$x.group.estimate)
error


###
n=50
X = rexp(n)
error = rnorm(n, mean =0, sd = sqrt(4))
m = function(X){
  5*X^2 + 1
}
Y = m(X) + error

bwlc = npregbw(Y~X, regtype = 'lc')

grid = seq(0,10, by = 0.1)

fitlc = npreg(bwlc, exdat = grid)
fitlc=npreg(bwlc)

meanlc = fitlc$mean

plot(fitlc, lw = '2')
curve(m(x), add = T, col = 'red', lw =2)

fitlm = lm(Y~X)
values = function(x){
  fitlm$coefficients[1] + fitlm$coefficients[2]*x
}
curve(values, add = T, col = 'magenta', lw = 2)
