3+2
5*8

a=3
str(a)

#def integer-no decimal point
a1=3L
str(a1)

#diff betn warning vs error

a2='Navi Mumbai'
str (a2)   

a3="Atharva\'s laptop"
str (a3)

#boolean value
x1=TRUE
x2="FALSE"
str(x2)

#read line command
x1=readline("Enter you name:")
x1

x2=as.numeric(readline("Enter your age:")) #converting to int/numeric
x2

#list in pyhton , is vector in R
x1=scan()
x1

x1=scan(what = numeric())  #string not allowed

x2=scan(what=character())


x3=c(2,5,4,7)
str(x3)
length(x3)

#you cant create vector of nos and char 
x1=c(48,"Atharva",30)
x1

x1=c(4,8,7,2,9)
#you can extract element in vector
x1[2]

#join two vector
x2=c(1,2,3)
x3=c(x1,x2)
x3

#add single value in vector
#first method append command
x1=append(x1,10)

#second method
x1[7]=3.7

#third method
x1[length(x1)+1]=7.8

x1
x2

#to add element at specific place
x1=append(x1,6.8,5) #syntax is x1=append(vector_name,element,position)

#add multiple elements/add another vector in a vector
#in R there is no nested vector
x1=append(x1,x2,3)  #add from vector x2 in x1 at 3rd postn

#add element at first index
append(x1,4,0)

x1=c(3,4,5,6,7)
x1[3]

x1[3]=8 #change number

#to remove element give its index with negative sign
k1[-4]

Assignmnet
k1=c(4,8,7,6,9)
sum(k1) #get sum of all elements
prod(k1) #get products 
min(k1) #get min
max(k1) #get max

#return the total
cumsum(k1)
cumsum(k1)[4] #till specific index

cummin(k1) #return min through out vector

cummax(k1) #return max throughout vector

log(k1) #values for natural log for each element default it takes natural log

exp(log(k1)) #turns log values to normal element

h1=log(k1,5) #turns to take log with base 5