## Downloads the data
if(!file.exists("./data")) 
  dir.create("./data")
  fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(fileUrl, destfile = "./data/ProjectData.zip")
  
  if(!file.exists("./data/ProjectFiles")) 
    dir.create("./data/ProjectFiles")
    unzip("./data/ProjectData.zip", exdir = "./data/ProjectFiles")

## Creates datasets
XTrain <- read.table("./data/ProjectFiles/UCI HAR Dataset/train/X_train.txt")
YTrain  <- read.table("./data/ProjectFiles/UCI HAR Dataset/train/y_train.txt")
SubjectTrain <- read.table("./data/ProjectFiles/UCI HAR Dataset/train/subject_train.txt")
XTest <- read.table("./data/ProjectFiles/UCI HAR Dataset/test/X_test.txt")
YTest <- read.table("./data/ProjectFiles/UCI HAR Dataset/test/y_test.txt")
SubjectTest <- read.table("./data/ProjectFiles/UCI HAR Dataset/test/subject_test.txt")

## Merges datasets 
MergeTrain <- cbind(SubjectTrain, YTrain, XTrain)
MergeTest <- cbind(SubjectTest, YTest, XTest)
FullMerge <- rbind(MergeTrain, MergeTest)

## Merges Features and ActivityLabels
Features <- read.table("./data/ProjectFiles/UCI HAR Dataset/features.txt", stringsAsFactors = FALSE)[,2]
FeatureIndex <- grep(("mean\\(\\)|std\\(\\)"), Features)
FinalData <- FullMerge[, c(1, 2, FeatureIndex+2)]
colnames(FinalData) <- c("SUBJECT", "ACTIVITY", Features[FeatureIndex])
ActivityLabels <- read.table("./data/ProjectFiles/UCI HAR Dataset/activity_labels.txt")
FinalData$ACTIVITY <- factor(FinalData$ACTIVITY, levels = ActivityLabels[,1], labels = ActivityLabels[,2])

## Labels the data set with descriptive variable names.
names(FinalData) <- gsub("\\()", "", names(FinalData))
names(FinalData) <- gsub("^t", "time", names(FinalData))
names(FinalData) <- gsub("^f", "frequency", names(FinalData))
names(FinalData) <- gsub("-mean", "Mean", names(FinalData))
names(FinalData) <- gsub("-std", "StdDev", names(FinalData))

## Creates second tidy dataset 
library(plyr);
SecondTidySet <-aggregate(. ~SUBJECT + ACTIVITY, FinalData, mean)
SecondTidySet<- SecondTidySet[order(SecondTidySet$SUBJECT,SecondTidySet$ACTIVITY),]
write.table(SecondTidySet, file = "TidyData.txt",row.name=FALSE)

