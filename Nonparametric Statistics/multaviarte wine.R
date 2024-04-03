wine = read.csv('wine.csv')

bwgen = npregbw(wine$Price~wine$AGST + wine$WinterRain, bwtype = 'generalized_nn')
grid = seq(6, 8.5, by = 0.1)
fitgen = npreg(bwgen)
plotgen = plot(fitgen, plot.errors.method = 'asymptotic', view = 'fixed', col = 'blue', lw = 2)

# npindexbw, npindex
