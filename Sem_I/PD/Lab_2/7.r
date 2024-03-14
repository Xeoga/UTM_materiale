data("iris")
head(iris,7)
new.iris <- subset(iris, Species == "versicolor")
new.iris <- new.iris[order(-new.iris$Sepal.Length), ]
head(new.iris)

