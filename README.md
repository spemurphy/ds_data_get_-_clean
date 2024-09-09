## ds_data_get_-_clean

# Step 1. 
Load the dplyr package to help with read.table
Delineate file and save as variable and highlight desired file path name

# Step 2. 
Download the file using the download.file function

# Step 3. 
Extract the file for use by setting the destfile (where the file is 
located) and the exit directory.

# Step 4. 
list all files that are available in the larger dataset to discern 
the essential file names

# Step 5. 
Transfer data to a readable form using read.table and saving as 
appropriate definition (subject, label, data) 

# Step 6. 
Combine the columns for the 
training and test datasets by their subjects, labels and data 


# Step 7. 
Download the "features.txt" file so that the dataframes possess the correct
variable names and save them as the column names for both train_datasets and test_datasets

# Step 8. 
Make the data easier to work with by using gsub() function to remove 
difficult metacharacters from datasets and clean variables

# Step 9. 
Merges the training and the test sets to create one data set using the
rbind() function which matches overlapping column names into a single column, 
creating more rows but the same number of columns


# Step 10. 
Extracts only the measurements that are means or standard deviations
from the list of column names and saves them as a variable msdData or mean and
standard deviation data

# Step 11. 
Removes the "meanFreq" measurements by selecting only those that 
do not contain the string "Freq" in its variable name and saves it to a 
new variable "df" or "data frame"

# Step 12. 
Appropriately labels the data set with descriptive variable names. 
hard-coded substitution of strings to make them more readable. 
All words were capitalised at the beginning of the word to highlight a 
the beginning of a new word. Words/letters at the 
beginning of a column name -- "t" or "f" -- were manipulated into 
clearer versions highlighting what they represent, "Time" and "Frequency" 
respectively. Similarly, words that were originally written in shorthand 
were extended to represent exact meanings, "acc" was transformed into 
"Acceleremoter", "mag" being tranformed into "Magnitude", and "gyro" 
was transformed into "Gyroscope". These transformations are more readable 
and better represent what the variable measures, while simultaneously 
avoiding any confusion between words such as "acc" being misinterpreted as 
"accuracy" or "acceleration". 

# Step 13. 
Manipulating the newly created dataframe in step 12 (Q4), the tidyr package was 
loaded in to be used to help manipulate data

# Step 14. 
The data frame was then manipulated into average of each variable 
for each activity and each subject. Then the pivot_longer() function converts 
the single-row data frame into a long format where each row contains a 
variable name and its corresponding mean. This is then saved as a new 
variable called "dt" or "data table".




