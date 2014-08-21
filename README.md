tidydata
========

Course project of Getting and Cleaning Data


## run_analysis.R
The script has five sections of codes following the five requirements of the project.

1. Merges the training and the test sets to create one data set.
  * Read in all the training files.
  * Name the data appropricately and cbind all data together so that we can have measurements, subjects, and activity labels all in one single data frame.
  * Add a flag column ("flgTest", 0 for train, 1 for test) so that we can differentiate test and train if we need to.
  * Repeat the same process for test files and then rbind train and test to make one data set.

2. Extracts only the measurements on the mean and standard deviation for each measurement.
  * Read in the name of features.
  * Use grepl to look for "mean()" and "std()" in features, and get the row numbers of matching features.
  * Because the column numbers of the data set we get in Step 1 are in the same order as the row numbers of features, we can use the row numbers to subset the data set to get only the measurements of interest.
  * Add back "label", "flgTest", and "subject" to the data set.

3. Uses descriptive activity names to name the activities in the data set.
  * Read in activity labels.
  * Name the numbers "label" and the description "activity".
  * Use "label" as the key to merge activity labels to the output of Step 2.
  * Remove "label" as they are no longer useful because we have "activity".

4. Appropriately labels the data set with descriptive variable names.
  * Use the row numbers of features we get in Step 2 to get the names of features.
  * Name the measurements columns of the output of Step 3 with the names.

5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
  * Melt the output of Step 4 to make activity and subject the ids and measurements the variables.
  * Cast the molten data to get the final data set. Each row of this data set has all measurements of the relavant features in separate columns for a unique combination of activity and subject.
  * Write the final data set into a text file.


## CodeBook.md
The file describes the variables, the data, and any transformations or work that I performed to clean up the data.
