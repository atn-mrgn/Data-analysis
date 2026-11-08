## Question[1]

A = matrix(data = c(c(7,-3,2), c(4,9,5)), nrow = 2, byrow = TRUE)
B = matrix(data = c(c(1,3), c(2,-1)), nrow = 2, byrow=TRUE)
### 1. 
#### transpose
Aprim<-t(A)
print(Aprim)

#### verification
Aprim.prim<-t(t(A))
print(Aprim.prim)

### 2.
#### Product BA
BA = B%*%A
print(BA)

####Solving
R=matrix(c(0,0), ncol = 1, byrow = FALSE)
sol<-solve(B,R)
print(sol)


