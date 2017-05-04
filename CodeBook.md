# Codebook for Getting and Cleaning Data Course Project
## Introduction
This document contains codebook for tidy data set as requested in the Getting and Cleaning Data Course Project in week 4. 
* More about the source data set please visit this web site: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
* The source data can be downloaded from here: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zipfff
## Files
* run_analysis.R - script that outputs output.txt file
* output.txt - output tidy data set as requested in step 5
* README.md - basic readme file
* CodeBook.md - this codebook
## Transformations
There is a lot of commentaries in the source code where all steps can be easily followed, however I still provide some basic description of the transformations taken to get the tidy data set.
1. Firstly the environment is set up; working folder is set and required libraries are loaded
2. features.txt file is loaded in order to assemble column names vector; this vector is then used to name columns in the data sets
3. activity_labels.txt file is load in order to label activities in the data sets
4. subject_test.txt, y_test.txt and X_test.txt files are loaded into dataframes and merged into one dataframe; the columns are named properly using the column names vector assembled above; finally activity names are joined to this dataframe
5. the same as in 4. is done for train data
6. both train dataframe and test dataframe are merged
7. dplyr functions (group_by and summarise_each) is used to create the final tidy dataset
## Variables
### Dimensional variables
* subjectId	- integer; id of the subjects
* activityId	- integer; id of the activity
* activityName	- string; name of the activities
### Factual variables
All variables are decimal variables. The names are based on the original variables from the data source and added -MEAN as a postfix because it was requested to calculate mean of those. 
* tBodyAcc-mean()-X-MEAN	
* tBodyAcc-mean()-Y-MEAN	
* tBodyAcc-mean()-Z-MEAN	
* tBodyAcc-std()-X-MEAN	
* tBodyAcc-std()-Y-MEAN	
* tBodyAcc-std()-Z-MEAN	
* tGravityAcc-mean()-X-MEAN	
* tGravityAcc-mean()-Y-MEAN	
* tGravityAcc-mean()-Z-MEAN	
* tGravityAcc-std()-X-MEAN	
* tGravityAcc-std()-Y-MEAN	
* tGravityAcc-std()-Z-MEAN	
* tBodyAccJerk-mean()-X-MEAN	
* tBodyAccJerk-mean()-Y-MEAN	
* tBodyAccJerk-mean()-Z-MEAN	
* tBodyAccJerk-std()-X-MEAN	
* tBodyAccJerk-std()-Y-MEAN	
* tBodyAccJerk-std()-Z-MEAN	
* tBodyGyro-mean()-X-MEAN	
* tBodyGyro-mean()-Y-MEAN	
* tBodyGyro-mean()-Z-MEAN	
* tBodyGyro-std()-X-MEAN	
* tBodyGyro-std()-Y-MEAN	
* tBodyGyro-std()-Z-MEAN	
* tBodyGyroJerk-mean()-X-MEAN	
* tBodyGyroJerk-mean()-Y-MEAN	
* tBodyGyroJerk-mean()-Z-MEAN	
* tBodyGyroJerk-std()-X-MEAN	
* tBodyGyroJerk-std()-Y-MEAN	
* tBodyGyroJerk-std()-Z-MEAN	
* tBodyAccMag-mean()-MEAN	
* tBodyAccMag-std()-MEAN	
* tGravityAccMag-mean()-MEAN	
* tGravityAccMag-std()-MEAN	
* tBodyAccJerkMag-mean()-MEAN	
* tBodyAccJerkMag-std()-MEAN	
* tBodyGyroMag-mean()-MEAN	
* tBodyGyroMag-std()-MEAN	
* tBodyGyroJerkMag-mean()-MEAN	
* tBodyGyroJerkMag-std()-MEAN	
* fBodyAcc-mean()-X-MEAN	
* fBodyAcc-mean()-Y-MEAN	
* fBodyAcc-mean()-Z-MEAN	
* fBodyAcc-std()-X-MEAN	
* fBodyAcc-std()-Y-MEAN	
* fBodyAcc-std()-Z-MEAN	
* fBodyAccJerk-mean()-X-MEAN	
* fBodyAccJerk-mean()-Y-MEAN	
* fBodyAccJerk-mean()-Z-MEAN	
* fBodyAccJerk-std()-X-MEAN	
* fBodyAccJerk-std()-Y-MEAN	
* fBodyAccJerk-std()-Z-MEAN	
* fBodyGyro-mean()-X-MEAN	
* fBodyGyro-mean()-Y-MEAN	
* fBodyGyro-mean()-Z-MEAN	
* fBodyGyro-std()-X-MEAN	
* fBodyGyro-std()-Y-MEAN	
* fBodyGyro-std()-Z-MEAN	
* fBodyAccMag-mean()-MEAN	
* fBodyAccMag-std()-MEAN	
* fBodyBodyAccJerkMag-mean()-MEAN	
* fBodyBodyAccJerkMag-std()-MEAN	
* fBodyBodyGyroMag-mean()-MEAN	
* fBodyBodyGyroMag-std()-MEAN	
* fBodyBodyGyroJerkMag-mean()-MEAN	
* fBodyBodyGyroJerkMag-std()-MEAN
