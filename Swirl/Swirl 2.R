# 8. Logic

TRUE == TRUE
(FALSE == TRUE) == FALSE
6 == 7
6 < 7
10 <= 10

# 1: 7 == 7
# 2: 6 < 8
# 3: 9 >= 10 FALSE
# 4: 0 > -36

# 1: 57 < 8
# 2: 9 >= 10
# 3: 7 == 9
# 4: -6 > -7 TRUE

!(5 == 7)

# 1: !FALSE
# 2: !(0 >= -1) FALSE
# 3: 9 < 10
# 4: 7 != 8

(TRUE != FALSE) == !(6 == 7)
FALSE & FALSE
TRUE & c(TRUE, FALSE, FALSE)
TRUE && c(TRUE, FALSE, FALSE)
TRUE | c(TRUE, FALSE, FALSE)
TRUE || c(TRUE, FALSE, FALSE)

5 > 8 || 6 != 8 && 4 > 3.9

# 1: TRUE && 62 < 62 && 44 >= 44
# 2: 99.99 > 100 || 45 < 7.3 || 4 != 4.0
# 3: TRUE && FALSE || 9 >= 4 && 3 < 6 TRUE
# 4: FALSE || TRUE && FALSE

# 1: !(8 > 4) ||  5 == 5.0 && 7.8 >= 7.79
# 2: FALSE && 6 >= 6 || 7 >= 8 || 50 <= 49.5 FALSE
# 3: 6 >= -9 && !(6 > 7) && !(!TRUE)
# 4: FALSE || TRUE && 6 != 4 || 9 > 4

isTRUE(6 > 4)

# 1: !isTRUE(8 != 5)
# 2: isTRUE(NA)
# 3: isTRUE(!TRUE)
# 4: isTRUE(3)
# 5: !isTRUE(4 < 3) TRUE

identical('twins', 'twins')

# 1: identical(4, 3.1)
# 2: identical('hello', 'Hello')
# 3: identical(5 > 4, 3 < 3.1) TRUE
# 4: !identical(7, 7)

xor(5 == 6, !FALSE)

# 1: xor(!isTRUE(TRUE), 6 > -1)
# 2: xor(identical(xor, 'xor'), 7 == 7.0)
# 3: xor(4 >= 9, 8 != 8.0) FALSE
# 4: xor(!!TRUE, !!FALSE)

ints <- sample(10)
ints
ints > 5

which(ints > 7)

# 1: ints <= 2
# 2: which(ints <= 2)
# 3: which(ints < 2)
# 4: ints < 2

any(ints < 0)
all(ints > 0)

# 1: any(ints == 10) TRUE
# 2: all(c(TRUE, FALSE, TRUE))
# 3: all(ints == 10)
# 4: any(ints == 2.5)


# 9. Functions

Sys.Date()
mean(c(2, 4, 5))

boring_function <- function(x) {
  x
}
# Make sure to save your script before you type submit().
boring_function('My first function!')
boring_function

my_mean <- function(my_vector) {
  sum(my_vector) / length(my_vector)
}
my_mean(c(4, 5, 10))

remainder <- function(num, divisor = 2) {
  num %% divisor
}
remainder(5)
remainder(11, 5)
remainder(divisor = 11, num = 5)
remainder(4, div = 2)
args(remainder)

evaluate <- function(func, dat){
  func(dat)
}
evaluate(sd, c(1.4, 3.6, 7.9, 8.8))
evaluate(function(x){x+1}, 6)
evaluate(function(x){head(x, 1)}, c(8, 4, 0))
evaluate(function(x){tail(x, 1)}, c(8, 4, 0))

?paste
paste("Programming", "is", "fun!")
telegram <- function(...){
  paste("START", ..., "STOP")
}

mad_libs <- function(...){
  # Do your argument unpacking here!
  args <- list(...)
  place <- args[["place"]]
  adjective <- args[["adjective"]]
  noun <- args[["noun"]]
  # Don't modify any code below this comment.
  # Notice the variables you'll need to create in order for the code below to
  # be functional!
  paste("News from", place, "today where", adjective, "students took to the streets in protest of the new", noun, "being installed on campus.")
}
mad_libs(place = "Busan", adjective = "Smart", noun = "policy")

"%p%" <- function(left, right){ # Remember to add arguments!
  paste(left, right)
}
"I" %p% "love" %p% "R!"


# 14. Dates and Times

d1 <- Sys.Date()
class(d1)
unclass(d1)
d1
d2 <- as.Date("1969-01-01")
unclass(d2)
t1 <- Sys.time()
t1
class(t1)
unclass(t1)
t2 <- as.POSIXlt(Sys.time())
class(t2)
t2
unclass(t2)
str(unclass(t2))
t2$min
weekdays(d1)
months(t1)
quarters(t2)
t3 <- "October 17, 1986 08:24"
t4 <- strptime(t3, "%B %d, %Y %H:%M")
t4
class(t4)
Sys.time() > t1
Sys.time() - t1
difftime(Sys.time(), t1, units = 'days')
