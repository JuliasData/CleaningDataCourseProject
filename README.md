# Getting and Cleaning Data Course Project
## Purpose
The Human Activity Recognition Using Smartphones Data Set was used, which represents data collected from the accelerometers from the Samsung Galaxy S smartphone. An R script called **run_analysis.R** was created that does the following:
 
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Additionally, a **CodeBook.md** was prepared that describes the variables and the transformations performed on the data.

## the R script 
The run_analysis.R script requires the libraries plyr and dplyr. They are called at the begin of the script.

## Data
The data was obtained from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones and then unzipped to the working directory in a separate folder.

Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. A Public Domain Dataset for Human Activity Recognition Using Smartphones. 21th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning, ESANN 2013. Bruges, Belgium 24-26 April 2013.

The script returns a tidy dataset *tidydataset.txt* in a text-format with a header including variable information and 180 observations of 81 variables. 

 
