# Getting and Cleaning Data Course Project

Description: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
Data Source: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The attached R script (run_analysis.R) performs the following to clean up the data:

Merges the training and test sets to create one data set, namely train/X_train.txt with test/X_test.txt, the result of which is a 10299x561 data frame, as in the original description ("Number of Instances: 10299" and "Number of Attributes: 561"), train/subject_train.txt with test/subject_test.txt, the result of which is a 10299x1 data frame with subject IDs, and train/y_train.txt with test/y_test.txt, the result of which is also a 10299x1 data frame with activity IDs.

Reads features.txt and extracts only the measurements on the mean and standard deviation for each measurement. The result is a 10299x66 data frame, because only 66 out of 561 attributes are measurements on the mean and standard deviation. All measurements appear to be floating point numbers in the range (-1, 1).

Reads activity_labels.txt and applies descriptive activity names to name the activities in the data set:
WALKING
WALKING_UPSTAIRS
WALKING_DOWNSTAIRS
SITTING
STANDING
LAYING

The script also appropriately labels the data set with descriptive names: all feature names (attributes) and activity names are converted to lower case, underscores and brackets () are removed. Then it merges the 10299x66 data frame containing features with 10299x1 data frames containing activity labels and subject IDs. The result is saved as merged_clean_data.txt, a 10299x68 data frame such that the first column contains subject IDs, the second column activity names, and the last 66 columns are measurements. Subject IDs are integers between 1 and 30 inclusive. The names of the attributes are similar to the following:

Below are the variables used in code and also used as column names.
## Codebook summary table			
Variable				Class	no. unique values
subject					integer	30
activity				factor	6
tBodyAcc-mean-X			numeric	180
tBodyAcc-mean-Y			numeric	180
tBodyAcc-mean-Z			numeric	180
tBodyAcc-std-X			numeric	180
tBodyAcc-std-Y			numeric	180
tBodyAcc-std-Z			numeric	180
tGravityAcc-mean-X		numeric	180
tGravityAcc-mean-Y		numeric	180
tGravityAcc-mean-Z		numeric	180
tGravityAcc-std-X		numeric	180
tGravityAcc-std-Y		numeric	180
tGravityAcc-std-Z		numeric	180
tBodyAccJerk-mean-X		numeric	180
tBodyAccJerk-mean-Y		numeric	180
tBodyAccJerk-mean-Z		numeric	180
tBodyAccJerk-std-X		numeric	180
tBodyAccJerk-std-Y		numeric	180
tBodyAccJerk-std-Z		numeric	180
tBodyGyro-mean-X		numeric	180
tBodyGyro-mean-Y		numeric	180
tBodyGyro-mean-Z		numeric	180
tBodyGyro-std-X			numeric	180
tBodyGyro-std-Y			numeric	180
tBodyGyro-std-Z			numeric	180
tBodyGyroJerk-mean-X	numeric	180
tBodyGyroJerk-mean-Y	numeric	180
tBodyGyroJerk-mean-Z	numeric	180
tBodyGyroJerk-std-X		numeric	180
tBodyGyroJerk-std-Y		numeric	180
tBodyGyroJerk-std-Z		numeric	180
tBodyAccMag-mean		numeric	180
tBodyAccMag-std			numeric	180
tGravityAccMag-mean		numeric	180
tGravityAccMag-std		numeric	180
tBodyAccJerkMag-mean	numeric	180
tBodyAccJerkMag-std		numeric	180
tBodyGyroMag-mean		numeric	180
tBodyGyroMag-std		numeric	180
tBodyGyroJerkMag-mean		numeric	180
tBodyGyroJerkMag-std		numeric	180
fBodyAcc-mean-X			numeric	180
fBodyAcc-mean-Y			numeric	180
fBodyAcc-mean-Z			numeric	180
fBodyAcc-std-X			numeric	180
fBodyAcc-std-Y			numeric	180
fBodyAcc-std-Z			numeric	180
fBodyAccJerk-mean-X		numeric	180
fBodyAccJerk-mean-Y		numeric	180
fBodyAccJerk-mean-Z		numeric	180
fBodyAccJerk-std-X		numeric	180
fBodyAccJerk-std-Y		numeric	180
fBodyAccJerk-std-Z		numeric	180
fBodyGyro-mean-X		numeric	180
fBodyGyro-mean-Y		numeric	180
fBodyGyro-mean-Z		numeric	180
fBodyGyro-std-X			numeric	180
fBodyGyro-std-Y			numeric	180
fBodyGyro-std-Z			numeric	180
fBodyAccMag-mean		numeric	180
fBodyAccMag-std			numeric	180
fBodyBodyAccJerkMag-mean	numeric	180
fBodyBodyAccJerkMag-std		numeric	180
fBodyBodyGyroMag-mean		numeric	180
fBodyBodyGyroMag-std		numeric	180
fBodyBodyGyroJerkMag-mean	numeric	180
fBodyBodyGyroJerkMag-std	numeric	180

Finally, the script creates a 2nd, independent tidy data set with the average of each measurement for each activity and each subject.