addR <- function(x, y)
{
  return(x + y)
}
addR(45,45)

install.packages("Rcpp")
library(Rcpp)

cppFunction('int addC(int x, int y) {
int sum = x + y;
return sum;
}')

addC(45, 5)


### Eucledian distance

EucR <- function(x, y )
{
    rtn <- sqrt(sum(x-y)^2)
    return(rtn)
}
EucR(2, 3)

cppFunction('double EucC(NumericVector x, NumericVector y){
  double track = 0;
  int n = x.size();
  
  for(int i= 0; i< n ; i++){
    track = track + pow((x[i] - y[i]), 2);
  }
  track = sqrt(track);
  return track;
}
')

x <- 1:10
y <- 3:12

EucC(x, y)


all.equal(EucR(x, y), EucC(x, y))

### Benchmarking both the functions
install.packages("rbenchmark")
library(rbenchmark)

a <- 1:1e4
b <- 1:1e4
benchmark(EucR(a, b), EucC(a, b), replications = 10000)



## Problems
func <- function(vec)
{
  n <- length(vec)
  # for tracking sum and log
  sum.log <- 0
  log.of.vec <- numeric(length(n))
  # calculating logs and sum for each element
  for(i in 1:n)
  {
    log.of.vec[i] <- log(vec[i])
    sum.log <- sum.log + log.of.vec[i]
  }
  # fraction
  frac <- log.of.vec/sum.log
  return(frac)
}
func(c(1,2,3,4))


### better version
funcR <- function(vec)
{
  temp <- log(vec)
  frac <- temp/sum(temp)
  return(frac)
}
funcR(c(1,2,3,4))

#### benchmarking these two first

d <- 1:1e4

benchmark(funcR(d), funcC(d), replications = 100)


#### in C++

cppFunction('NumericVector funcC(NumericVector vec){
  double sum_log = 0;
  int n = vec.size();
  NumericVector log_vec (n);
  NumericVector frac_vec (n);
  
  for(int i=0; i<n; i++){
  log_vec[i] = log(vec[i]);
  sum_log = sum_log + log_vec[i];
  }
  
  for(int j =0; j<n; j++){
  frac_vec[j] = log_vec[j]/sum_log;
  }
  
  return frac_vec;
}')


benchmark(func(d), funcR(d), funcC(d), replications = 100)


## addding two matrices together

cppFunction('NumericMatrix (NumericMatrix x(3), NumericMatrix y(3))
{
  int n = x.nrow();
  int m = y.ncol();
  
}')



































