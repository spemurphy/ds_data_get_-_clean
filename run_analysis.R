## Delineate, Download and extra file 
library(dplyr)
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
destfile <- "UCI_HAR_Dataset.zip"

download.file(url, destfile, mode="wb")

unzip(destfile, exdir="UCI_HAR_Dataset")

list.files("UCI_HAR_Dataset", recursive=TRUE)

## Transfer data to a readable form 
train_data <- read.table("UCI_HAR_Dataset/UCI HAR Dataset/train/subject_train.txt")
train_labels <- read.table("UCI_HAR_Dataset/UCI HAR Dataset/train/X_train.txt")                         
train_subjects <- read.table("UCI_HAR_Dataset/UCI HAR Dataset/train/y_train.txt") 
test_data <- read.table("UCI_HAR_Dataset/UCI HAR Dataset/test/subject_test.txt")
test_labels <- read.table("UCI_HAR_Dataset/UCI HAR Dataset/test/X_test.txt")                        
test_subjects <- read.table("UCI_HAR_Dataset/UCI HAR Dataset/test/y_test.txt")


## Combine training and test datasets by their subjects, labels and data 
train_dataset <- cbind(train_subjects, train_labels, train_data)
test_dataset <- cbind(test_subjects, test_labels, test_data)

## 3. Uses descriptive activity names to name the activities in the data set
## Convert column names to features.txt file
features <- read.table("UCI_HAR_Dataset/UCI HAR Dataset/features.txt")
colnames(train_dataset) <- features[,2]
colnames(test_dataset) <- features[,2]

## Remove difficult metacharacters from datasets and clean variables
colnames(train_dataset) <- gsub("-", "", names(train_dataset))
colnames(test_dataset) <- gsub("-", "", names(mergedData))


## 1. Merges the training and the test sets to create one data set.
mergedData <- rbind(train_dataset, test_dataset)

## 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
msdData <- mergedData[grep("mean|std",colnames(mergedData), value=TRUE)] 
df <- msdData %>% select(-contains("Freq"))

## 4. Appropriately labels the data set with descriptive variable names. 
# hard-coded substitution of all names to make them more readable
colnames(df) <- gsub("^t", "Time", colnames(df))
colnames(df) <- gsub("^f", "Frequency", colnames(df))
colnames(df) <- gsub("Mag", "Magnitude", colnames(df))
colnames(df) <- gsub("[Aa]cc", "Accelerometer", colnames(df))
colnames(df) <- gsub("Gyro", "Gyroscope", colnames(df))
colnames(df) <- gsub("mean()", "Mean", colnames(df))
colnames(df) <- gsub("std()", "StandardDeviation", colnames(df))
colnames(df) <- gsub("BodyBody", "Body", colnames(df))

## From the data set in step 4, creates a second, 
## independent tidy data set with the average of each variable for each activity and each subject.
library(dplyr)
library(tidyr)

dt <- df %>%
  summarize(across(everything(), mean)) %>%
  pivot_longer(everything(), names_to = "Variable", values_to = "Mean")

