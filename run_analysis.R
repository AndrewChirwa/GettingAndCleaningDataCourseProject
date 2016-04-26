
install.packages("plyr")
library(plyr)

setwd("C:/Coursera/CleanData/UCI HAR Dataset")

# Load the training Datasets
x_train <- read.table("train/X_train.txt")
y_train <- read.table("train/y_train.txt")
subject_train<- read.table("train/subject_train.txt")

#Load the test datasets
x_test <- read.table("test/X_test.txt")
y_test <- read.table("test/y_test.txt")
subject_test<- read.table("test/subject_test.txt")

# Merge x training and tests sets
x_data <- rbind(x_train,x_test)

# Merge y training and tests sets
y_data <- rbind(y_train,y_test)

# Merge Subject Datasets
subject_data <- rbind(subject_train,subject_test)


# Load activity labels + features
features <- read.table("features.txt")
features[,2] <- as.character(features[,2])

# get a vector of columns with mean() and std()
mean_std_features <- grep("-(mean|std)\\(\\)", features[,2])

# Get the data rows that have mean() and std() only
x_data <- x_data[,mean_std_features]

names(x_data) <- features[mean_std_features,2]

activity_labels <- read.table("activity_labels.txt")
activity_labels[,2] <- as.character(activity_labels[,2])

y_data[,1] <- activity_labels[y_data[,1],2]

names(y_data) <- "activity"

#correct column names
names(subject_data) <- "subject"

all_data <- cbind(x_data, y_data, subject_data)

averages_data <- ddply(all_data, .(subject, activity), function(x) colMeans(x[,1:66]))

write.csv(averages_data, "tidy.csv", row.names=FALSE)