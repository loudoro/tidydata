#### 1. Merges the training and the test sets to create one data set.
### import train set, subject and lables; cbind together
X_train <- read.table("~/Documents/desktop/Courses/data science/UCI HAR Dataset/train/X_train.txt", quote="\"")
y_train <- read.table("~/Documents/desktop/Courses/data science/UCI HAR Dataset/train/y_train.txt", quote="\"")
subject_train <- read.table("~/Documents/desktop/Courses/data science/UCI HAR Dataset/train/subject_train.txt", quote="\"")

names(y_train) = "label"
names(subject_train) = "subject"
train = cbind(X_train, y_train, subject_train)

### add a test flag (0 for train, 1 for test)
train$flgTest = 0

### import test set, subject and lables; cbind together
X_test <- read.table("~/Documents/desktop/Courses/data science/UCI HAR Dataset/test/X_test.txt", quote="\"")
y_test <- read.table("~/Documents/desktop/Courses/data science/UCI HAR Dataset/test/y_test.txt", quote="\"")
subject_test <- read.table("~/Documents/desktop/Courses/data science/UCI HAR Dataset/test/subject_test.txt", quote="\"")

names(y_test) = "label"
names(subject_test) = "subject"
test = cbind(X_test, y_test, subject_test)

### add a test flag (0 for train, 1 for test)
test$flgTest = 1

### merge train and test
data = rbind(train, test)


#### 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
### import list of all features
features <- read.table("~/Documents/desktop/Courses/data science/UCI HAR Dataset/features.txt", quote="\"")

### extract mean and standard deviation from features
cols = features$V1[grepl("mean\\(\\)", features$V2) | grepl("std\\(\\)", features$V2)]

### subset data based on column numbers
subset = data[, cols]

### add label, subject and flgTest to subset
subset = cbind(subset, data[, c("label", "flgTest", "subject")])


#### 3. Uses descriptive activity names to name the activities in the data set
### import activity names and merge names onto subset
activity_labels <- read.table("~/Documents/desktop/Courses/data science/UCI HAR Dataset/activity_labels.txt", quote="\"")
names(activity_labels) = c("label", "activity")
subset = merge(subset, activity_labels, by = "label", all.x = T)
### no longer need label
subset$label = NULL


#### 4. Appropriately labels the data set with descriptive variable names. 
### get variable names and rename subset accordingly
var.names = features$V2[cols]
names(subset)[1:length(cols)] = as.character(var.names)


#### 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
library(reshape2)
molten = melt(subset, id = c("activity", "subject"), measure.vars = var.names)
casted = dcast(molten, activity + subject ~ variable, mean)

write.table(casted, "tidydata.txt", row.names = F)
