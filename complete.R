#Write a function that reads a directory full of files and 
#reports the number of completely observed cases in each 
#data file. The function should return a data frame where 
#the first column is the name of the file and the second 
#column is the number of complete cases. A prototype of 
#this function follows

complete <-function(directory, id=1:332){
      #set where to find the files
      files <- list.files(directory, pattern = "*.csv", full.names = TRUE)
      #merge only certain data into a data frame
      #first create an empty data frame to store the data
      data <- data.frame()
      #loop through the files
      for(i in id){
            #read files
            temp_file <-read.csv(files[i], header = T)
            #subset rows that does not have an NA
            temp_file <- na.omit(temp_file)
            #count the number of rows left
            countnrow <- nrow(temp_file)
            #create a vector with id and count
            count_v <-c(i, countnrow)
            data <-rbind(data, count_v)
      }
      colnames(data)=c("id","nobs")
      data                  
}

complete("specdata", 1)
complete("specdata", c(2, 4, 8, 10, 12))

cc <- complete("specdata", c(6, 10, 20, 34, 100, 200, 310))
print(cc$nobs)

cc <- complete("specdata", 54)
print(cc$nobs)

set.seed(42)
cc <- complete("specdata", 332:1)
use <- sample(332, 10)
print(cc[use, "nobs"])
