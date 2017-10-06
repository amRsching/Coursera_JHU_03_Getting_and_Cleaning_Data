# Step1. Merges the training and the test sets to create one data set
# Merge x
x.train <- read.table('UCI HAR Dataset/train/X_train.txt')
x.test <- read.table('UCI HAR Dataset/test/X_test.txt')
x <- rbind(x.train, x.test)
# Merge y
y.train <- read.table('UCI HAR Dataset/train/Y_train.txt')
y.test <- read.table('UCI HAR Dataset/test/Y_test.txt')
y <- rbind(y.train, y.test)
# Merge subject
subject.train <- read.table('UCI HAR Dataset/train/subject_train.txt')
subject.test <- read.table('UCI HAR Dataset/test/subject_test.txt')
subject <- rbind(subject.train, subject.test)

# Step2. Extracts only the measurements on the mean and standard deviation for 
# each measurement
features <- read.table('UCI HAR Dataset/features.txt')
colnames(x) <- features[,2]
indices <- grep('[Mm][Ee][Aa][Nn]\\(\\)|[Ss][Tt][Dd]\\(\\)', features[,2])
x.extract <- x[,indices]

# Step3. Uses descriptive activity names to name the activities in the data set
label = read.table('UCI HAR Dataset/activity_labels.txt', as.is = TRUE)
y.label <- as.data.frame(label[y[,1],2], stringsAsFactors = FALSE)
colnames(y.label) <- "activity"

# Step4. Appropriately labels the data set with descriptive variable names
colnames(subject) <- "subject"
mergedData = cbind(subject, y.label, x.extract)
write.table(mergedData, "mergedData.txt", row.names=FALSE)

# Step5. From the data set in step 4, creates a second, independent tidy data 
# set with the average of each variable for each activity and each subject
library(dplyr)
mergedData_average = summarize_all(group_by(mergedData, subject, activity), 
                                  funs(mean(., na.rm = TRUE)))
write.table(mergedData_average, 'mergedData_average.txt', row.names=FALSE)