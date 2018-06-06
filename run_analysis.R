## Getting and Cleaning Data Course Project
## Author(s): Durgesh S
## Date: 05/06/2018

## Purpose: create a script that does following:
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive variable names.
## 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

library(dplyr)

## download zip set into default working directory
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url, "UCIHARDataset.zip")

## unzip data files
unzip("UCIHARDataset.zip")

## load activity labels from data file
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt", 
                              sep = " ", 
                              header = FALSE, 
                              col.names = c("class_label", "activity_name"))

## load features from data file
features <- read.table("./UCI HAR Dataset/features.txt", 
                       sep = " ", 
                       col.names = c("sl_num", "feature_name"))

## filter only mean and standard deviation features
features_required <- features %>%   ## piping from dplyr library
    filter(grepl("(mean|std)\\(\\)", feature_name))

sl_num_required <- select(features_required, sl_num)
feature_name_required <- gsub("[()]", "", features_required$feature_name) ## remove parenthesis from feature names

## load training data sets
train <- read.table("./UCI HAR Dataset/train/X_train.txt")[sl_num_required[,1]]
trainActivities <- read.table("./UCI HAR Dataset/train/Y_train.txt")
trainSubjects <- read.table("./UCI HAR Dataset/train/subject_train.txt")
train_data <- cbind(trainSubjects, trainActivities, train)

## load test data sets
test <- read.table("./UCI HAR Dataset/test/X_test.txt")[sl_num_required[,1]]
testActivities <- read.table("./UCI HAR Dataset/test/Y_test.txt")
testSubjects <- read.table("./UCI HAR Dataset/test/subject_test.txt")
test_data <- cbind(testSubjects, testActivities, test)

## merge training and test data and update column labels
complete_data <- rbind(train_data, test_data)
colnames(complete_data) <- c("subject", "activity", feature_name_required)

## update data with descriptive activity names
complete_data$activity <- factor(complete_data$activity, levels = activity_labels[,1], labels = activity_labels[,2])

## create tidy data set with the average of each variable for each activity and each subject
tidy_average <- complete_data %>% ## dplyr library functions
    group_by(subject, activity) %>%
    summarise_all(mean)

## write the data into csv file
write.table(tidy_average, "data_set_with_averages.txt", row.names = FALSE)

## End of code