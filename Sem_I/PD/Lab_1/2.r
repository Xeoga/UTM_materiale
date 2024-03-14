varianta_vector <- function(vector){
	n<-length(vector)
	media<-mean(vector)
	suma_patrate<-sum((vector - media)^2)
	varianta<-suma_patrate/(n-1)
	return(varianta)
}
x<-(1:10)
rez=varianta_vector(x)
cat("Varianta este:", rez)
