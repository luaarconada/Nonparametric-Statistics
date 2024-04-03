# error ~ N(0, sqrt(2)), 2*n observations, m(x)=x^2*sen(x), X = c(N(-2,sqrt(0.5)), N(2, sqrt(0.5))) 
# Y = m(X)+error
# check: npregbw(..., bwtype)
library(np)

n = 50
error = rnorm(2*n, mean = 0, sd = sqrt(2))

m = function(x){
  x^2*sin(x)
}

X = c(rnorm(n, mean = -2, sd = sqrt(0.5)), rnorm(n, mean = 2, sd = sqrt(0.5)))

Y = m(X) + error

bwgen = npregbw(Y~X, bwtype = 'generalized_nn')
bwad = npregbw(Y~X, bwtype = 'adaptive_nn')
grid = seq(-6,6, by = 0.1)
fitgen = npreg(bwgen, exdat = grid) # argument exdat = grid points
fitad = npreg(bwad, exdat = grid)

plot(fitgen)
curve(m(x), add = T, col = 'red')

plot(fitad)
curve(m(x), add = T, col = 'red') # tiene mejor pinta

# rug(X,1)
