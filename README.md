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
9)  filter out the rows containing "_mean" and "_std" text from features table.
10 derive vector of column numbers from the "features" table and use it to extract only those columns from XY table. store this data set as mean_std_cols
11) Merge the mean_std_cols with actitvity_lables tables to create mean_std_act data set.
11) rename the column names of mean_std_act with names in the features table.
12) group the rows in mean_std_act by subject and activity.
13) summarise the mean_std_act to compute mean of every variable by subject and activity.
