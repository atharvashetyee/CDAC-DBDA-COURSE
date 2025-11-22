df=read_excel('CDAC_Databook.xlsx',sheet='Health')
df

df1=gather(df,Year,Cases,c("2019","2020","2021")) #here gather command is used to stretch the table in vertical manner
# then (dataframe,name of coln to add1,add2,provide then add coln to add into first coln if multiple then enter in vector format)
df1


df2=spread(df1,Disease,Cases)
df2

df3=spread(df1,Country,Cases)
df3

#================================================================================================================

x1=c('Sudeep',40,50)

x1=list('Sudeep',45,67) #unnamed list
x1[[3]]

#named list


x1=list(Name='Sudeep',Age=48,Height=160)
x1 # get complete list
x1$Age #get speicific limit entry

x1$data=df #converting  a dataframe into list, a list can accomodate anything.
x1 #list


#ifelse in the pattern, in 'R'
{
sal=as.numeric(readline("Enter the salary:"))
rate=ifelse(sal<=20000,0.05,0.1) #syntax is , ifelse(condn,if true then this will execute,or else this one)
print(rate)
}

print(ifelse(as.numeric(readline("Enter Sal:"))<=20000,0.5,0.1)) #optimized salary

{
  sal=as.numeric(readline("Enter the salary:"))
  rate=ifelse(sal<=20000,0.05,ifelse(sal>=50000,0.1,0.15))
  print(rate)
}

{
  client=readline("Enter the Client Type:")
  rate=switch(client,'govt'=0.05,'public'=0.1,'private'=0.2,0.3)
  print(rate)
}



places=c('Navi Mumbai','Kharghar','Hyderabad','Chennai','Bangalore')

length(places)

nchar(places) #gives number of character in each string

grep('bad',places) # grep to find a specific pattern in vector,and returns indices where it is followed

substr(places,2,5)
#to extract from second index to fifth, you can change to any

gsub('bad','bsd',places)
#change letters in words

grep(' ',places) #find where two words 


x1='Atharva Shetye'
x1_char=strsplit(x1,'')[[1]]#output of string split is always a list, by adding the last [[1]] it converts the list
#to vector
x1_char[2]
str(x1_char)


x1=c('A','B','C')
x2=c(1,2,3)
paste(x1,x2)

paste(x1,x2,sep='')

length(paste(x1,x2,sep='-',collapse=('***')))



