run_analysis <- function(){
  library(dplyr)
  X_train <- read.table("./train/X_train.txt")
  Y_train <- read.table("./train/Y_train.txt")

  sub_train <- read.table("./train/subject_train.txt")
  
  names(Y_train)<- "YV1"
  names(sub_train)<- "SV1"
  
  XY_train <- cbind(X_train, Y_train, sub_train)
  
  X_test <- read.table("./test/X_test.txt")
  Y_test <- read.table("./test/Y_test.txt")

  sub_test <- read.table("./test/subject_test.txt")
  
  
  names(Y_test)<- "YV1"
  names(sub_test)<- "SV1"
  
  XY_test <- cbind(X_test, Y_test, sub_test)
  
  XY <- rbind(XY_train, XY_test)
  
  features <- read.table("./features.txt")
  activity_labels <- read.table("./activity_labels.txt")  

  mean_std_rows<-sapply(features[,2], function(a) any(grepl("-mean", a, ignore.case=TRUE)|grepl("-std", a, ignore.case=TRUE)))
  mean_std <- features[mean_std_rows,]

  mean_std_cols <- select(XY, c(mean_std[,1],562, 563))
  mean_std_act <- merge(mean_std_cols, activity_labels, by.x="YV1", by.y="V1")
  mean_std_act <- select(mean_std_act, -YV1)
  
  mean_std = rbind(mean_std, data.frame(V1="NA",V2="SUBJECT"), data.frame(V1="NA",V2="ACTIVITY"))
  names(mean_std_act)<- mean_std[,2]
  by_sub_act <- group_by(mean_std_act, SUBJECT, ACTIVITY)
  
  avg_by_sub_act <- summarise_each(by_sub_act, funs(mean), 1:79)
  write.table(avg_by_sub_act,"./results.txt", row.names=FALSE )
  ##head(avg_by_sub_act)
  
  
}