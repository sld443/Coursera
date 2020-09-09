install.packages("swirl")

library(swirl)

swirl()

Hyeon

# 12. Looking the Data

ls()
class(plants)
dim(plants)
nrow(plants)
ncol(plants)
object.size(plants)
names(plants)
head(plants)
head(plants, 10)
tail(plants)
tail(plants, 15)
summary(plants)

table(plants$Active_Growth_Period)
str(plants)


# 13. Simulation

?sample
sample(1:6, 4, replace = TRUE)
sample(1:20, 10)
LETTERS
sample(LETTERS)
flips <- sample(c(0, 1), 100, replace = TRUE, prob = c(0.3, 0.7))
flips
sum(flips)

?rbinom
rbinom(1, size = 100, prob = 0.7)
flips2 <- rbinom(n = 100, size = 1, prob = 0.7)
flips2
sum(flips2)

?rnorm
rnorm(10)
rnorm(10, 100, 25)
rpois(5, 10)
replicate(100, rpois(5, 10))
my_pois <- replicate(100, rpois(5, 10))
my_pois
cm <- colMeans(my_pois)
hist(cm)


# 15. Base Graphics

data(cars)
?cars
head(cars)
plot(cars)
?plot
plot(cars$speed, cars$dist)
plot(cars$dist, cars$speed)
plot(cars$speed, cars$dist, xlab = "Speed")
plot(cars$speed, cars$dist, ylab = "Stopping Distance")
plot(cars$speed, cars$dist, xlab = "Speed", ylab = "Stopping Distance")
plot(cars, main = "My Plot")
plot(cars, sub = "My Plot Subtitle")
plot(cars, col = 2)
plot(cars, xlim = c(10, 15))
plot(cars, pch = 2)

data(mtcars)
?boxplot
boxplot(formula = mpg ~ cyl, data = mtcars)
hist(mtcars$mpg)
