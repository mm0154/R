# Create vector objects.
city <- c("Tampa","Seattle","Hartford","Denver")
state <- c("FL","WA","CT","CO")
zipcode <- c(33602,98104,06161,80294)

# Combine above three vectors into one data frame.
addresses <- cbind(city,state,zipcode)

# Print a header.
cat("# # # # The First data frame\n") 

# Print the data frame.
print(addresses)

# Create another data frame with similar columns
new.address <- data.frame(
  city = c("Lowry","Charlotte"),
  state = c("CO","FL"),
  zipcode = c("80230","33949"),
  stringsAsFactors = FALSE
)

# Print a header.
cat("# # # The Second data frame\n") 

# Print the data frame.
print(new.address)

# Combine rows form both the data frames.
all.addresses <- rbind(addresses,new.address)
# Print a header.
cat("# # # The combined data frame\n") 

# Print the result.
print(all.addresses)
library(MASS) #data sets about Diabetes in Pima Indian Women
merged.Pima <- merge(x = Pima.te, y = Pima.tr, 
                     by.x = c("bp", "bmi"),#blood pressure("bp") and body mass index("bmi").
                     by.y = c("bp", "bmi")
)
print(merged.Pima)
nrow(merged.Pima)