means = c()
# before operating for loops, make a place first.

pollutantmean <- function(directory, pollutant, id = 1:332) {

  for(monitor in id){
    path <- paste(getwd(), "/", directory, "/", sprintf("%03d", monitor), ".csv", sep = "")
    # it can help define the path of the specdata folder.
    # sprintf() converts the parameters to string with a special rule.
    # %03d(Format Symbol) means the signed decimal integer with 3 digits.
    monitor_data <- read.csv(path)
    # according to the path defined above, read files and assign to a variable, monitor_data.
    interested_data <- monitor_data[pollutant]
    # specify variable to answer the question. such as, "sulfate" or "nitrate".
    means <- c(means, interested_data[!is.na(interested_data)])
    # for each loop, the interested data is attached to the vector named means.
    # it means that each element of that vector is the result of each loop.
  }
  
  mean(means)
  # when the loop finishes, use mean function to calculate the mean of the vector.
  # There's no need to insert "na.rm = TRUE" parameter in the function
  # because of the code "interested_data[!is.na(interested_data)]" in the loop.
}
