data("airquality")
summary(airquality)
# Media
mean_temp<-mean(airquality$Temp, na.rm=TRUE)
print(paste("Media este:", mean_temp))
# Mediana
median_temp<-median(airquality$Temp, na.rm=TRUE)
print(paste("Mediana este:", median_temp))
# Abateri
sd_temp<-sd(airquality$Temp, na.rm=TRUE)
print(paste("Abaterea este:", sd_temp))
# Varianta
var_temp<-var(airquality$Temp, na.rm=TRUE)
print(paste("Varianta: ",var_temp))

#Functie pentru calculul abaterii
calculate_sd<-function(x){
	sqrt(var(x, na.rm=TRUE))
}
sd_temp<-calculate_sd(airquality$Temp)
print(paste("Temp: ", sd_temp))
#A doua linie:
second_row<-airquality[2,]
#print("Liniia a 2:",second_row)
#A trei coloana
third_column<-airquality[,3]
#Liniile 1,2,4 
specific_rows<-airquality[c(1,2,4),]
#Liniile 2-6
row_2_to_6<-airquality[2:6, ]
# Toate cu exceptia la 1,2
except_first_two_columns<-airquality[, -c(1,2)]
# Liniiele cu temperatura mai mare 90
temp_above_90 <- airquality[airquality$Temp > 90, ]

