# tidy-data-Project1
Course Project for "Getting and Cleaning Data" course

The function run_analisys() takes raw data of Human activity captured by mobile phones and performs several processing steps to generate the required tidy_data set.

1) Read the training data into two data_tables called X_Train and Y_train
2) Read subjects of training data into subject_train data_table
3) Repeat the steps 1) and 2) for test data and created data_tables X_test, Y_test and subject_test.
4) create XY_train data table by joining data tables X_train, Y_train and subject_train using cbind. Make sure to change the V1 variable names of Y_train and subject_train tables so that we don't have duplicate column names in the joined table.
5) Repeat step 4) for test data to create XY_test.
6) Now cobine row wise the XY_train and XY_test data tables to create XY data set.
7) Create features table from "features.txt" file
8) Create activity_lables table from "activity_lables.txt" file
9) filter out the rows containing "_mean" and "_std" text from features table.
10) derive vector of column numbers from the "features" table and use it to extract only those columns from XY table. store this data set as mean_std_cols
11) Merge the mean_std_cols with actitvity_lables tables to create mean_std_act data set.
12) rename the column names of mean_std_act with names in the features table.
13) group the rows in mean_std_act by subject and activity.
14) summarise the mean_std_act to compute mean of every variable by subject and activity.


Codebook doe Samsung Human Activity Tests

1 SUBJECT  Nos    The identification number of the subject(1-30) that performed the test
2 ACTIVITY TEXT   Descriptive name of the activity performed by the subject. There are six activities.
3-5 Time domain body acceleration mean for each for X, Y , Z directions.
    tBodyAcc-mean()-X
    tBodyAcc-mean()-Y
    tBodyAcc-mean()-Z

6-8 Time domain body acceleration Standard Deviation for each for X, Y , Z directions.
    tBodyAcc-std()-X
    tBodyAcc-std()-Y
    tBodyAcc-std()-Z

9-11 Time domain Gravity Acceletation mean for each X, Y, Z directions
    tGravityAcc-mean()-X
    tGravityAcc-mean()-Y
    tGravityAcc-mean()-Z

12-14 Time domain Gravity Acceletation standard deviation for each X, Y, Z directions
    tGravityAcc-std()-X
    tGravityAcc-std()-Y
    tGravityAcc-std()-Z

15-17 Time domain body acceleration jerk mean for each for X, Y , Z directions.
    tBodyAccJerk-mean()-X	
    tBodyAccJerk-mean()-Y	
    tBodyAccJerk-mean()-Y

18-20 Time domain body acceleration jerk standard deviation for each for X, Y , Z directions.
    tBodyAccJerk-std()-X	
    tBodyAccJerk-std()-Y	
    tBodyAccJerk-std()-Z

21-23 Time domain body acceleration due to gyro mean for each for X, Y , Z directions.
    tBodyGyro-mean()-X
    tBodyGyro-mean()-Y
    tBodyGyro-mean()-Z

24-26 Time domain body acceleration due to gyro standard deviation for each for X, Y , Z directions.
    tBodyGyro-std()-X
    tBodyGyro-std()-Y
    tBodyGyro-std()-Z

27-29 Time domain body acc due to gyrojerk mean for each for X, Y , Z directions.
    tBodyGyroJerk-mean()-X
    tBodyGyroJerk-mean()-Y
    tBodyGyroJerk-mean()-Z

30-32 Time domain body acc due to gyrojerk standard deviation for each for X, Y , Z directions.
    tBodyGyroJerk-std()-X
    tBodyGyroJerk-std()-Y
    tBodyGyroJerk-std()-Z
	
33-42  Mean and standard deviations of magnitude of various time domain accelerations above
    tBodyAccMag-mean()	
    tBodyAccMag-std()	
    tGravityAccMag-mean()	
    tGravityAccMag-std()	
    tBodyAccJerkMag-mean()	
    tBodyAccJerkMag-std()	
    tBodyGyroMag-mean()	
    tBodyGyroMag-std()	
    tBodyGyroJerkMag-mean()	
    tBodyGyroJerkMag-std()

43-45 Frequency domain body acceleration mean for each for X, Y , Z directions.
    fBodyAcc-mean()-X
    fBodyAcc-mean()-Y
    fBodyAcc-mean()-Z

46-48 Frequency domain body acceleration Standard Deviation for each for X, Y , Z directions.
    fBodyAcc-std()-X
    fBodyAcc-std()-Y
    fBodyAcc-std()-Z

49-51 Frequency domain body acceleration mean frequency for each for X, Y , Z directions.
    fBodyAcc-meanFreq()-X
    fBodyAcc-meanFreq()-Y
    fBodyAcc-meanFreq()-Z

52-54 Frequency domain body acceleration jerk mean for each for X, Y , Z directions.
    fBodyAccJerk-mean()-X	
    fBodyAccJerk-mean()-Y	
    fBodyAccJerk-mean()-Y

55-57 Frequency domain body acceleration jerk standard deviation for each for X, Y , Z directions.
    fBodyAccJerk-std()-X	
    fBodyAccJerk-std()-Y	
    fBodyAccJerk-std()-Z

58-60 Frequency domain body acc mean frequecy in X, Y, Z directions
    fBodyAccJerk-meanFreq()-X	
    fBodyAccJerk-meanFreq()-Y	
    fBodyAccJerk-meanFreq()-Z

61-63 Frequency domain body gyro mean in X, Y, Z directions
    fBodyGyro-mean()-X	
    fBodyGyro-mean()-Y	
    fBodyGyro-mean()-Z	

64-66 Frequency domain body gyro standard deviation in X, Y, Z directions
    fBodyGyro-std()-X	
    fBodyGyro-std()-Y
    fBodyGyro-std()-Z

67-69  Frequency domain body gyro mean frequency in X, Y, Z direction
    fBodyGyro-meanFreq()-X	
    fBodyGyro-meanFreq()-Y	
    fBodyGyro-meanFreq()-Z

70-71 Frequency domain mean and standard deviation of acceleration mangnitude
    fBodyAccMag-mean()	
    fBodyAccMag-std()	

72  Frequency domain mean of acceleration frequency
    fBodyAccMag-meanFreq()	

73-74  Frequency domain mean and std of Body Acc Jerk Mangnitude
    fBodyBodyAccJerkMag-mean()
    fBodyBodyAccJerkMag-std()

75  Frequency domain mean of acceleration Jerk Magnitude frequency
    fBodyBodyAccJerkMag-meanFreq()

76-77 Frequency domain mean and std of Gyro Mangnitude
    fBodyBodyGyroMag-mean()	
    fBodyBodyGyroMag-std()	
78  Frequency domain Gyro Magnitude mean frequency
    fBodyBodyGyroMag-meanFreq()	

79-80 Frequency domain mean and std of Body Gyro Jerk magnitude
    fBodyBodyGyroJerkMag-mean()	
    fBodyBodyGyroJerkMag-std()
	
81  Frequency domain Gyro Jerk Magnitude mean frequency
    fBodyBodyGyroJerkMag-meanFreq()

