
 library(ggplot2)
 x <- seq(0.5, 3 * pi, length.out = 100)
 y <- sin(x)
 
 df <- data.frame(x, y)
 plot <- ggplot(df, aes(x,y)) + geom_line(color = "red", linewidth = 1.5)+labs(title = "Graficul funcției sinus")
 print(plot)
