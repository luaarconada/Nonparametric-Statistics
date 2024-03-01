# Exercise 2.1
by = (min(iris$Sepal.Length)-max(iris$Sepal.Length))/5
breaks = seq(min(iris$Sepal.Length), max(iris$Sepal.Length), by = (max(iris$Sepal.Length)-min(iris$Sepal.Length))/5)
hist(iris$Sepal.Length, probability = TRUE, breaks = breaks)
rug(iris$Sepal.Length)

hist(iris$Sepal.Length, breaks = seq(4.3, 8.3, by = 1))
rug(iris$Sepal.Length)
