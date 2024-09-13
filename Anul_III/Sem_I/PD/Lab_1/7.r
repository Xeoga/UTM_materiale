read_and_plot<-function(file_name){
	data <- read.table(file_name, header=FALSE)
	plot(data[,1], data[,2], main="Scatter Plot of data.txt", xlab="Column 1", ylab="Column 2")
}
print(read_and_plot("data.txt"))
