t1=which(airquality$Temp>=65)
t1
df=airquality[t1,]
df

t2=which(airquality$Temp<=65)
df2=airquality[which(airquality$Temp<=65),]
df2
#create table using temp<65 and >65

#using subset
df3=subset(airquality[t2,])
df3


#sort command
x1=c(4,8,7,6,5) 
x2=sort(x1)  #sorts the vector in ascending order
x2

x3=sort(x1,decreasing = T) #desc order

order(x1) #index of lowest value to the highest value

order(x1,decreasing=T) #gives opposite from above

#which and order have output in form of index

library(readxl)
df=read_excel('CDAC_DataBook.xlsx',sheet='ERPData')
head(df)

length(unique(df$MaterialID)) #distinct material id (count)
nrow(df)

t1=order(df$Quantity)
t1

df1=df[t1,]
df1

df2=sort(df$MaterialID)
df2

ordr1=order(df$Location,df$MaterialID,df$Quantity) 
df3=df[ordr1,]
print(df3,n=50)
#sorting is done in the sequence, so whats written first will be clubbed together


df1=data.frame(Name=c('A','B','C'),Marks=c(45,67,83))
df1

df2=data.frame(Name=c('F','N','A'),Grades=c(37,68,45))
df2
merge(df1,df2)
#when col names are different, we can use colnames(df1)[table_number]=name to manually change the name, but it is
#tidious and might lead to errors while giving name

#if coln names are not same you cant perform bind operation on it

colnames(df2)[2]="Marks"

colnames(df1)=colnames(df2) #optimized way to do it, to change name
df2


Pune=read_excel("CDAC_DataBook.xlsx",sheet = "Pune")
Mumbai=read_excel("CDAC_DataBook.xlsx",sheet = "Mumbai")

merge(Pune,Mumbai,by='Subject') #merges the rows where subject coln is common in both tables
#the " by" one,where the row names are same,then the names are name from talbe with less occurance repeat itself.

merge(Pune,Mumbai,by=c('Subject','Grade'))

sal=read_excel('CDAC_DataBook.xlsx',sheet='Salary')
sal
dept=read_excel('CDAC_DataBook.xlsx',sheet='Deptt')
dept

merge(sal,dept,all=T) #all=T takes all the rows from both the tables, if row is only present in one table and after 
#merging then row only in one table will show NA as value to other place,which data was absent.
#this works like union/all

merge(sal,dept,all.x = T)
#just like left join, works like taking value from left table and only the common one present in right, so you might get
#NA in dept as all rows might not be present in second/right table.

merge(sal,dept,all.y = T) #vice versa for the above command,na values might come in salary.

install.packages('dplyr')
install.packages('tidyr')
library(dplyr)
library(tidyr)

round(12.345345,2)
12.34574 %>% round(2) #works same as above command,but you need pacakge to execute this


summarize(mtcars,NewCol=mean(mpg))
unique(mtcars$cyl)

#avg of mpg when no of cyl are 4,6,8

mean(mtcars$mpg)

m1=mtcars[which(mtcars$cyl==4),] #if we want mean of car with cyl=4
mean(m1$mpg)

m1=mtcars[which(mtcars$cyl==6),] #if we want mean of car with cyl=4
mean(m1$mpg)

m1=mtcars[which(mtcars$cyl==8),] #if we want mean of car with cyl=4
mean(m1$mpg)

summarise(group_by(mtcars,cyl),NewCol=mean(mpg)) #simplifies the mean by giving it in one command

unique(mtcars$gear)

df1=summarise(group_by(mtcars,cyl,gear),NewCol=mean(mpg)) #to get mean for each combination betn gear, and cyl

#find avg mean of cylinders and gear number and looking into it
{
  a=integer(readline("Enter the no of gear:"))
  b=integer(readline("Enter the no of cyl:"))
  
}

#which combination give highest mileage
df1[which]



#==============================================================================================================

df1=summarise(group_by(df,Location),Numpacks=n())

df1[which(df$Location=='MWH-4'),2]

df1=summarise(group_by(df,Location),Numpacks=n(),TotalQuantity=sum(Quantity))
df1



#==============================================================================================================

df1=summarise(group_by(df,Location,MaterialID),NumPacks=n(),TotalQuantity=sum(Quantity)) #summarizing on the basis of location 
#on the table df, the total no of materialID in each warehouse is defined as Numpacks it mandatory to provide it
#with n() and total quantity tells quantity of material in each ware house related to that material id
df1

