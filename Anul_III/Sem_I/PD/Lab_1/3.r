vector=1:10
matrice1=matrix(vector, ncol=2)
matrice1
matrice2=matrix(1:10, nrow=2, byrow=T)
matrice2
m=matrix(1:4, nrow=3, ncol=3)
m
print(matrice2)
dim(matrice1)
ncol(matrice1)
nrow(matrice1)
resultat=matrice1 %*% matrice2
#Sarcina 4
cat("Sarcina 4\n")
dim(matrice1)
ncol(matrice1)
nrow(matrice1)
resultat=matrice1 %*% matrice2
t(matrice1)
diag(resultat)
diag(c(3,2,4))
vecteur1<-c(8,3,2)
vecteur2<-c(23,6,9)
res=rbind(vecteur1,vecteur2)
vecteur3<-c(2,4)
res=rbind(vecteur1, vecteur2)
vecteur3<-c(2,4)
cbind(res, vecteur3)
eigen(resultat)
#Sarcina 5
cat("Sarcina 5\n")
resultat[1,]
resultat[,c(2,2,1)]
resultat[-1,]
resultat[1:2,-1]
resultat[resultat>51]
matrix(vector, nrow=2)
matrix(vector, nrow=2, byrow=T)
