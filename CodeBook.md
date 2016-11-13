# Introduction


  The `run_analysis.R` script merges the training and the test sets to create one data set. Next, it extracts only the measurements on   the mean and standard deviation for each measurement. Next, it combines descriptive activity names to name the activities in the      data set and also labels the data set with descriptive variable names. Finally, it creates a second, independent tidy data set with   the average of each variable for each activity and each subject.

# Data
 
 * `activity_labels.txt` - contains the labels for each type of activity
 * `features.txt` - list of all features.
 * `features_info.txt` - Shows information about the variables used on the feature vector.
 * `train/X_train.txt`: XTraining set.
 * `train/y_train.txt`: YTraining labels.
 * `test/X_test.txt` - XTest set.
 * `test/y_test.txt` - YTest labels. 
 * `train/subject_train.txt` - Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
 * `train/Inertial Signals/total_acc_x_train.txt` - The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a     128 element vector. The same description applies for the `total_acc_x_train.txt` and `total_acc_z_train.txt` files for the Y and Z axis. 
 * `train/Inertial Signals/body_acc_x_train.txt` - The body acceleration signal obtained by subtracting the gravity from the total acceleration. 
 * `train/Inertial Signals/body_gyro_x_train.txt` - The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second.

# Variables

* `XTrain`, `YTrain`, `XTest`, `YTest`, `SubjectTrain` and `SubjectTest` contain the data from the downloaded files.
* `MergeTrain`, `MergeTest` and `FullMerge` merge the base datasets
* `FeatureMerge` combines the Feature types
* `ActivityLabels` combines the Activity type
* `FinalData` is the result of all cleaning
* `SecondTidySet` is the result of the ActivityLable merge

# 
