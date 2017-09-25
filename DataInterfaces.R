#DATA Interfaces in R

#Working with directories
# Get and print current working directory.
print(getwd())
# Set current working directory.
setwd("/sap/com")
# Get and print current working directory.
print(getwd())

#Working with Packages
# Verify the package is installed.
any(grepl("xlsx",installed.packages()))
# Load the library into R workspace.
library("xlsx")

#Notes on READ & WRITE
#Reading files:   read.csv, read.xlsx, readBin, fromJSON, xmlParse etc
#Writing files:   write.csv, write.xlsx, writeBin etc. 
#data frames:     read.table, write.table
#Creating Path:   write.filename
#Prop:            Express Table Entries as Fraction of Marginal Table
#                 prop.table, prop.test


#1. CSV
#1A.  READING a csv file
data <- read.csv(file.choose(),sep=",",header = T)
print(data)
#1B.  Getting file INFORMATION
print(is.data.frame(data))
print(ncol(data))
print(nrow(data))
#1C. DATA Manipulation importing from CSV, XLSX etc
# Get the person detail having max salary.
retval <- subset(data, salary == max(salary))
print(retval)
#Get person detail working for IT dept.
retval <- subset( data, dept == "IT")
print(retval)
#1D. WRITE to a csv file 
retval <- subset(data, as.Date(start_date) > as.Date("2014-01-01"))
# Write filtered data into a new file.
write.csv(retval,"output.csv") #row.names = FALSE to drop column X 
newdata <- read.csv("output.csv")
print(newdata)

#2. XLSX
# Read the first worksheet in the file input.xlsx.
library("xlsx")
xlsData <- read.xlsx(file.choose(), sheetIndex = 1)
print(xlsData)
#Write to the XLSX file
write.xlsx(retval,"xlsxOutput.csv",sheetName = "Sheet1",col.names = TRUE,row.names = T,append=T,showNA = T)

#3.BINARY Files
#WriteBin() and readBin() to create and read binary files.
#Syntax
#writeBin(object, con) con is connection object "wb" and "rb"
#readBin(con, what, n )

##Writing to the Binary File
# Read the "mtcars" data frame as a csv file and only 3 columns to the new file
write.table(mtcars, file = "mtcars.csv",row.names = FALSE, na = "", 
            col.names = TRUE, sep = ",")
# Store 5 records from the csv file as a new data frame.
new.mtcars <- read.table("mtcars.csv",sep = ",",header = TRUE,nrows = 5)
# Create a connection object to write the binary file using mode "wb".
write.filename = file("C:/Users/1331620/Documents/binmtcars.dat", "wb")
# Write the column names of the data frame to the connection object.
writeBin(colnames(new.mtcars), write.filename)
# Write the records in each of the column to the file.
writeBin(c(new.mtcars$cyl,new.mtcars$am,new.mtcars$gear), write.filename)
# Close the file for writing so that it can be read by other program.
close(write.filename)

##Reading Binary File
# Create a connection object to read the file in binary mode using "rb".
read.filename <- file("C:/Users/1331620/Documents/binmtcars.dat", "rb")
# First read the column names. n = 3 as we have 3 columns.
column.names <- readBin(read.filename, character(),  n = 3)
# Next read the column values. n = 18 as we have 3 column names and 15 values.
read.filename <- file("C:/Users/1331620/Documents/binmtcars.dat", "rb")
bindata <- readBin(read.filename, integer(),  n = 18)
# Print the data.
print(bindata)
# Read the values from 4th byte to 8th byte which represents "cyl".
cyldata = bindata[4:8]
print(cyldata)
# Read the values form 9th byte to 13th byte which represents "am".
amdata = bindata[9:13]
print(amdata)
# Read the values form 9th byte to 13th byte which represents "gear".
geardata = bindata[14:18]
print(geardata)
# Combine all the read values to a dat frame.
finaldata = cbind(cyldata, amdata, geardata)
colnames(finaldata) = column.names
print(finaldata)

##3. XML
install.packages("XML")
##READ XML FILE DATA
# Load the package required to read XML files.
library("XML")
# Also load the other required package.
library("methods")
# Give the input file name to the function.
result <- xmlParse(file.choose())
# Print the result.
print(result)  

###Get number of nodes present in the XML file
# Load the packages required to read XML files.
library("XML")
library("methods")
# Give the input file name to the function.
result <- xmlParse(file.choose())
# Exract the root node form the xml file.
rootnode <- xmlRoot(result)
# Find number of nodes in the root.
rootsize <- xmlSize(rootnode)
# Print the result.
print(rootsize)

##DETAILS OF NODE
# Print the result.
print(rootnode[1])
# Get the first element of the first node.
print(rootnode[[1]][[1]])
# Get the fifth element of the first node.
print(rootnode[[1]][[5]])
# Get the second element of the third node.
print(rootnode[[3]][[2]])

##XML TO DATA FRAME
# Convert the input xml file to a data frame.
xmldataframe <- xmlToDataFrame("input.xml")
print(xmldataframe)


##4. JSON
install.packages("rjson")
##READ JSON File
# Load the package required to read JSON files.
library("rjson")
# Give the input file name to the function.
result <- fromJSON(file.choose())
# Print the result.
print(result)

###Convert JSON to Data Frame
# Convert JSON file to a data frame.
json_data_frame <- as.data.frame(result)
print(json_data_frame)

###5. Web DATA
install.packages("RCurl")
install.packages("XML")
install.packages("stringr")
install.packages("plyr")

# Read the URL.
url <- "http://www.geos.ed.ac.uk/~weather/jcmb_ws/"

# Gather the html links present in the webpage.
links <- getHTMLLinks(url)

# Identify only the links which point to the JCMB 2015 files. 
filenames <- links[str_detect(links, "JCMB_2015")]

# Store the file names as a list.
filenames_list <- as.list(filenames)

# Create a function to download the files by passing the URL and filename list.
downloadcsv <- function (mainurl,filename) {
  filedetails <- str_c(mainurl,filename)
  download.file(filedetails,filename)
}

# Now apply the l_ply function and save the files into the current R working directory.
l_ply(filenames,downloadcsv,mainurl = "http://www.geos.ed.ac.uk/~weather/jcmb_ws/")

###5. MySQL
install.packages("RMySQL")

# Create a connection Object to MySQL database.
# We will connect to the sampel database named "sakila" that comes with MySql installation.
mysqlconnection = dbConnect(MySQL(), user = 'root', password = '', dbname = 'sakila',
                            host = 'localhost')
# LIST the tables available in this database.
dbListTables(mysqlconnection)

# QUERY the "actor" tables to get all the rows.
result = dbSendQuery(mysqlconnection, "select * from actor")

##STORE the result in a R data frame object. n = 5 is used to fetch first 5 rows.
data.frame = fetch(result, n = 5)
print(data.fame)
result = dbSendQuery(mysqlconnection, "select * from actor where last_name = 'TORN'")

# Fetch all the records(with n = -1) and store it as a data frame.
data.frame = fetch(result, n = -1)
print(data)

#A. CREATING DB ENTRy
# Create the connection object to the database where we want to create the table.
mysqlconnection = dbConnect(MySQL(), user = 'root', password = '', dbname = 'sakila', 
                            host = 'localhost')
# Use the R data frame "mtcars" to create the table in MySql.
# All the rows of mtcars are taken inot MySql.
dbWriteTable(mysqlconnection, "mtcars", mtcars[, ], overwrite = TRUE)

#B. INSERTING DB RECORD
dbSendQuery(mysqlconnection,
            "insert into mtcars(row_names, mpg, cyl, disp, hp, drat, wt, qsec, vs, am, gear, carb)
   values('New Mazda RX4 Wag', 21, 6, 168.5, 110, 3.9, 2.875, 17.02, 0, 1, 4, 4)"
)

#C. UPDATING DB RECORD
dbSendQuery(mysqlconnection, "update mtcars set disp = 168.5 where hp = 110")

#D. DROPPING DB RECORD
dbSendQuery(mysqlconnection, 'drop table if exists mtcars')