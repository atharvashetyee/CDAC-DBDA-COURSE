vec=c(10,20,30,40)

remove=function(vec,val){
  t1=which(vec==val)
  vec=vec[-t1[1]]
  print(vec)
}

##==============================================================================================================

#user enter salary, create function caltax op should be 10 per

calTax=function(a){
  newSal=0.1*a
  print(newSal)
}

#sal below 20000 dont need to pay tax

calTax=function(sal){
  tax=0
  if (sal>20000){
    tax=0.1*sal
  } 
  else{
    tax=0.05*sal
  }
  print(tax)
}



calTax=function(sal){
  if (sal<=20000){
    tax=0.5*sal
  } 
  else{
    if(sal<=50000){
      tax=0.1*sal
    }
    else{
      tax=0.15*sal
    }
  }
  print(tax)
}

##==============================================================================================================
#for loop- we know the number of iteration known even before the loop starts
#while- loop runs until the condition provided is matched or nullified 


vect1=c(4,3,5,6,7,2)
for (ctr in vect1){
  print(ctr**2)
}

{
num=as.numeric(readline("Enter the number of elements:"))
vect=c()
for(ctr in 1:num){
  n2=as.numeric(readline("Enter the number:"))
  vect=append(vect,n2)
}
print(vect)
}
##==============================================================================================================
#  BREAK STATEMENT
# ---------------
# Break statement terminates the inner loop

for(c1 in 2:4){
  #break
  for(c2 in 2:5){
    if(c2==4){
      break
    }
    print(c1*c2)
  }
}


#  WHILE LOOP
# -----------
# loops until the condition is true

{
  vect1=c()
  num=01
  while(num != 0){
    num = as.numeric(readline("enter karo"))
    if (num == 0){
      print(vect1)
    }
    vect1 = append(vect1,num)
  }
}


vect1 = c(4,5,1,9,3,0,2)
for (i in vect1){
  print(i**2)
}


vect1 = c(4,5,1,9,3,0,2)

for (i in vect1){
  if(i !=0 & i != 1){
    print(i*i)
  }
}

##==============================================================================================================

df = data.frame(students=c("A","B","C"),marks_java=c(50,30,40),marks_sql=c(43,40,56))
df

marks_sql=c(45,42,40)
df=cbind(df,marks_sql)
df
df$final_marks = df$marks_java + df$marks_sql




#working on mtcars
head(mtcars)
tail(mtcars)
nrow(mtcars) #gives rows
ncol(mtcars) 

mtcars$Ratio = mtcars$mpg / mtcars$wt
mtcars

rownames(mtcars)
rownames(mtcars)[5]

t1 =max(mtcars$Ratio)
t2 =which(mtcars$Ratio == t1)
t1
t2
rownames(mtcars)[t2]



rownames(mtcars)[which(max(mtcars$Ratio)==mtcars$Ratio)]
length(which(mtcars$Ratio > 15))



categ =c()

for (i in mtcars$Ratio){
  if(i <= 12){
    categ=append(categ,"A")
  }else{
    if(i >12 & i<= 15){
      categ=append(categ,"B")
    }else{
      categ=append(categ,"C")
    }
  }
}


categ


mtcars$category = cbind(mtcars$category,categ)
mtcars$catgory

##==============================================================================================================

#get input from user, first let him add value and then after each i/p ask Y or Yes so now he can enter into it if N exit
#the loop and print the o/p

new=c()
con='yes'
while(con==yes){
  num=as.numeric(readline("Enter the number"))
  new=append(new,num)
  con=readline("Enter whether you want to continue by either n/no or y/yes")
  if(con=="no" | con=="n"){
    break
  }
  print(new)
}

new=c()
con='yes'
while(con==yes){
  num=as.numeric(readline("Enter the number"))
  
  con=readline("Enter whether you want to continue by either n/no or y/yes")
  if(con=="yes"|con=="y"){
    new=append(new,num)
    break
  }
  else{
    
  }
}


