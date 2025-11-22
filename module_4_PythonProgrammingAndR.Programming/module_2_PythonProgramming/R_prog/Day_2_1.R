x1=c(3,4,7,2)
x2=c(8,3,6,5)

length(x1)

#addding scalar value to vector
x1+5
#in this scenario each value will be added by 5, this applies for every operation
x1^2


#adding vector to vector
x1+x2
#first element will be added to first element in other vector

x3=c(5,10)
x1+x3 
#RECYCLING OF VECTOR(happens when vector are not of same length)
#recycling of vector ,the shorter length vector needs to be multiple of longer vector.
#This applies to all operations follwed in R.

x4=c(2,3,4)
x1+x4
#PARTIAL RECYCLING-When shorter not in multiple of longer vector, it will throw warning
#and partial recycling will happen.

x1-x4
x4-x1

#Multiple element accessing
x1=c(10,20,30,40,50,60,70,80,90)
x1[c(3,6,7,10)]

#Change multiple values at a single point/command
x1[c(3,4,5)]=c(35,45,55)
x1

#Partial Recycling for changing multiple vectors
x1[c(1,2,7)]=c(25,65)
x1

x1[c(4,7)]
x1=x1[-c(4,7)] #Deleting multiple values in a single command
x1

#taking vector from specific range
x1=11:80
x1
#==============================================================================================================
#sequence commands
seq(10,30,2)

seq(15,40,3)
#when sequence is out of range it take the number which falls under patterns

seq(40,6,-2)
#takes the negative sequence that is in reverse order and stops at the second element or before it ,depends on condn.

seq(7,70,length.out=10)
#when you want specific length ,and have starting and ending value we use this command.

#==============================================================================================================
#REP command
rep(c(1,5,3,8),3)
#the op is repeated 3 times.
rep(c(1,5,3,8),times=3)

rep(c(1,5,3,8),each=3)

rep(c(1,5,3,8),times=c(3,2,4,2))
#partial recycling wont work in "rep command"

#==============================================================================================================
#AND,OR
a1=T
a2=F
a3=T
a4=F

a1 & a2 #and
a1 | a3 #or
!a1 #not

#==============================================================================================================
#which command
x1=c(9,4,2,3,6,7,1)
# what are the indices where values are >=4
t1=which(x1>=4)

# what are values which are >=4
x1[t1]

#how many values are >=4
length(t1)
length(x1[t1])

#input to the which command is a condn or condns that need to be checked
#output of the which command are the indices where the cond or conds are found to be true.


##==============================================================================================================
#1000/hour for classes on weekdays and 2000/hour for classes on weekends
#starts on monday and continue for consequetive 10 days
#6,4,7,4,8,6,5,9,5,8==> no. of hours on each day
#what is final payment?
#how many days did i earn more than 7500/day

#to insert data about days and hourly wage
total_hours=c(6,4,7,4,8,6,5,9,5,8)
pay_hour=rep(c(1000,2000),times=c(5,2))

#to get daily pay for each day
daily_pay=total_hours*pay
daily_pay

#total payment
total_payment=sum(daily_pay)
total_payment

#find days sal greater than 7500
more_than_given=which(daily_pay>7500)
more_than_given
daily_pay[more_than_given]
