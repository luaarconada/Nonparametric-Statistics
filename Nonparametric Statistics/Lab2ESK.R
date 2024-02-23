library(nor1mix)

?nor1mix::MarronWand

X11()

curve(dnorMix(x = x, obj = MW.nm9),xlim=c(-3,3),xlab="x",ylab="f(x)")

n=500
X=rnorMix(n, obj = MW.nm9)
kde1=density(X,bw=bw.SJ(X,method="dpi"))
kde2=density(X,bw=bw.nrd(X))
kde3=density(X,bw=bw.ucv(X))

lines(kde1$x,kde1$y,col="red")
lines(kde2$x,kde2$y,col="blue")
lines(kde3$x,kde3$y,col="green")

legend("topright",legend=c("bw.SJ","bw.nrd","bw.ucv"),col=c("red","blue","green"),lty=1,lwd=2)

# other (shorter) way for plotting

X11()
curve(dnorMix(x = x, obj = MW.nm9),xlim=c(-3,3),xlab="x",ylab="f(x)")
lines(kde1,col="red")
lines(kde2,col="blue")
lines(kde3,col="green")

legend("topright",legend=c("bw.SJ","bw.nrd","bw.ucv"),col=c("red","blue","green"),lty=1,lwd=2)
