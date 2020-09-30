Least_moves <- function(x){
  i <- 0
  while(x != 1){
    if(odd(x)){
      x <- x-1
      i <- i+1
    }else if(even(x)){
      x <- x/2
      i <- i+1
    }
  }
  print(i)
}
y <- sample(1:100,1)
sprintf('The least moves to %i is:',y)
Least_moves(y)
