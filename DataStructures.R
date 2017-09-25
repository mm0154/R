#Understanding & Managing DATA

#VECTORS: VALUES Of SAME DATA TYPE
customer <- c("Adam","Sharrif","Heer","Sukanya","Shah","Ram")
print(customer)

#FACTORS: VALUES OF ORDINAL/CATEGORICAL TYPES
customerDET <- factor(c("Adam","Sharrif","Heer","Sukanya","Shah"),levels=c("SILVER","GOLD","DIAMOND"),ordered = T)
print(customerDET[1:2])

#DATA FRAMES: VALUES IN COLLECTION WITH SAME NUM OF COLUMNS
#Finding structure of data frame
print(str(mtcars))
#Creating a new record to be added to data frame
new.mtcars <- data.frame(mpg=c(30),cyl=c(4),disp=c(121.0),  hp=c(3.5), drat=c(4.11),   wt=c(2.7),  qsec=c(18.6), vs=c(1), am=c(1), gear=c(4), carb=c(2))
#Adding and Printing the updated dataset
print(rbind(mtcars,new.mtcars))

#LIST: SAME NUMBER OF COLUMNS NOT REQUIRED, NOR POSITION
new.list <- list(mpg=mtcars$mpg,disp=mtcars$disp,wt=mtcars$wt)
print(new.list)
new.list2 <- rbind(new.list,new.list)


#MATRICES: 2D VECTOR WITH PREDEFINED PARAMETER
customerMATX <- matrix(customer,nrow=2)
#MATRICES: MULTIPLICATION
vet1 <- c(12,7,3,4.2,18,2,54,-21,8,-5)
print(crossprod(vet1,vet1))
#MATRICES :ADDTION
vet2=vet1+50
print(vet2)
#MATRICES :SUBTRACTION
vet2=vet1-50
print(vet2)
#MATRICES :DIVISION
vet2=vet1 / 2
print(vet2)

#EXPLORING STRUCTURE
str(mtcars)

#EXPLORING NUMERIC VARIABLES
summary(mtcars)

#MEASURING CENTRAL TENDENCY- MEAN, MEDIAN
print(mean(mtcars$mpg))
print(median(mtcars$wt))


#MEASURING SPREAD- QUARTILES & 5-NUMBER SUMMARY[MIN(),MAX(),RANGE(),IQR,QUANTILE]
print(range(mtcars$mpg))
print(diff(range(mtcars$mpg)))
print(IQR(mtcars$mpg))
print(quantile(mtcars$mpg,probs=c(0.01,0.99)))

#TO REMOVE ALL ENVT VAR rm(list=ls())

#VISUALIZING NUMERIC VARIABLES: BOXPLOT
boxplot(mtcars$mpg, main="BoxPlot of Car Mileage", ylab="Mileage (mi.)")

#VISUALIZING NUMERIC VARIABLES: HISTOGRAMS
hist(mtcars$mpg, main="Histogram of Car Mileage", ylab="Mileage (mi.)")

#MEASURING SPREAD- VARIANCE & STD DEVIATION
var(mtcars$mpg)
sd(mtcars$mpg)

#EXPLORING CATEGORICAL VARIABLES instance AUTO/MANUAL
table(mtcars$am)

#MEASURING CENTRAL TENDENCY- MODE 
#NO BUILD-in FUNCTION
# Create the function.
getmode <- function(v) {
  uniqv <- unique(v)
  uniqv[which.max(tabulate(match(v, uniqv)))]
}

# Calculate the mode using the user function.
result <- getmode(mtcars$mpg)
print(result)

#SCATTERPLOT
plot(x=mtcars$mpg,y=mtcars$wt, main = "Scatterplot of Mileage vs. Weight",
    xlab = "Cars Mileage (mi.)",
    ylab = "Cars Weight")

#EXAMINING TWO-WAY CROSS TABULATIONS
#library(gmodels)
#CrossTable(x = mtcars$am , y = mtcars$vs)

