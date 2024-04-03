# D3) The dataset sunspots births from package ”rotasym” contains the recorded sunspots births
# during 1872–2018 from the Debrecen Photoheliographic Data (DPD) catalog. The dataset presents
# 51, 303 sunspot records, featuring their positions in spherical coordinates (θ and ϕ), sizes
# (total area), and distances to the center of the solar disk (dist sun disc).
library(rotasym)
data = sunspots_births

# a) Compute and plot the KDE for ϕ using the DPI selector. Describe the result.

kde = density(data$phi, bw = bw.SJ(data$phi, method = 'dpi'))
plot(kde, main = 'KDE of variable phi', lwd = 2, col = 'blue')

# b) Compute and plot the kernel density derivative estimator for phi using the adequate DPI
# selector. Determine approximately the location of the main mode(s).

library(ks)
kdde_1 = kdde(x = data$phi, h = bw.SJ(data$phi, method = 'dpi'), deriv.order = 1)
plot(kdde_1, xlab = 'phi', main = "Density derivative estimation for phi", ylab = '', lwd = 2)

modes = kdde_1$eval.points[which.max(kdde_1$estimate)]
modes

# c) Compute the log-transformed KDE for total area using the NS selector.

log = log(data$total_area)
kdelog = density(log)
hns = ks::hns(x = kdelog$x)
kdepost = density(log, bw = hns)
plot(exp(kdepost$y))

# d) Draw the histogram of M = 10000 samples simulated from the KDE obtained in a.
M = 10000
samples <- sample(x = kde$x, size = 10000, replace = TRUE, prob = kde$y)
hist(samples, freq=FALSE, col='lightblue', border='black', main='Histogram of 10,000 Samples from KDE', xlab = '', ylab = '')
lines(density(samples), col='red', lwd=2)
lines(kde, col = 'black', lw =2)
