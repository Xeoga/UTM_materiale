mat<-matrix(c(1,2,3,5,10,12,13,22,5,9,8,34,7,1,4,3),nrow=4, byrow=TRUE)
print(mat[3,2])
print(mat[2,])
print(mat[,4])
mat_2<-mat[-1,-2]
print(mat_2)
write.table(mat, file="data.txt", sep="\t", row.names=FALSE, col.names=FALSE)
