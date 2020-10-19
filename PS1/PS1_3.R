
Pascal_triangle <- function(k){
  PT <- matrix(0,nrow = k,ncol = k)
  PT[,1] <- 1 
  for(i in k){
    PT[i,i] <- 1
  }
  for(i in 3:k){
    for(j in 2:(k-1)){
      PT[i,j] <- PT[i-1,j-1] + PT[i-1,j]
    }
  }
  print('The line of Pascal triangle is:')
  print(PT[k,])
}

Pascal_triangle(10)
