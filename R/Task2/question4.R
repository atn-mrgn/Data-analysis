#function for creating a bootstrap sample 
Moving_blocks_bootstrap <- function(serie_data,l)
{
  #serie_data: The original time series
  #l         : The block length
  bloc=matrix(serie_data[1:l],1,l)
  n=length(serie_data)
  i=2
  cpt=1
  while ((i+l)<=n) {
    se=matrix(serie_data[i:(i+l-1)],1,l)
    bloc=rbind(bloc,se)
    i=i+1;
    cpt=cpt+1;
  }
  k=n%/%l
  samp=sample(1:cpt,k,replace = TRUE)
  out=NULL
  for(i in 1:k){
    out=c(out,bloc[samp[i],])
  }
  return(out) 
}

#---------------------------------------------------------------------------#
# Importing of the hormone data
library(readxl)
data=read.csv('hormone-1.csv')
#---------------------------------------------------------------------------#

#Bootstrap samples generation
l=3 # the particular block length specified
R=10 # The number of bootstrap samples to create

data_boot=matrix(1:48,ncol = 1)
for (i in 1:R) {
  data_boot=cbind(data_boot,matrix(Moving_blocks_bootstrap(data$level,l),ncol = 1))
}
data_boot=data_boot[1:48,2:R]
print(data_boot)
#---------------------------------------------------------------------------#

#Original time serie and some bootstrap samples plotting  
par(mfrow=c(2,3))
serie=as.ts(data$level)
ts.plot(serie)

for(i in 1:5){
  ts.plot(as.ts(data_boot[,i]))
}
#---------------------------------------------------------------------------#
#For each bootstrap sample, Let's estimate the AR(1) model using R function lm():
Beta_hat=NULL
Std_error=NULL
for(i in 1:(R-1)){
  yt=data_boot[,i]
  mu=mean(yt)
  z=yt-mu
  zt=z[1:(length(z)-1)]
  zt_1=z[2:length(z)]
  model <- lm(zt~zt_1-1)
  Beta_hat=c(Beta_hat,model$coefficients[[1]])
  Std_error=c(Std_error,sd(model$residuals)*sqrt(solve(t(zt_1)%*%zt_1)[1,1]))
}
param=data.frame('Betas estimated'=Beta_hat,'Standard Error'=Std_error)
print(param)

#---------------------------------------------------------------------------#
#Let's find the bootstrap standard error of β_hat using the bootstrap statistics obtained
boot_std_err=sd(param$Standard.Error)/sqrt(R-1)
print(boot_std_err)