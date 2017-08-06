?list.files
?read.csv
?rbind
?mean
?grep



pollutantmean <- function(directory, pollutant, id = 1:332){
      ## 'directory' is a character vector of length 1 indicating 
      ## the location of the csv files
      
      ## 'pollutant' is a character vector of lenght 1 indicating
      ## the name of the pollutant for which we will calculate the 
      ## mean; either "sulfiate" or "nitrate"
      #set working directory

      #create a list of all files from a directory
      FileD <-list.files(directory, pattern = "*.csv", full.names = TRUE)
      #create a data frame to contain all data
      pol <- data.frame()
      #read data
      for(i in id){
            #read thru the list
            pol <-rbind(pol, read.csv(FileD[i], header = T))  #meaning a loop of [original data frame + a new data frame]
            #after extracting the data from all the files
            #produce an object that equals the desired mean
            pol_mean <-mean(pol[[pollutant]], na.rm = TRUE)
      }
      #return the object
      pol_mean
}

pollutantmean("specdata","sulfate",1:10)
pollutantmean("specdata","nitrate",70:72)
pollutantmean("specdata", "sulfate", 34)
pollutantmean("specdata", "nitrate")
