
x <- seq(-6, 6, length.out = 1000)
 y <- dnorm(x, mean = 0, sd = 1)
 plot(x, y, type = "l", lwd = 2, col = "black", xlab = "x", ylab = "dnorm(x)")
 legend("topright", legend = "Distribuție normală între -6 și 6", col = "black", lwd = 2)
abline(h=0, col="black", lty = 2)
abline(v=0, col="black", lty = 2)

