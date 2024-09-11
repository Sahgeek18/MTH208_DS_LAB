##### Solutions of Worksheet 3
getwd()
setwd("D:/R_Programming/Worksheets/Worksheet3")

## Q1
rbinom(n = 1, size = 1, prob = 0.5)  # 1 toss
rbinom(n = 10, size = 1, prob = 0.5) # 10 tosses
?rbinom()
#1a
toss <- rbinom(n = 1000, size = 1, prob = 0.5)
heads <- sum(toss)
proportion <- heads/1000
proportion

#1b
toss1 <- rbinom(n = 1000, size = 1, prob = 0.30)
heads1 <- sum(toss1)
proportion1 <- heads1/1000
proportion1

##Q2
sample(x = 1:6, size = 1) # rolling a fair die
sample(x = 1:6, size = 1, prob = c(.1, .2, .1, .1, .3, .2))
runif(n = 5, min = 1, max = 10)

#2a
col <- c("red", "green", "blue")
probs <- c(3/7, 2/7, 2/7)
balls <- sample(col, size = 1000, prob = probs, replace = TRUE)
sum(balls == "green")
mean(balls == "green")

#2b
A <- matrix(c(3, 1, -2, 4, 5, 3, -1, 2, -2), nrow = 3, ncol = 3)
# A[1,]
# A[, 1]
y <- norm(A)
p <- numeric(length = 3)
for ( i in 1:3)
{
  p[i] <- norm(A[, i], "2")/y
}

sample(1:3, 1, prob = p)

#2c
runif(n = 1, 0, 5)

##Q3

#3a
exceed <- function()
{
  count <- 0
  sum <- 0
  while (sum <= 1) 
    {
     random = runif(n=1, min = 0, max = 1)
     sum = sum + random
     count = count + 1
  }
  return(count)
}
exceed()

#3b
store <- numeric(length = 1000)
for(r in 1:1000)
{
  store[r] <- exceed()
}
store
#3c
mean(store)

##Q4
#4a
func <- function(age)
{ attempts <- 0
  while (age > 0) 
  {
    blown <- sample(1:age, size = 1)
    age <- age - blown
    attempts <- attempts + 1
  }
return(attempts)
}
func(25)

#4b
vect <- numeric(length = 1000)
for (i in 1:1000) 
{
  
  vect[i] <- func(25)
}
vect

#4c
mean(vect)

#4d
candle <- function(age)
{ 
  count1 <- 0
  while(age > 0)
  {
    blown1 = sample(1:age, size = 1)
    age = age - blown1
    count1 = count1 + 1
  }
  return(count1)
}
candle(30)

keep <- numeric(length = 1000)
for(i in 1:1000)
{
  keep[i] = candle(30)
}
keep
mean(keep)















birthday <- function(age)
{
  count <- 0
  while (age > 0)
  {
    candle <- sample(x = 1:age, size = 1, replace = TRUE)
    age <- age - candle
    count <- count + 1
  }
  return (count)
}

store <- numeric( length = 1000)
for (i in 1:1000)
{
  store[i] <- birthday(30)
}
print(mean(store))

#######

A <- matrix(c(3, 1, -2, 4, 5, 3, -1, 2, -2), nrow = 3, ncol = 3)
A

probs <- numeric(length = 3)
for (i in 1: ncol(A))
{
  probs[i] <- norm(A[, i], type = "2")
}

p <- probs/sum(probs)

sample(x  = 1: ncol(A), size = 1, prob = p)

# runif(n = 1, min = 0, max = 5)

exceed <- function()
{
  count <- 0
  sum <- 0
  while(sum <= 1)
  {
    y<- runif(n = 1, min = 0, max = 1)
    sum <- sum + y
    count <- count + 1
  }
  return (count)
}


store <- numeric(length = 1000)
for( i in 1:1000)
{
  store[i] <- exceed()
}
print(mean(store))
















