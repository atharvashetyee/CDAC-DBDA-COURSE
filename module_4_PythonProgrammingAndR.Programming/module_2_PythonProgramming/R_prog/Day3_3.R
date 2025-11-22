library(readxl)
getwd()
df=read_excel('CDAC_DataBook.xlsx',sheet = 'EmpInfo')
df

#Data Cleaning-dealing with missing values & duplicates
df$Deptt

is.na(df$Deptt) # to get boolean output
which(is.na(df$Deptt)) # to get the specific row where value is NA

#split into 2 df where one has NA dept and other one where there is no NA


t1=which(is.na(df$Deptt))
t1
df1=df[t1,]
df1


t2=which(! is.na(df$Deptt))
t2
df2=df[t2,]
df2

#row indices both empid and dept value are missing
t1=which(is.na(df$EmpID) & is.na(df$Deptt))
t1

which(complete.cases(df)) # no missing values in this places/rows
which(!complete.cases(df)) #missing values in this places/rows in any coln
##==============================================================================================================
x1=c(4,6,3,2,7,6,8,5)
x2=c(1,4,7)

#tells at which indices the values repeated in x1 present in x2
t1=which(x1 %in% x2)
x1[t1]

##==============================================================================================================
#Duplicate
#the inbulit duplicate command only report the second or later on rows not the first where it occured.

t1=which(duplicated(df$Passport)) 
t1

df3=df[t1,]  
df3

df$Passport[t1]
t2=unique(df$Passport[t1])  #values are repeated are given without repeat

which(df$Passport %in% t2) #includes all rows which are duplicated including first occurances 
##==============================================================================================================

head(airquality)

#rows ozone is na or solar.r is na
length(which(is.na(airquality$Ozone) | is.na(airquality$Solar.R)))

#if temp is not betn 65-80 dont select those rows
t1=which(airquality$Temp>=65 & airquality$Temp<=80)
length(t1)








