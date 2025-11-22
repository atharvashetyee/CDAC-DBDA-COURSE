#Matrix
m1=matrix(1:24,nrow=3)
m1
#syntax ==> (input,nrow/ncol or both but either one should be mentioned)

m1=matrix(1:24,ncol=6)
m1

m1=matrix(1:24,ncol=5)
m1

m1=matrix(1:24,ncol=5,nrow=6)
m1

#to fill matrix in row format
m1=matrix(1:24,ncol=6,byrow=T)
m1

x1=c(3,6,5,8)
x2=c(5,4,2,9)
x3=c(1,4,3,7)
m1=rbind(x1,x2,x3)  #to fill vectors in row format we use rbind
m1

m1=cbind(x1,x2,x3) #to fill vectors in column format we use rbind
m1

#to extract single value
m1[3,2] # syntax [row,coln]

#to change at particular location
m1[3,2]=3
m1

m1[3,] #gives specific row as op

m1[,1] #gives specific coln as op

m1[,c(1,3)] #gives multiple rows,coln in single command
m1[c(1,3),]

m1=rbind(m1,c(2,5,8),c(4,6,2))
m1
#add more rows in pre existing matrix 

m1=cbind(m1,x4=c(4,7,6,2,1,3))
m1
#add more rows in pre existing matrix 

m1[,-3] #to get display without that column 
m1

m1[-2,] #to get display without that row
##==============================================================================================================
#dataframe allows you to have different datatype in same set.set
# both have similarity that, they are 2D dataset

##==============================================================================================================
stu_df= data.frame(Name=c("Yash","Atharva","Mridula"),Marks=c(60,70,80)) #data is stored by default in coln format
stu_df
#use of data frame allow to have diff type oF data in same set

stu_df[,2] #dataframe is combination of vector,so every coln you extract thats the vector

stu_df$Marks #to get specified column ,works only in data frame






