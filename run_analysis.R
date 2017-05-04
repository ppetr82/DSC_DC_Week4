# This is a Getting and Cleaning Data Course Project
# ==================================================
# The script runs in 5 steps 
# Step 0: Environemnt is set up
# Step 1: Reading reusable data like feature names and assembling the column names vector
# Step 2a: test data is loaded 
# Step 2b: train data is loaded
# Step 3: both data sets are merged, ordered, the tidy data set is created and printed to output.txt

# Step 0: Environment set up
# ============================
# Please to execute properly set up path to the working directory
# In the working directory the Samsung data needs to be loaded
# The output file is also then returned to the working directory
setwd("/Users/petrpodrouzek/Documents/coursera/DSC_DC_Week4/")
library(dplyr)

# Step 1: Read reusable data
# ============================
# Reading column names from features.txt
columnNamesData = read.table("UCI HAR Dataset/features.txt", stringsAsFactors = FALSE, header = FALSE)
nameVector <- c("featureId", "featureName")
colnames(columnNamesData) <- nameVector
# Save the data into a vector for a futher usage
featureNames <- as.vector(columnNamesData[,'featureName']) 
# Final column names vecotr
columnNames <- grep("mean\\(\\)|std\\(\\)", featureNames, value = TRUE)
columnNames2 <- c("subjectId", "activityId", "activityName", paste(columnNames, "-MEAN", sep=""))
columnNames <- c("subjectId", "activityId", "activityName", columnNames)

# Reading activity labels
activityData = read.table("UCI HAR Dataset/activity_labels.txt", stringsAsFactors = FALSE, header = FALSE)
nameVector <- c("activityId", "activityName")
colnames(activityData) <- nameVector

# Step 2a: Read test data set
# ===========================
testSubjects = read.table("UCI HAR Dataset/test/subject_test.txt", stringsAsFactors = FALSE, header = FALSE)
testActivitiesData = read.table("UCI HAR Dataset/test/y_test.txt", stringsAsFactors = FALSE, header = FALSE)
testData = read.table("UCI HAR Dataset/test/X_test.txt", stringsAsFactors = FALSE, header = FALSE)
colnames(testData) <- featureNames
# Add activityId
testData$activityId = testActivitiesData[,"V1"]  
# Add subjects
testData$subjectId = testSubjects[, "V1"]
# Merge the main data set with data set containing activity names
testData <- merge(testData, activityData, by="activityId")
testData <- testData[,columnNames]

# Step 2b: Read train data set
# ============================
trainSubjects = read.table("UCI HAR Dataset/train/subject_train.txt", stringsAsFactors = FALSE, header = FALSE)
trainActivitiesData = read.table("UCI HAR Dataset/train/y_train.txt", stringsAsFactors = FALSE, header = FALSE)
trainData = read.table("UCI HAR Dataset/train/X_train.txt", stringsAsFactors = FALSE, header = FALSE)
colnames(trainData) <- featureNames
# Add activityId
trainData$activityId = trainActivitiesData[,"V1"]  
# Add subjects
trainData$subjectId = trainSubjects[, "V1"]
# Merge the main data set with data set containing activity names
trainData <- merge(trainData, activityData, by="activityId")
trainData <- trainData[,columnNames]

# Step 3: Merge test and train data set
# =============================
testData <- rbind(testData, trainData)
# Arranging the data
testData <- arrange(testData, subjectId, activityId)
# Applying dplyr in order to group and calculate mean
finalData <- testData %>% group_by(subjectId, activityId, activityName) %>% summarise_each(funs(mean(., na.rm = TRUE)))
colnames(finalData) <- columnNames2
# Write the output to a file
write.table(finalData, "output.txt", row.names = FALSE)
