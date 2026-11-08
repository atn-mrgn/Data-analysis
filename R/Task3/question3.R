#1
ext_point_finder <- function(x_ref,x_comp)
{
  min_comp=min(x_comp)
  max_comp=max(x_comp)
  ext_Point=NULL
  for (i in 1:length(x_ref)) {
    if((x_ref[i]>max_comp)||(x_ref[i]<min_comp))
      ext_Point=c(ext_Point,x_ref[i])
  }
  return(ext_Point)
}

set.seed(1)
x1 = rnorm(20, 0, sd = 1); x1 = x1 - mean(x1)
x2 = rnorm(20, 0, sd = 1.5); x2 = x2 - mean(x2)

m1_hat=length(ext_point_finder(x1,x2))
m2_hat=length(ext_point_finder(x2,x1))
m_hat=max(m1_hat,m2_hat)
print(m1_hat)
print(m2_hat)
print(m_hat)

#2
m_hatEmpDist=NULL
for(i in 1:100){
  x_1 = rnorm(20, 0, sd = 1); x_1 = x_1 - mean(x_1)
  x_2 = rnorm(20, 0, sd = 1.5); x_2 = x_2 - mean(x_2)
  
  m1_hat=length(ext_point_finder(x_1,x_2))
  m2_hat=length(ext_point_finder(x_2,x_1))
  m_hatEmpDist=c(m_hatEmpDist,max(m1_hat,m2_hat))
}
m_hatEmpDist # the m_hat's empirical distribition obtained
se=sd(m_hatEmpDist)/length(m_hatEmpDist) 
print(se) # The Standard error se


Fn<- ecdf(m_hatEmpDist) 
# P(m_hat>3)
p1=1-Fn(3)
print(p1)

# P(m_hat>4)
p2=1-Fn(4)
print(p2)

# P(m_hat>5)
p3=1-Fn(5)
print(p3)

# P(m_hat>6)
p4=1-Fn(6)
print(p4)

#3

#The null hypothesis of equal variance will be accepted if p_value >0.05 because in 
#this case,data doesn't allow us to reject it
var.test(x1, x2)$p.value

#4
set.seed(1)
N=100
n=20
rejected=NULL
for(i in 1:N){
  x=rnorm(n, mean = 0, sd = 1)
  y=rnorm(n, mean = 0, sd = 1)
  pv=var.test(x,y)$p.value
  if(pv>0.05){
    rejected=c(rejected,0)
  }else{
    rejected=c(rejected,1)
  }
}

#Let's find how many times you have made a type I error.
rejected_number=sum(rejected==1)
print(rejected_number)

# Estimation of the probability of the type I error
err_estm=rejected_number/length(rejected)
print(err_estm) #the type I error estimated


#5
set.seed(1)
N=100
n1=20
n2=40
rejected=NULL
for(i in 1:N){
  x=rnorm(n1, mean = 0, sd = 1)
  y=rnorm(n2, mean = 0, sd = 1)
  pv=var.test(x,y)$p.value
  if(pv>0.05){
    rejected=c(rejected,0)
  }else{
    rejected=c(rejected,1)
  }
}

#Let's find how many times you have made a type I error.
rejected_number=sum(rejected==1)
print(rejected_number)

# Estimation of the probability of the type I error
err_estm=rejected_number/length(rejected)
print(err_estm) #the type I error estimated

## 6. power of estimation
set.seed(1)
x1 = rnorm(20, 0, sd = 1); 
x2 = rnorm(20, 0, sd = 1.5);
print(var.test(x1, x2))
Fn=ecdf(x1)
beta <- 1-(Fn(0.41)-Fn(0.06))
print(beta)
