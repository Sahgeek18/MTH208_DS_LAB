### Coding efficiently (Stability)
 
library(rbenchmark)

num <- numeric(length = 1e3)
object.size(num)


mat1 <- matrix(runif(100*1000), nrow = 100, ncol = 1000)
mat2 <- matrix(0, nrow = 100, ncol = 1000)

object.size(mat1)
## to convert it into kb divide by 1024


arr <- array(0, dim = c(100,100,100))
## Guess is 8*1e6 
object.size(arr)

#### Saving the data in a csv file

n <- 1e4
p <- 1e2

dat <- matrix(runif(n*p), nrow = n, ncol = p)
write.csv(dat, file = "bigData.csv", row.names = FALSE)

### loading the data
temp <- read.csv("bigData.csv")

save(dat, file = "largeData.Rdata")
load("largeData.Rdata")


##### Question 3

v1 <- seq(1, 1e5, 2)
object.size(v1)
sqrt(sum(v1^2))
norm(v1, "2")



#### Qn 5.
str_func <- function(n)
{
  a1 <- factorial(n)/((n^n/exp(n))*(sqrt(2*pi*n)))
  return(a1)
}

str_func(100)

plot(1:10, str_func(1:10), type = "b")


### we can try to break our function using log
str_log.func <- function(n)
{
  a1 <- log(factorial(n)) - log((n^n/exp(n))*(sqrt(2*pi*n)))
  return(a1)
}
str_log.func(2000) ## failed here



##### stable version of this function
stir_stab <- function(n)
{
  rtn <- lfactorial(n) + n*(1 - log(n)) - log(2*pi*n)/2
  return(exp(rtn))
}

stir_stab(100000)

# plotting the above version
test <- 10^(1:6)
plot(test, str_log.func(test), type = "b")



#### Qn 6

func <- function(n = 1e3)
{
  nums <- 1:(n^2)
  mat <- matrix(nums, nrow = n, ncol = n)
  means <- apply(mat, 2, mean)
  norm.means <- sqrt(sum(means^2))
  return(norm.means)
}

func(5)



#### better version

func_2 <- function(n = 1e3)
{
  nums <- 1:(n^2)
  mat <- matrix(nums, nrow = n, ncol = n)
  norm.means <- norm(apply(mat, 2, mean), "2")
  return(norm.means)
}

func_2(5)








































