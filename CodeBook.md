## Code Book - Samsung wearable smartphone experiments
### This is for "Getting and Cleaning Data" wk3 assignment

* Goal:
1.	Merges the training and the test sets to create one data set.
2.	Extracts only the measurements on the mean and standard deviation for each measurement. 
3.	Uses descriptive activity names to name the activities in the data set
4.	Appropriately labels the data set with descriptive activity names. 
5.	Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

* variables list
There are 561 variables, which are listed in feartures.txt. 
The detail explaination of how these variables being selected (as selected features) can be found in fearture_info.txt.

* raw data
(1)'train/X_train.txt': Training dataset.
(2)'train/y_train.txt': Training activity labels.
(3)'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

(4) 'test/X_test.txt': Test dataset.
(5) 'test/y_test.txt': Test activity labels. 
(6) 'train/subject_test.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.

(7) 'activity_labels.txt": list of activities name

* Data Transformation Steps
(1) read data from test group (test/X_test.txt)
(2) read test activity table and add activity column to testData from step1 (test/y_test.txt)
(3) read data from train group (train/X_train.txt)
(4) read train activity table and add activity column to trainData from step1 (train/y_train.txt)
(5) merge test group data and train group data. 
(6) read variable names (features.txt). the name list is in the 2nd column.
(7) convert activity column as factor, so we can uses descriptive activity names to name the activities in the data set
(8) subset data - we need only mean and std data. This is the first tidy data.
(9) aggregate the dataset from step7 to group data based on subjectID and activity, so we can get the average of each variable for each activity and each subject