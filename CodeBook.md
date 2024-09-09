## CodeBook.md

## a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md

# 1. Merges the training and the test sets to create one data set.
After reading the README for the dataset, combined the three primary data (data, labels, and subjects) for both train and test data into the respective "train_dataset"" and "test_dataset". Task was completed using the read.table() and cbind() functions. 

Before combining both datasets, it was important to read in the "features.txt" file as they matched the number of columns in both the "train_dataset" and the "test_dataset". 

## 3. Uses descriptive activity names to name the activities in the data set
"features.txt" data was read in and saved as "features". "features" was then converted into both data sets to give each column name the correct feature name. Again, read.table() was used to read in the text file and then colnames() was applied to both the "train_dataset" and the "test_dataset" to give both datasets descriptive activity names. 
To make further manipulation easier, data was further cleaned using gsub(). gsub() removed the "-"/ hyphen character, which made for easier matching of strings.

## Completion: 1. Merges the training and the test sets to create one data set. 
Once clean, the data was then merged using the rbind() feature to create a complete list of both training and test data in a single data frame that binded rows of equal length, which was given the name "mergedData". Using rbind means that there is only one column for each variable and combines the observations together. 
 
## 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
Using the mergedData and the grep() function, the dataset was search for any variables containing "mean" or "std". The syntax [] was important to maintain the dataframes structure for further manipulation later in the project. 
Once the search was matched, it was saved as "msdData" meaning "mean & standard deviation data". 

It was then important to remove irrelevant cases of mean such as those giving "mean freqeuncy" denoted by "meanFreq". leveraging the dplyr package and the pipe operator, the columns containing "Freq" were excluded from the dataset, and was then saved as "df" or "dataframe". 

## 3. Uses descriptive activity names to name the activities in the data set
--------------------------------See above----------------------------------

## 4. Appropriately labels the data set with descriptive variable names. 
All data was then made more descriptive and saved to the colnames(df) to save over the most recent rendition of the dataframe. All words were capitalised at the beginning of the word to highlight a separate word and to make the data more readable. Words/letters at the beginning of a column name such as "t" or "f" were manipulated into clearer versions highlighting what they represent, "Time" and "Freqeuncy" respectively. Similarly, words that were originally written in shorthand were extended to represent exact meanings, "acc" was transformed into "Acceleremoter", "mag" being tranformed into "Magnitude", and "gyro" was transformed into "Gyroscope". These transformations are more readable and better represent what the variable measures, while simultaneously avoiding any confusion between words such as "acc" being misinterpreted as "accuracy" or "acceleration". 

## From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
Once data was clean, the means for each activity and subject was computed by using the "dplyr" and "tidyr" packages. the "df" or "data frame" was called and then mutated() across to get the mean for each variable. Then the pivot_longer() function converts the single-row data frame into a long format where each row contains a variable name and its corresponding mean. This is then saved as a new variable called "dt" or "data table".


## Tidy Data
Each marker of tidy data has been checked throughout this process. 
- Each variable is in one column which was done during (Q1) through "rbind" and (Q3) through "colnames".
- Each different observation of that variable was put in a different row during the "rbind" function as rbind puts data in a single data frame that binded rows of equal length
- Each kind of variable "X, Y, Z" have there own table to highlight that they are different measurements, ie. the three different axial-directions
- As there are multiple tables, each are linked by the initial index column 1:10299. 

Moreover,
There is a row at the top detailing each variable name (column names)
Variable names are human readable and do not shorten any words.


