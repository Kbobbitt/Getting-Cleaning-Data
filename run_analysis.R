## Getting & Cleansing Data Week 4 Project
# Data for this project represent data from accelerometers of a Galaxy S smartphone.
# A full description of the data is at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
# DataURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
#1. Merge training and test data into one set
#2. Extract only the measurements on the mean and std deveiation for each measurement
#3. Use descriptive activity names to name the activities in the data set
#4. Appropriately label the data set with descriptive variable names
#5. From data in #4, create second tidy data set with the average of each variable
#   for each activity and each subject

#****** Project requiments met by data sets "completedata" and "averages_list"

#setwd("C:/Users/kbobbit/Desktop/Data Science Course/3 Getting and Cleaning Data/4 Week 4/Project")

# Read data files and variable names
trainsubject <- read.table("./subject_train.txt", col.names = "Subject")
trainactivity <- read.table("./y_train.txt", col.names = "Activity")
traindata <- read.table("./X_train.txt")
testsubject <- read.table("./subject_test.txt", col.names = "Subject")
testactivity <- read.table("./y_test.txt", col.names = "Activity")
testdata <- read.table("./X_test.txt")
varnames <- read.table("./features.txt", stringsAsFactors = FALSE)
activitylabels <- read.table("./activity_labels.txt", stringsAsFactors = TRUE)

# Combine subject & activity dataframes
completesubject <- rbind(trainsubject, testsubject)
completeactivity <- rbind(trainactivity, testactivity)

# Combine test & train data, apply variable names to columns and then add suject & activity
completedata <- rbind(traindata, testdata)
colnames(completedata) <- varnames$V2
completedata <- cbind(completesubject, completeactivity, completedata)

# Replace activity numbers with activity descriptions. 
#This is the 
completedata$Activity <- activitylabels$V2[match(completedata$Activity, activitylabels$V1)]

# Identify and extract only measurements on the mean and standard deviation
mean_std_columns <- grep("Subject|Activity|mean\\(\\)|std\\(\\)", colnames(completedata), ignore.case = T, value = TRUE)
mean_std_data <- completedata[, mean_std_columns]
lastcolumn <- ncol(mean_std_data)

#Create tidy data set with the average of each variable for each activity and subject.
attach(mean_std_data)
averages_list <- aggregate(mean_std_data[,3:lastcolumn], by=list(Activity, Subject), FUN=mean)

write.csv(averages_list, file = "./tidy_data_set.txt", row.names = FALSE)


                         




