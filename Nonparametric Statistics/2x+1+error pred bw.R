
library(np)

# Y = 2X + 1 + error with error ~ N(0,sqrt(2) = sigma) and X ~ U(0,10) and m(X)= 2X + 1

n = 50
X = runif(n, min = 0, max = 10)
error = rnorm(n, mean = 0, sd = sqrt(2))
m = function(x){
  2*x+1
}
Y = m(X) + error

bwll = npregbw(Y~X, regtype = 'll') # could be either 'lc' = local constant and 'll' = local linear
bwlc = npregbw(Y~X, regtype = 'lc')

grid = seq(0,10, by = 0.1)
fitll = npreg(bwll, exdat = grid) # argument exdat = grid points
fitlc = npreg(bwlc, exdat = grid)

meanlc = fitlc$mean
meanll = fitll$mean

# What is inside of the fit? Try to plot the m^(x) ('lines' more problematic) and m(x). lm()

plot(fitlc, lw = '2')
curve(m(x), add = T, col = 'red', lw =2)
plot(fitll, lw = '2')
curve(m(x), add = T, col = 'red', lw = 2)

# lm 
fitlm = lm(Y~X)
values = function(x){
  fitlm$coefficients[1] + fitlm$coefficients[2]*x
}
curve(values, add = T, col = 'magenta', lw = 2)

