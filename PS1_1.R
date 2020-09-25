
Print_values<- function(a,b,c){
  if(a>b){
    if(b>c){
      print(c(a,b,c))
    }else{
      if(a>c){
        print(c(a,c,b))
      }else{
        print(c(c,a,b))
      }
    }
  }else{
    if(b>c){
      if(a>c){
        print(c(b,a,c))
      }else{
        print(c(b,c,a))
      }
    }else{
      print(c(c,b,a))
    }
  }
}

Print_values(runif(1,min = 0,max = 100),runif(1,min = 0,max = 100),runif(1,min = 0,max = 100))

