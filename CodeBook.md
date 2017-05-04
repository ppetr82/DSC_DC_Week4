# Codebook for Getting and Cleaning Data Course Project
=====================================================
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
###Dimensional columns
###Factual columns




