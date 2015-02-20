library(plyr)
library(dplyr)

## loading the data 
# the data are unzipped in a separate folder in the working directory called 'UCI HAR Dataset' 
# with subfolders for the train and test-data, respectively
training_set <- read.table('./UCI HAR Dataset/train/X_train.txt')
test_set <- read.table('./UCI HAR Dataset/test/X_test.txt')

test_subjects <- read.table('./UCI HAR Dataset/test/subject_test.txt')
training_subjects <- read.table('./UCI HAR Dataset/train/subject_train.txt')

training_activities <- read.table('./UCI HAR Dataset/train/y_train.txt')
test_activities <- read.table('./UCI HAR Dataset/test/y_test.txt')

feature_names <- read.table('./UCI HAR Dataset/features.txt')

## first step of the analysis
# combining the separate informations for the test and training sets
test_set <- cbind(test_set, test_activities, test_subjects)
training_set <- cbind(training_set, training_activities, training_subjects)

# and then combining these to one dataset
data_set <- rbind(test_set, training_set)

## second step of the analysis
# extracting only the mean and standard deviation for each measurement
# this is done by filtering from the feature names all variables where
# 'std' or 'mean' is included
library(dplyr)
selec_feature <- filter(feature_names, grepl('mean', V2) | grepl('std', V2))

# this data.frame is then converted to a factor of all variable numbers
labels <- selec_feature$V1

# the additional columns of activity and subject are included
label <- c(labels, 562, 563)

# from the data_set all colums (=variables) are selected matching the
# factor created above
data_selec <- data_set[, label]

## step three: renaming the activity levels with descriptions
# first the column names are named adequately

names(data_selec) [80] <- "activity"
names(data_selec) [81] <- "subjects"

# the function call 'factor' is used to rename the levels of 1-6 per
# readme-description

data_selec$activity <- factor(data_selec$activity,
                         levels = c("1", "2", "3", "4", "5", "6"),
                         labels = c("WALKING","WALKING_UPSTAIRS", 
"WALKING_DOWNSTAIRS","SITTING","STANDING", "LAYING"),
                         ordered = FALSE)

## step four: label the data with descriptive variable names
# first a character vector is done from the remaining feature_names 
col_name <- as.character(selec_feature$V2)
colnames(data_selec) <- c(col_name, "activity", "subject")

#then some variables are renamed to tidy up the data
#first: 'BodyBody' is changed to 'Body' across all columns
names(data_selec) <- gsub("BodyBody", "Body", names(data_selec))

#secondly: the double brackets are removed
names(data_selec) <- gsub("\\()", "", names(data_selec))

#thirdly: the order of Axis-Estimations is changed 
#because to me that makes much more sense 
#see Codebook
names(data_selec) <- gsub("mean-X", "X-mean", names(data_selec))
names(data_selec) <- gsub("mean-Y", "Y-mean", names(data_selec))
names(data_selec) <- gsub("mean-Z", "Z-mean", names(data_selec))
names(data_selec) <- gsub("std-X", "X-std", names(data_selec))
names(data_selec) <- gsub("std-Y", "Y-std", names(data_selec))
names(data_selec) <- gsub("std-Z", "Z-std", names(data_selec))

## fifth step: create a second independent dataset with the
# avarage of each variable --> please note: my interpretation is to average also
# across the standard deviations (i.e. all columns), which is a rather wide format
# for each activity and each subject

# this is done with the dpply function to summarize columnwise based on the
# grouping of 'activity' and 'subject'
data <- ddply(data_selec, .(activity, subject), numcolwise(mean))
detach(package:plyr) 

# save the datasest in the required format with the row.name = FALSE command as requested
tidydataset <- write.table (data, file = "tidydataset.txt", row.name = FALSE)
