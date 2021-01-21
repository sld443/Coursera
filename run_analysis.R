
# 1. Get the data

if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="./data/Dataset.zip",method="curl")

unzip(zipfile="./data/Dataset.zip",exdir="./data")

path_rf <- file.path("./data" , "UCI HAR Dataset")
files<-list.files(path_rf, recursive=TRUE)

# 2. Read data from the targeted files

dataActivityTest  <- read.table(file.path(path_rf, "test" , "Y_test.txt" ),header = FALSE)
dataActivityTrain <- read.table(file.path(path_rf, "train", "Y_train.txt"),header = FALSE)

dataSubjectTrain <- read.table(file.path(path_rf, "train", "subject_train.txt"),header = FALSE)
dataSubjectTest  <- read.table(file.path(path_rf, "test" , "subject_test.txt"),header = FALSE)

dataFeaturesTest  <- read.table(file.path(path_rf, "test" , "X_test.txt" ),header = FALSE)
dataFeaturesTrain <- read.table(file.path(path_rf, "train", "X_train.txt"),header = FALSE)

# 3. Merges the training and the test sets to create one data set

# install.packages("tidyverse")
library(tidyverse)

dataActivity <- dataActivityTrain %>% 
  bind_rows(dataActivityTest) %>% 
  rename(Activity = V1)
dataSubject <- dataSubjectTrain %>% 
  bind_rows(dataSubjectTest) %>% 
  rename(Subject = V1)

dataFeaturesNames <- read.csv(file.path(path_rf, "features.txt"),head=FALSE) %>% 
  separate(col = V1, into = c("V1", "V2"), sep = " ") %>% 
  drop_na()
dataFeatures <- dataFeaturesTrain %>% 
  bind_rows(dataFeaturesTest)

names(dataFeatures)<- dataFeaturesNames$V2

dataCombine <- cbind(dataSubject, dataActivity)
Data <- cbind(dataFeatures, dataCombine)

# 4. Extracts only the measurements on the mean and standard deviation for each measurement

subdataFeaturesNames<-dataFeaturesNames$V2[grep("mean\\(\\)|std\\(\\)", dataFeaturesNames$V2)]

subdataFeaturesNames <- dataFeaturesNames %>% 
  filter(str_detect(V2, "mean\\(\\)|std\\(\\)")) %>% 
  pull(V2)

selectedNames <- c(subdataFeaturesNames, "Subject", "Activity")

Data <- Data %>% select(selectedNames)

# 5. Uses descriptive activity names to name the activities in the data set

activityLabels <- read.table(file.path(path_rf, "activity_labels.txt"),header = FALSE)

Data <- Data %>% 
  mutate(Activity = factor(Activity, levels = activityLabels$V1, labels = activityLabels$V2))

# 6. Appropriately labels the data set with descriptive variable names

newname <- names(Data) %>% 
  str_replace_all("^t", "time") %>% 
  str_replace_all("^f", "frequency") %>% 
  str_replace_all("Acc", "Accelerometer") %>% 
  str_replace_all("Gyro", "Gyroscope") %>% 
  str_replace_all("Mag", "Magnitude") %>% 
  str_replace_all("BodyBody", "Body")

names(Data) <- newname  

# 7. Creates a second,independent tidy data set and ouput it

Data2 <- Data %>% 
  group_by(Subject, Activity) %>% 
  summarise_all(mean) %>% 
  write.table("tidydata.txt", row.names = FALSE)
