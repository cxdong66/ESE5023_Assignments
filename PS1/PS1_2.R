M1 <- matrix(round(runif(50,0,50)), ncol = 10, nrow = 5) 
M2 <- matrix(round(runif(50,0,50)), ncol = 5, nrow = 10) 

Matrix_multip <- function(M1,M2){
  M0 <- matrix(ncol = ncol(M2),nrow = nrow(M1))
  for (a in 1:nrow(M1)){
    j1 <- 0
    j2 <- 0
    j3 <- 0
    j4 <- 0
    j5 <- 0
    for(b in 1:ncol(M1)){
      R1 <- M1[a,b] * M2[b,1] 
      j1 <- j1 + R1
      R2 <- M1[a,b] * M2[b,2]
      j2 <- j2 + R2
      R3 <- M1[a,b] * M2[b,3]
      j3 <- j3 + R3
      R4 <- M1[a,b] * M2[b,4]
      j4 <- j4 + R4
      R5 <- M1[a,b] * M2[b,5]
      j5 <- j5 + R5
      M0[a,] <- c(j1,j2,j3,j4,j5)
    }
  } 
  print(M0)
}
Matrix_multip(M1,M2)

M_test <- M1%*%M2

print(M_test)