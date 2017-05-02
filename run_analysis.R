# This is a Getting and Cleaning Data Course Project
# Step 0: Environment set up
# ============================
setwd("/Users/petrpodrouzek/Documents/coursera/UCI HAR Dataset/")

# Step 1: Read reusable data
# ============================
# Reading column names from features.txt
columnNamesData = read.table("features.txt", stringsAsFactors = FALSE, header = FALSE)
nameVector <- c("featureId", "featureName")
colnames(columnNamesData) <- nameVector
# Save the data into a vector for a futher usage
featureNames <- as.vector(columnNamesData[,'featureName'])
# Reading activity labels
activityData = read.table("activity_labels.txt", stringsAsFactors = FALSE, header = FALSE)
nameVector <- c("activityId", "activityName")
colnames(activityData) <- nameVector

# Step 2a: Reading test data set
# ==============================
testData = read.table("test/X_test.txt", stringsAsFactors = FALSE, header = FALSE)
testActivitiesData = read.table("test/y_test.txt", stringsAsFactors = FALSE, header = FALSE)
colnames(testData) <- featureNames
# Add a column that says whether this is test or train data, might be useful going forward
testData$source = rep("test", nrow(testData))
# Add activityId
testData$activityId = testActivitiesData[,"V1"]  
# Merge the main data set with data set containing activity names
testData <- merge(testData, activityData, by="activityId", all = TRUE)

# Step 2b: Reading train data set
# ===============================
trainData = read.table("train/X_train.txt", stringsAsFactors = FALSE, header = FALSE)
trainActivitiesData = read.table("train/y_train.txt", stringsAsFactors = FALSE, header = FALSE)
colnames(trainData) <- featureNames
# Add a column that says whether this is test or train data, might be useful going forward
trainData$source = rep("train", nrow(trainData))
# Add activityId
trainData$activityId = trainActivitiesData[,"V1"]  
# Merge the main data set with data set containing activity names
trainData <- merge(trainData, activityData, by="activityId", all = TRUE)

# Merge test and train data set
# =============================

