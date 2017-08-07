#Write a function that takes a directory of data files and 
#a threshold for complete cases and calculates the correlation 
#between sulfate and nitrate for monitor locations where the 
#number of completely observed cases (on all variables) is 
#greater than the threshold. The function should return a 
#vector of correlations for the monitors that meet the 
#threshold requirement. If no monitors meet the threshold 
#requirement, then the function should return a numeric 
#vector of length 0. A prototype of this function follows


?cor
?complete.cases
getwd()
?read.csv


corr <- function(directory, threshold=0){
      #set where to find files
      fileD <- list.files(directory, pattern = "*.csv", full.names = TRUE)
      #set an empty VECTOR to conain all the data
      data <- vector(mode ="numeric", length = 0)
      #extract data
      for(i in 1:length(fileD)) {#loop from the first file to the last
            #read files
            temp_file <- read.csv(fileD[i], header = T)
            #extract complete cases (none of the variable has NA value)
            temp_file <-temp_file[complete.cases(temp_file), ]
            #set the if statement: if the number of cases is bigger than the threshold, calculate the means
            #count the number of complete cases
            sum_c <- nrow(temp_file)
            if(sum_c > threshold){
                  data<-c(data, cor(temp_file$sulfate, temp_file$nitrate))
            }
      }
      data
}

fileD <- list.files(pattern = "*.csv", full.names = TRUE)
temp_file <-read.csv(fileD[1], header = T)


cr<-corr("specdata", 150)
head(cr)


cr <- corr("specdata")                
cr <- sort(cr)                
set.seed(868)                
out <- round(cr[sample(length(cr), 5)], 4)
print(out)

cr <- corr("specdata", 129)                
cr <- sort(cr)                
n <- length(cr)                
set.seed(197)                
out <- c(n, round(cr[sample(n, 5)], 4))
print(out)

cr <- corr("specdata", 2000)                
n <- length(cr)                
cr <- corr("specdata", 1000)                
cr <- sort(cr)
print(c(n, round(cr, 4)))