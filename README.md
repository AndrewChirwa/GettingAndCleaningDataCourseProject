Getting and Cleaning Data Course Project
========================================

# run_analysis.R

This R script assumes the files have been downloaded from 

  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

and unzippedto appropriate folders.

Then  running the script will performs the following:

1. Read in the traing and test data sets.
2. Merge the training and the test sets.
3. Read in the features
2. Extracts only the rows that are the measurements on the mean and standard deviation. 
3. Apply descriptive activity names to name the activities in the data set from the 
4. Apply labels the data set with descriptive activity names. 
5. Creates a tidy data set with the average of each variable for each activity and each subject. 


## how to run the analysis

set the working directory to point to the  `UCI HAR Datase` folder

```
source('run_analysis.R')
```

The final result will be a file called `tidy.txt` .

## final tidy dataset

Each row in the final, clean dataset contains subject, activity, and measures for all required features (i.e., mean or standard deviation).
