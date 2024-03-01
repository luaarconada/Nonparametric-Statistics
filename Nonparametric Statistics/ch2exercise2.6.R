# 9/2/2024
#Experiment with banwidth
data(faithful, package = "datasets")
dens = density(faithful$eruptions)
hist(faithful$eruptions, prob=T, col="deepskyblue")
lines(dens, col="magenta")

plot(density(faithful$eruptions, bw=0.1), type = 'l', col="orange", xlab="",
     main="Density estimations")
lines(density(faithful$eruptions, bw=0.5), col="red")
lines(density(faithful$eruptions, bw=1), col="black")
legend("top", legend=c("bw=0.1", "bw=0.5", "bw=1"),fill=c("orange", "red", 
              "black"))

kde = density(faithful$eruptions, bw=0.15, from=3.1, to=3.1)
unique(kde$y)


#Simulate data from mixed normals
library(nor1mix)
par(mfrow=c(2,3))
title(main="Real densities of mixed normals")
curve(dnorMix(x, obj=MW.nm1), from=-4, to=4)
curve(dnorMix(x, obj=MW.nm2), from=-4, to=4)
curve(dnorMix(x, obj=MW.nm6), from=-4, to=4)
curve(dnorMix(x, obj=MW.nm8), from=-4, to=4)
curve(dnorMix(x, obj=MW.nm9), from=-4, to=4)
curve(dnorMix(x, obj=MW.nm10), from=-4, to=4)


data = rnorMix(1e4, obj=MW.nm9)
curve(dnorMix(x, obj=MW.nm9), from=-4, to=4, 
      main="Density estimation of a sampled mixed normal", col="darkgreen",
      ylab="")
lines(density(data), col="red")
legend("topleft", legend=c("True density", "KDE"), fill=c("darkgreen", "red"))
