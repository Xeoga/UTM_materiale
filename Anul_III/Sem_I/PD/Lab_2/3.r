Y <- matrix(c(1, 0, 3, 4, 6, 6, 0, 4, 5, 6, 2, 3, 0, 1, 2, 4), nrow = 4, dimnames = list(c("row-1", "row-2", "row-3", "row-4"), c("column 1", "column 2", "column 3", "column 4")))
print(Y)
determitatY<-det(Y)
cat("Determinatul este:",determitatY,"\n")
inverseY <- solve(Y)
cat("Inversul este:","\n")
print(inverseY)


