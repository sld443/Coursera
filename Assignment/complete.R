complete <- function(directory, id = 1:332){
  results <- data.frame(id=numeric(0), nobs=numeric(0))
  # before operating for loops, make a place first.
  
  for(monitor in id){
    path <- paste(getwd(), "/", directory, "/", sprintf("%03d", monitor), ".csv", sep = "")
    # it can help define the path of the specdata folder.
    # sprintf() converts the parameters to string with a special rule.
    # %03d(Format Symbol) means the signed decimal integer with 3 digits.
    monitor_data <- read.csv(path)
    # according to the path defined above, read files and assign to a variable, monitor_data.
    interested_data <- monitor_data[(!is.na(monitor_data$sulfate)), ]
    interested_data <- interested_data[(!is.na(interested_data$nitrate)), ]
    # in each step, the NA value of the two variable would be treated.
    # as a result, interested_data consists of the valuable which doesn't include any NA values.
    nobs <- nrow(interested_data)
    # calculate the length of ROW.
    results <- rbind(results, data.frame(id=monitor, nobs=nobs))
    # with these codes, We can know what the number of complete cases is.
  }
  results
}