---
title: "README"
output:
  html_document: default
  word_document: default
---

Getting and Cleaning Data - Course Project
==========================================

* This is the course project for the Getting and Cleaning Data Coursera course.
* The included R script, `run_analysis.R`, conducts the following:
* Try to use tidyverse(ex. dplyr) to manipulate data.

1. Get the data from web because there might be some revisement for this course project.
2. Read data from the targeted files.
3. Merges the training and the test sets to create one data set and finally, the whole data set.
4. Extracts only the measurements on the mean and standard deviation for each measurement.
   Also, modify column names to descriptive. (-mean to Mean, -std to Std, and remove symbols like -, (, ))
5. Group by Subject and Activity to change the data into the mean statistics.
6. Creates a second, independent tidy data set and save it in the file `tidy_dataset.txt`.