 calcStats <- function(vector, option) {
   if (option == "medie") {
     result <- mean(vector)
   } else if (option == "mediană") {
     result <- median(vector)
   } else if (option == "SD") {
     result <- sd(vector)
   } else {
     result <- "Opțiune nevalidă"
   }
   
   return(result)
 }
myVector<-c(1,2,3,4,5)
print(calcStats(myVector, "medie"))

