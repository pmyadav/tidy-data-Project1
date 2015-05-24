run_analysis <- function(){
  
  ## we need to use dplyr and tidyr packages so load them
  library(dplyr)
  library(tidyr)
  
  ## read all the training data into the data tables
  X_train <- read.table("./train/X_train.txt")
  Y_train <- read.table("./train/Y_train.txt")
  sub_train <- read.table("./train/subject_train.txt")
  
  ## Change the V1 column header so that they remain unique after joining them
  names(Y_train)<- "YV1"
  names(sub_train)<- "SV1"
  
  ## bind column wise all the training tables
  XY_train <- cbind(X_train, Y_train, sub_train)
  
  ## Repeat the above steps for test data
  X_test <- read.table("./test/X_test.txt")
  Y_test <- read.table("./test/Y_test.txt")
  sub_test <- read.table("./test/subject_test.txt")
  
  
  names(Y_test)<- "YV1"
  names(sub_test)<- "SV1"
  
  XY_test <- cbind(X_test, Y_test, sub_test)
  
  ## Cobine the training and test data rowwise to create single data table XY
  XY <- rbind(XY_train, XY_test)
  
  ## load features into data table and filter ut mean and std rows
  
  features <- read.table("./features.txt")
  mean_std_rows<-sapply(features[,2], function(a) any(grepl("-mean", a, ignore.case=TRUE)|grepl("-std", a, ignore.case=TRUE)))
  mean_std <- features[mean_std_rows,]

  ## Use the mean_std row numbers as column numbers and select only these columns from XY data table
  mean_std_cols <- select(XY, c(mean_std[,1],562, 563))
  
  ## Load activity labels
  activity_labels <- read.table("./activity_labels.txt")  
  
  ## Join activity lables to the mean_std_cols table
  mean_std_act <- merge(mean_std_cols, activity_labels, by.x="YV1", by.y="V1")
  mean_std_act <- select(mean_std_act, -YV1)
  
  ## Change the column headers to descriptive feature names
  mean_std = rbind(mean_std, data.frame(V1="NA",V2="SUBJECT"), data.frame(V1="NA",V2="ACTIVITY"))
  names(mean_std_act)<- mean_std[,2]
  
  ## group the mean_std_act data by SUBJECT and ACTIVITY
  by_sub_act <- group_by(mean_std_act, SUBJECT, ACTIVITY)
  
  ## Summarise to find the means by SUBJECT and ACTIVITY
  avg_by_sub_act <- summarise_each(by_sub_act, funs(mean), 1:79)
  
  ## Write the data table to results.txt file
  write.table(avg_by_sub_act,"./results.txt", row.names=FALSE )

  
  
}