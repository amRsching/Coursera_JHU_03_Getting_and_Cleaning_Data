# Coursera JHU 03 Getting and Cleaning Data Course Project CodeBook
This file describes the variables, the data, and any transformations or work that I have performed to clean up the data.  
* The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:  
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones      
* Here are the data for the project:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  
* The run_analysis.R script performs the following steps to clean up the data set:   
 1. Read X_train.txt, y_train.txt and subject_train.txt from the "./UCI HAR Dataset/train" folder and store them in *x.train*, *y.train* and *subject.train* variables respectively.       
 2. Read X_test.txt, y_test.txt and subject_test.txt from the "./UCI HAR Dataset/test" folder and store them in *x.test*, *y.test* and *subject.test* variables respectively.  
 3. Concatenate *x.train* to *x.test* to generate a 10299x561 data frame ,*x*; concatenate *y.train* to *y.test* to generate a 10299x1 data frame, *y*; concatenate *subject.train* to *subject.test* to generate a 10299x1 data frame, *subject*.  
 4. Read the features.txt file from the "./UCI HAR Dataset/" folder and store the data in a variable called *features*. We only extract the measurements on the mean and standard deviation. This results in a 66 indices list. We get a subset of *x* with the 66 corresponding columns and store it in a new variable called *x.extract*.   
 5. Read the activity_labels.txt file from the "./UCI HAR Dataset/" folder and store the data in a variable called *label*.
 6. Transform the values of *y* according to the *label* data frame and store it in a new variable called *y.label*.  
 7. Combine the *subject*, *y.label* and *x.extract* by column to get a new cleaned 10299x68 data frame, *mergedData*. The "subject" column contains integers that range from 1 to 30 inclusive; the "activity" column contains 6 kinds of activity names; the last 66 columns contain measurements that range from -1 to 1 exclusive.  
 8. Write the *mergedData* out to "mergedData.txt" file in current working directory.  
 9. Using group_by() and summarize_all() functions from the library dplyr, group all measurements by (subject,activity) combinations and calculate the mean of each measurement for the corresponding combinations. We have 30 unique subjects and 6 unique activities, which results in 180 combinations of the two. So, finally we get a 180x68 data frame called *mergedData_average*.
 10. Write the *mergedData_average* out to "mergedData_average.txt" file in current working directory. 
 
© Pingchuan Ma 2017 All Rights reserved.
