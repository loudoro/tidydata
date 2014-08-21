### Code Book

The tidydata.txt is a summary of selected data from the UCI HAR dataset
(https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip). 
For more information about the raw data, please read the "README.txt" from the dataset.

# Data files used to make tidydata.txt

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'test/subject_test.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 


# Data Dictionary - tidydata.txt

activity 
    Type of activity
        WALKING
        WALKING_UPSTAIRS
        WALKING_DOWNSTAIRS
        SITTING
        STANDING
        LAYING
        
subject
    Identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

Column 3 to 68 are the means of variable selected. Please refer to README.md for the variable selection process.
    Features are normalized and bounded within [-1,1].
