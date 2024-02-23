library(mvtnorm)

n=50
mu = c(0,0)
sigma = matrix(c(1,-0.5,-0.5,1),nrow = 2)

#Simulate data
x = rmvnorm(n, mean = mu , sigma)


#Draw it
x = seq(-3, 3, by = 0.1)
y = x
M = matrix(0, length(x), length(y))
for (i in 1:length(x)){
  for (j in 1:length(y)){
    M[i,j] = dmvnorm(c(x[i],y[j]), mean = mu, sigma = sigma)
  }
}

persp(x, y, M)
image(x,y,M)

persp(x,y,M, theta = 10, phi = 20,
      shade=0.4, col="red", border="blue",
      box=FALSE)

plot(kdde(rmvnorm(n = 100, mean = mu, sigma = sigma)), disp = 'persp')