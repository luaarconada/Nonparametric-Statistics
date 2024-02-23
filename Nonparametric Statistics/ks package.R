library(ks)

n = 20
x = rt(n, df = 2)
kde = kde(x)
kde0 = density(x, bw.SJ(x, method = 'dpi'))
plot(kde, col='red', main = 'Comparison kde and density')
lines(kde0,col='blue')

#We see that both functions are pretty equal, so we can use them interchangeably
#If we wanna plot it using lines, the command is lines(kde$eval.points)


Fn = ecdf(x)
kcde=kcde(x)
plot(kcde)
#lines(kcde$eval.points,kcde$estimate, col = 'blue') does the same as plot(kcde)
lines(Fn, col = 'red')
curve(pt(x, df = 2),col='blue',add = TRUE)
lines(sort(x),sort(Fn(x)), type = 's', col = 'deeppink')


#Deivative of the density (default deriv.order=0 is the same as kde)
plot(kdde(x, deriv.order = 5))