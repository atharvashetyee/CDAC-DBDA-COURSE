install.packages('readxl')

#starting package
library(readxl)
getwd()
setwd("C:/Users/athar/Downloads")

#loading data
df=read_excel("Data (2).xlsx",sheet="August25")
df

#to search on the basis of location
v1=df$Location
v1
t1=which(v1=="RTG")
df[t1,1]

#stu marks >95
v2=df$Marks
t2=which(v2>95)
df[t2,c(1,3)]

df[which(df$Marks>95),c(1,3)] #optimized command
df[which(df$Marks>95),c("StudentName","Marks")] 

df[which(df$Marks>95 & df$Location=="DBI"),c("StudentName","Marks")] # adding location contraint


df[which(v2>95 & v1=="DBI"),]

##==============================================================================================================

#Creating function
myfunc=function(a,b){
  c=2*a+b
    print(c)
}

#create a fuction with default value
myfunc=function(a,b,m=2){
  c=m*a+b
  print(c)
}

myfunc=function(a,m=2,b){
  c=m*a+b
  print(c)
}




