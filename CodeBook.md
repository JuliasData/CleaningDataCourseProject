# CodeBook for the Cleaning and Data Course Project

## Data
The Data was obtained from: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
The following files were used:

1. activity_labels.txt
2. X_train.txt 
3. y_train.txt
4. X_test.txt
5. y_test.txt
6. subject_train.txt
7. subject_test.txt
8. features.txt

### Transformations
1. The test and train data was combined to a single dataset. 
2. The values for mean and standard deviations - separately for each subject, activity and variable - were selected. This was done by filtering the description of 'mean' and 'std' from the variable description. This resulted in 79 variables.
3. The activity levels were renamed from the numerical coding to their description.
4. The variable names were slightly changed for a better use of the data and a minor naming-error was corrected. See below for a complete list.
5. A second dataset **tidydataset.txt** was created in which data was summarized based on subject and activity, resulting in 180 rows - subjects*activities - and 81 variables - including subject number and activity as grouping variables. 

### Variables
There are two domains indicated as follows: t - Time Domain Signals in 50Hz and f - Frequency Domain after Fast Fourier Transformations

There are two sources of data: the Accelerometer - abbreviated by ACC and the gyroscope - abbreviated by GYRO

All raw data has three domains because of their spatial nature: the x-, y- and z-axis.

A combined factor was derived to obtain Jerk signals from both sources in all three dimensions.

The magnitude of the data was calculated for the Jerk and the other signals separately. 

From the measurements the Mean value -mean- and Standard deviation - std - were calculated. 

This results in the following scheme, with the headers included for a better understanding of the strcutre; the **variable names listed in the tidydataset-file** are as follows: 

*Domain: TIME*


	1.1 ACC
	  1.1.1 Body
		  1.1.1.1. 
		    aa) tBodyAcc-X-mean
		    ab) tBodyAcc-X-std
		    ba) tBodyAcc-Y-mean
		    bb) tBodyAcc-Y-std
		    ca) tBodyAcc-Z-mean
		    cb) tBodyAcc-Z-std
		    
		    1.1.1.2 - magnitude
			  a) tBodyAccMag–mean
			  b) tBodyAccMag–std
		
		  1.1.2.1. - JERK
		    aa) tBodyAccJerk-X-mean
		    ab) tBodyAccJerk-X-std
		    ba) tBodyAccJerk-Y-mean
		    bb) tBodyAccJerk-Y-std
		    ca) tBodyAccJerk-Z-mean
		    cb) tBodyAccJerk-Z-std

			1.1.2.2. - JERK - magnitude
			  a) tBodyAccJerkMag–mean
			  b) tBodyAccJerkMag-std
				
	1.1.2 Gravity
	    1.1.2.1
	      aa)  tGravityAcc-X-mean
	      ab)  tGravityAcc-X-std
	      ba)  tGravityAcc-Y-mean
	      bb)  tGravityAcc-Y-std
	      ca)  tGravityAcc-Z-mean
	      cb)  tGravityAcc-Z-std

			1.1.2.2 - magnitude
			  a) tGravityAccMag-mean
			  b) tGravityAccMag–std
		
	1.2 GYRO
	    1.2.1.1
	      aa) tBodyGyro-X-mean
	      ab) tBodyGyro-X-std
	      ba) tBodyGyro-Y-mean
	      bb) tBodyGyro-Y-std
	      ca) tBodyGyro-Z-mean
	      cb) tBodyGyro-Z-std
				
		  1.2.1.2 - magnitude
		    a) tBodyGyroMag-mean
		    b) tBodyGyroMag-std

	    1.2.2.1 - JERK
		    aa) tBodyGyroJerk-X-mean
		    ab) tBodyGyroJerk-X-std
		    ba) tBodyGyroJerk-Y-mean
		    bb) tBodyGyroJerk-Y-std
		    ca) tBodyGyroJerk-Z-mean
		    cb) tBodyGyroJerk-Z-std

		  1.2.2.2 - JERK - magnitude
		    a) tBodyGyroJerkMag-mean
		    b) tBodyGyroJerkMag-std

*Domain: FREQUENCY*

	2.1 ACC
    2.1.1 Body
      2.1.1.1.1
        aa) fBodyAcc-X-mean
        ab) fBodyAcc-X-std
        ac) fBodyAcc-meanFreqX
        ba) fBodyAcc-Y-mean
        bb) fBodyAcc-Y-std
        bc) fBodyAcc-meanFreqY		
        ca) fBodyAcc-Z-mean
        cb) fBodyAcc-Z-std
        cc) fBodyAcc-meanFreqZ
      
        2.1.1.1.2 - magnitude
          a) fBodyAccMag-mean
          b) fBodyAccMag–std
          c) fBodyAccMag-meanFreq

      2.1.1.2.1 - JERK
        aa) fBodyAccJerk-X-mean 
        ab) fBodyAccJerk-X-std
        ac) fBodyAccJerk-meanFreq-X
        ba) fBodyAccJerk-Y-mean
        bb) fBodyAccJerk-Y-std
        bc) fBodyAccJerk-meanFreq-Y
        ca) fBodyAccJerk-Z-mean
        cb) fBodyAccJerk-Z-std
        cc) fBodyAccJerk-meanFreqZ
        
        2.1.1.2.2 - JERK -magnitude
          a) fBodyAccJerkMag–mean
          b) fBodyAccJerkMag–std
          c) fBodyAccJerkMag-meanFreq
		  
	2.2 GYRO
	  2.2.1.1 
	    aa) fBodyGyro-X-mean
	    ab) fBodyGyro-X-std
	    ac) fBodyGyro-meanFreq-X
	    ba) fBodyGyro-Y-mean
	    bb) fBodyGyro-Y-std
	    bc) fBodyGyro-meanFreq-Y
	    ca) fBodyGyro-Z-mean
	    cb) fBodyGyro-Z-std
	    cc) fBodyGyro—meanFreq-Z
	    
	      2.2.1.2 - magnitude
	        a) fBodyGyroMag-mean
	        b) fBodyGyroMag-std
	        c) fBodyGyroMag-meanFreq
    
      2.2.2.1 - JERK - magnitude
        a) fBodyGyroJerkMag-mean
        b) fBodyGyroJerkMag-std
        c) fBodyGyroJerkMag-meanFreq
        
  	3. Activity
     3.1 Walking
     3.2 Walking Upstairs
     3.3 Walking Downstairs
     3.4 Sitting
     3.5 Standing
     3.6 Laying
    
    4.Subject 
    numbered from 1-30
