while(TRUE){
  num <- seq(1:9)
  sign <- ['+','-','']
  
  for(i in length(num)){
    Random <- sample(1:3,1)
    num[i] <- sign[Random]+num[i]
  }
  
}
