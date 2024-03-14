calc_precizie <- function(vector) {
   mean_value <- mean(vector)
   rounded_mean <- round(mean_value, 4)
   return(rounded_mean)
}
vector<-c(10, 0.98, 3.97, 1.97, 5.9)
print(calc_precizie(vector))

