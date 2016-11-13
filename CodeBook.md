# Introduction


  The `run_analysis.R` script merges the training and the test sets to create one data set. Next, it extracts only the measurements on       the mean and standard deviation for each measurement. Next, it combines descriptive activity names to name the activities in the           data set and also labels the data set with descriptive variable names. Finally, it creates a second, independent tidy data set with   the   average of each variable for each activity and each subject.

# Variables

* `XTrain`, `YTrain`, `XTest`, `YTest`, `SubjectTrain` and `SubjectTest` contain the data from the downloaded files.
* `MergeTrain`, `MergeTest` and `FullMerge` merge the base datasets
* `FeatureMerge` combines the Feature types
* `ActivityLabels` combines the Activity type
* `FinalData` is the result of all cleaning
* `SecondTidySet` is the result of the ActivityLable merge

# 
