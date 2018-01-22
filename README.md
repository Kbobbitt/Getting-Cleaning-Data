##Week 4 Project Submission

### Getting and Cleaning Data

The ultimate objective of this project was to create a tidy data set and save it to a file on my local computer. The following steps were required to do so.

1. Download and extract zipped file from "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip".

2. Merge training & test data set to create an intial tidy data set.

3. Reduct the initial set to a select group of specified columns.

4. Create a second tidy data set to hold the mean of the specified columns by using the aggregate
function to calculate their mean. Grouping was done on the "Activity" and "Subject" columns.

5. Save the resulting data frame to the working directory.

Results within my R script are stored in the "averages_list" data frame. My resulting data set is located 
in this Github repository in the file "tidy_data_set.txt". It is stored in csv format.

## How my R script works

1. The first part of my script reads the necessary files from my working directory.
2. The second section merges both the training and test files for the Subject and Activity variables.
3. Next, the measurement data for test & training are merged.
4. Columns for Subject, Activity and measurements are combined into the "completedata" data frame.
5. Numeric values for Activity are replaced with the descriptions supplied in file "activity_labels.txt"
6. grep is then used to build mean_std_columns, which contain only measurements of mean & std. deviation.
7. mean_std_columns is used to subset the initial data set into mean_std_data with only desired columns.
8. The aggregate funtion is used to create the final tidy data set in averages_list.
9. averages_list is written to the working directory as a csv file.


 

