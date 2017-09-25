#********************************************************#
#DATA Type 

###FACTOR ******************************#
cancerDataSet = read.csv(file.choose(),header=T,sep=",")
cancerTypes=factor(cancerDataSet$M, levels=c("B","M"))
#Labelling cancer levels found
cancerTypesLabelled=factor(cancerDataSet$M, levels=c("B","M"), labels = c("Benign","Malignant"))

###LIST ******************************#
# Create a list containing a vector, a matrix and a list.
list_data <- list(c("Jan","Feb","Mar"), matrix(c(3,9,5,1,-2,8), nrow = 2),
                  list("green",12.3))
# Give names to the elements in the list.
names(list_data) <- c("1st Quarter", "A_Matrix", "A Inner list")
# Show the list.
print(list_data)
# Access the thrid element. As it is also a list, all its elements will be printed.
print(list_data[3])
# Access the list element using the name of the element.
print(list_data$A_Matrix)

###STRING ******************************#
#1. STRING CONCATENATION ******************************#
a <- "Hello"
b <- 'How'
c <- "are you? "
print(paste(a,b,c))
print(paste(a,b,c, sep = "-"))
print(paste(a,b,c, sep = "", collapse = ""))

#2. STRING FORMATTING ******************************#
# Total number of digits displayed. Last digit rounded off.
result <- format(23.123456789, digits = 9)
print(result)
# Display numbers in scientific notation.
result <- format(c(6, 13.14521), scientific = TRUE)
print(result)
# The minimum number of digits to the right of the decimal point.
result <- format(23.47, nsmall = 5)
print(result)
# Format treats everything as a string.
result <- format(6)
print(result)
# Numbers are padded with blank in the beginning for width.
result <- format(13.7, width = 6)
print(result)
# Left justify strings.
result <- format("Hello", width = 8, justify = "l")
print(result)
# Justfy string with center.
result <- format("Hello", width = 8, justify = "c")
print(result)


#3. COUNTING CHAR ******************************#
result <- nchar("Count the number of characters")
print(result)

#4. CHANGING CASE ******************************#
# Changing to Upper case.
result <- toupper("Changing To Upper")
print(result)
# Changing to lower case.
result <- tolower("Changing To Lower")
print(result)

#5. SUBSTRING
# Extract characters from 5th to 7th position.
result <- substring("Extract", 5, 7)
print(result)

#********************************************************#