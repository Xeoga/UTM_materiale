cat("Datele din setul Orange:\n")
summary(Orange)
cat("Orange age:\n")
summary(Orange$age)
cat("Orange circumferente:\n")
summary(Orange$circumference)

Q_age<-quantile(Orange$age)
Q_circumference<-quantile(Orange$circumference)
cat("Quantile age:\n")
print(Q_age)
cat("Quantile circumference:\n")
print(Q_circumference)

