# Coursera JHU 03 Getting and Cleaning Data
This file describes how run_analysis.R script works.
1. Unzip the zip package from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip directly into the current working directory.
2. Make sure the folder "UCI HAR Dataset" and the run_analysis.R script are both in the current working directory.
3. Use source("run_analysis.R") command in the console of RStudio. 
4. Two output files are generated in the current working directory:
  - mergedData.txt (7.89 Mb): it contains the measurements on the mean and standard deviation for each measurement for each subject and each activity.
  - mergedData_average.txt (220 Kb): it contains a second, independent tidy data set with the average of each variable in "mergedData.txt" for each subject and each activity.
5. Use data <- read.table("mergedData_average.txt", header = TRUE) command in the console of RStudio to read the file. There are 30 subjects and 6 activities in total, the variable *data* will have 180 rows with all combinations for each of the 66 features. 

© Pingchuan Ma 2017 All Rights reserved.
