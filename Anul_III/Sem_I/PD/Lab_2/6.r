size<-c(178,175,160,191,176,155,163,174,182)
size_1<-c(164, 172, 156, 195, 166)
new.size <- c(rep(size_1, each = 2), tail(size, 7))
print(new.size)
write.csv(new.size, file = "new_size.csv")

