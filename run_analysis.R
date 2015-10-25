##Import Features
Features <- read.table("./UCI HAR Dataset/features.txt")

##Merge Test Database
XTest <- read.table("./UCI HAR Dataset/test/X_test.txt")
YTest <- read.table("./UCI HAR Dataset/test/y_test.txt")
STest <- read.table("./UCI HAR Dataset/test/subject_test.txt")
colnames(XTest) <- Features$V2; colnames(YTest)[1] <- "Activity"; colnames(STest)[1] <- "Subject"
XTest01 <- cbind(STest,YTest,XTest)

##Merge Train Database
XTrain <- read.table("./UCI HAR Dataset/train/X_train.txt")
YTrain <- read.table("./UCI HAR Dataset/train/y_train.txt")
STrain <- read.table("./UCI HAR Dataset/train/subject_train.txt")
colnames(XTrain) <- Features$V2; colnames(YTrain)[1] <- "Activity"; colnames(STrain)[1] <- "Subject"
XTrain01 <- cbind(STrain,YTrain,XTrain)

#Merge Test and Train Databases
Database <- rbind(XTest01, XTrain01)
valid_column_names <- make.names(names=names(Database), unique=TRUE, allow_ = TRUE)#Corrects column names
names(Database) <- valid_column_names
library(dplyr)
Database02 <- select(Database, Subject, Activity, contains("mean", ignore.case = TRUE),contains("std", ignore.case = TRUE))#Extract variables with mean and std
library(plyr)
Database02$Activity <- mapvalues(Database$Activity, from = c(1,2,3,4,5,6), to = c("1 WALKING","2 WALKING_UPSTAIRS","3 WALKING_DOWNSTAIRS","4 SITTING","5 STANDING","6 LAYING"))
write.table("./UCI HAR Dataset/train/X_train.txt")#Recode Activity number to its description
DatabaseFinal <- group_by(Database02, Activity, Subject)#Create Database grouped by Activity and Subject
DatabaseFinal <- summarize_each(DatabaseFinal,funs(mean))#Final Database
write.table(DatabaseFinal, "./FinalData.txt", row.name=FALSE)