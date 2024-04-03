library(np)
wine = read.csv('wine.csv')
x = wine$AGST
y = wine$Price

par(mfrow=c(1,2))

bwll = npregbw(y~x, regtype = 'll')
grid = seq(6, 8.5, by = 0.1)
fitll = npreg(bwll, exdat = grid)
plotll = npplot(bwll, plot.errors.method = 'asymptotic', plot.errors.style = 'bar', plot.behavior = 'plot-data', col = 'blue', lw = 2)
plotll

alpha = 0.05
xll = plotll$r1$eval[,1]
yhighll = plotll$r1$mean + plotll$r1$merr[,1]
ylowll = plotll$r1$mean + plotll$r1$merr[,2]
lines(xll, yhighll, col = 'red', lw = 2)
lines(xll, ylowll, col = 'red', lw = 2)


bwlc = npregbw(y~x, regtype = 'lc')
grid = seq(6, 8.5, by = 0.1)
fitlc = npreg(bwlc, exdat = grid)
plotlc = npplot(bwlc, plot.errors.method = 'asymptotic', plot.errors.style = 'bar', plot.behavior = 'plot-data', col = 'blue', lw = 2)
plotlc

alpha = 0.05
xlc = plotlc$r1$eval[,1]
yhighlc = plotlc$r1$mean + plotlc$r1$merr[,1]
ylowlc = plotlc$r1$mean + plotlc$r1$merr[,2]
lines(xlc, yhighlc, col = 'red', lw = 2)
lines(xlc, ylowlc, col = 'red', lw = 2)

