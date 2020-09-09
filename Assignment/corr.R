corr <- function(directory, threshold = 0){

  cor_results <- numeric(0)
  # before operating for loops, make a place first.
  
  complete_cases <- complete(directory)
  # the function complete above has already defined before.
  complete_cases <- complete_cases[complete_cases$nobs>=threshold, ]
  # in this code, complete_cases is not a function but an object.
  # the data consists of the number of complete data which is greater than threshold mentioned above.

  if(nrow(complete_cases)>0){
    for(monitor in complete_cases$id){
      path <- paste(getwd(), "/", directory, "/", sprintf("%03d", monitor), ".csv", sep = "")

      monitor_data <- read.csv(path)

      interested_data <- monitor_data[(!is.na(monitor_data$sulfate)), ]
      interested_data <- interested_data[(!is.na(interested_data$nitrate)), ]
      # the above codes are same as complete function.
      sulfate_data <- interested_data["sulfate"]
      nitrate_data <- interested_data["nitrate"]
      # assign the value named "sulfate" and "nitrate" to each object.
      cor_results <- c(cor_results, cor(sulfate_data, nitrate_data))
      # calculate "Pearson Correlation Coefficient" between the two valuables.
    }
  }
  cor_results
}