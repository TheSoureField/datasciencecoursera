## Getting and Cleaning Data - week3
# assignment part1:
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive activity names. 


#reading data from test group and add activity column to the end
test <- read.table("~/UCI HAR Dataset/test/X_test.txt",head=F)
label <- read.table("~/UCI HAR Dataset/test/Y_test.txt", header=F)
subjTest <- read.table("~/UCI HAR Dataset/test/subject_test.txt", header=F)
testData <- cbind(label, subjTest, test)

#read data from train group and add activity column to the end
train <- read.table("~/UCI HAR Dataset/train/X_train.txt",head=F)
label2 <- read.table("~/UCI HAR Dataset/train/Y_train.txt", header=F)
subjTrain <- read.table("~/UCI HAR Dataset/train/subject_train.txt", header=F)
trainData <- cbind(label2, subjTrain, train)

# append test group to the train group
data <- rbind(testData, trainData)

#add variable names 
features <- read.table("~/UCI HAR Dataset/features.txt", header=F)
varnames <- as.character(feature[[2]])
var <- c("activity", "subjectID", varnames)
colnames(data) <- var

#convert activity as factor
data$activity <-as.factor(data$activity)
levels(data$activity) <- c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING")

# tidy data for assignment part1:
# subset data - we need only mean and std data
subData <- data[grep("mean()|std()|subjectID|activity", names(data))]
meanStdData <- subData[- grep("meanFreq()", names(subData))]


## Assignment part2
# 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject
tidy2 <- aggregate(data[3:563], list(data$subjectID, data$activity), mean) 


