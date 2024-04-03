data("oecdpanel")
head(oecdpanel)

bw = npregbw(growth~oecd + year + initgdp, data = oecdpanel, bwtype = 'generalized_nn')

fit = npreg(bw)
plot(fit, xlim = c(-10,10), ylim = (-5,5))
