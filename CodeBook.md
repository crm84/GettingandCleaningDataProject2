# Introduction


* Data is downloaded and unzipped to ./data/ProjectFiles
* Data is merged into respective datasets and
* Mean and Standard Deviation measures are taken from the whole dataset and corrects the names using features.txt
* Activity Labels are included in the dataset 
* SecondTidySet dataset is produced in root directory

# Variables

* `XTrain`, `YTrain`, `XTest`, `YTest`, `SubjectTrain` and `SubjectTest` contain the data from the downloaded files.
* `MergeTrain`, `MergeTest` and `FullMerge` merge the base datasets
* `FeatureMerge` combines the Feature types
* `SecondTidySet` is the result of the ActivityLable merge
