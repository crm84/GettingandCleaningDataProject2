## Start run_analysis.R
 
  ## Download project files
  print("Downloading Files...")
    if(!file.exists("./data")) 
    dir.create("./data")
    fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    download.file(fileUrl, destfile = "./data/ProjectFiles.zip")
  
  print("Finished Download. Unzipping to folder..")
    if(!file.exists("./data/ProjectFiles"))
    dir.create("./data/ProjectFiles")
    unzip("./data/ProjectFiles.zip", exdir = "./data/ProjectFiles")
  print("Complete.")
    
    ## Create R data
  print("Creating Tables...")
    XTrain <- read.table("./data/ProjectFiles/UCI HAR Dataset/train/X_train.txt")
    YTrain <- read.table("./data/ProjectFiles/UCI HAR Dataset/train/y_train.txt")
    SubjectTrain <- read.table("./data/ProjectFiles/UCI HAR Dataset/train/subject_train.txt")
    XTest <- read.table("./data/ProjectFiles/UCI HAR Dataset/test/X_test.txt")
    YTest <- read.table("./data/ProjectFiles/UCI HAR Dataset/test/y_test.txt")
    SubjectTest <- read.table("./data/ProjectFiles/UCI HAR Dataset/test/subject_test.txt")


    
    ## Merge Data
  print("Merging Data...")
    colnames(XTrain) <- Features[,2] 
    colnames(YTrain) <-"ACTIVITY"
    colnames(SubjectTrain) <- "SUBJECT"
    colnames(XTest) <- Features[,2] 
    colnames(YTest) <- "ACTIVITY"
    colnames(SubjectTest) <- "SUBJECT"
    colnames(ActivityLables) <- c('ACTIVITY','TYPE')

    MergeTrain <- cbind(SubjectTrain, YTrain, XTrain)
    MergeTest <- cbind(SubjectTest, YTest, XTest)
    FullMerge <- rbind(MergeTrain, MergeTest)
  print("Complete.")
  
  ##Set Feature names  
  FeatureName <- read.table("./data/ProjectFiles/UCI HAR Dataset/features.txt", stringsAsFactors = FALSE)[,2]
  FeatureIndex <- grep(("mean\\(\\)|std\\(\\)"), FeatureName)
  FeatureMerge <- FullMerge[, c(1, 2, FeatureIndex+2)]
  colnames(FeatureMerge) <- c("SUBJECT", "ACTIVITY", FeatureName[FeatureIndex])
  names(FeatureMerge) <- gsub("\\()", "", names(FeatureMerge))
  names(FeatureMerge) <- gsub("^t", "time", names(FeatureMerge))
  names(FeatureMerge) <- gsub("^f", "frequency", names(FeatureMerge))
  names(FeatureMerge) <- gsub("-mean", "Mean", names(FeatureMerge))
  names(FeatureMerge) <- gsub("-std", "StdDev", names(FeatureMerge))
  FeatureMerge$ACTIVITY <- as.character(FeatureMerge$ACTIVITY)
  for (i in 1:6)
  {
      FeatureMerge$ACTIVITY[FeatureMerge$ACTIVITY == i] <- as.character(ActivityLables[i,2])
  }
  FeatureMerge$ACTIVITY <- as.factor(FeatureMerge$ACTIVITY)
  
  library(plyr)
  SecondTidySet < -aggregate(. ~SUBJECT + ACTIVITY, FeatureMerge, mean)
  SecondTidySet < - SecondTidySet[order(SecondTidySet$SUBJECT, SecondTidySet$ACTIVITY),]
  print("Writing tidy dataset to file...")
  write.table(SecondTidySet, file = "TidyDataSet.txt", row.name=FALSE)
  
  
  
print("All Complete.")
  
  
  