

#Decision Making in R
#********************************************************#
#1. IF STATEMENT
salary <- 300000
if(is.double(salary)) 
  print("Salary is in Double")


#2. IF ELSE STATEMENT
x <- c("I","am","Alive")

if("death" %in% x) { #SubString comparison using "in"
  print("Congrats!, You are Alive")
} else {
  print("Oops!, You are going to die")
}

#3. SWTICH STATEMENT
x <- switch(
  3,
  "keeping fine",
  "ill",
  "severely ill",
  "under God's grace"
)
print(paste("You are ",x))

#********************************************************#

#Loops in R
#********************************************************#
#1. REPEAT
v <- c("Hello","loop")
cnt <- 2

repeat {
  print(v)
  cnt <- cnt+1
  
  if(cnt > 5) {
    break
  }
}
#2. WHILE
v <- c("Hello","while loop")
cnt <- 2

while (cnt < 7) {
  print(v)
  cnt = cnt + 1
}
#3. FOR
v <- LETTERS[1:4]
for ( i in v) {
  print(i)
}
#********************************************************#