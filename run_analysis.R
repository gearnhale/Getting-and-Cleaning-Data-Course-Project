##############################################################################
#Assuming that you have installed dyplr, reshape2
##############################################################################

##############################################################################
#Downloading the required dataset
##############################################################################
if (!file.exists("UCI HAR Dataset.zip")) {
  download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", "UCI HAR Dataset.zip", mode = "wb")
}

##############################################################################
# To unzip the file containing  the data if directory doesn't exist
##############################################################################
dataPath <- "UCI HAR Dataset"
if (!file.exists("UCI HAR Dataset")) {
  unzip("UCI HAR Dataset")
}

##############################################################################
# the following codes read the data in UCI HAR Dataset file in table format and creates a data frame
############################################################################## 
actLabels <- read.table("UCI HAR Dataset/activity_labels.txt")
actLabels[,2] <- as.character(actLabels[,2])
features <- read.table("UCI HAR Dataset/features.txt")
features[,2] <- as.character(features[,2])

##############################################################################
# searching for matched "*mean*" or "*std*" on the table features
##############################################################################
featuresData <- grep(".*mean.*|.*std.*", features[,2])
featuresData.names <- features[featuresData,2]

##############################################################################
#after searching, performs replacement
############################################################################## 
featuresData.names = gsub('-mean', 'Mean', featuresData.names)
featuresData.names = gsub('-std', 'Std', featuresData.names)
featuresData.names <- gsub('[-()]', '', featuresData.names)

##############################################################################
# Merging the train and test data
##############################################################################

#concatenate the train
train <- read.table("UCI HAR Dataset/train/X_train.txt")[featuresData]
ActTrain <- read.table("UCI HAR Dataset/train/Y_train.txt")
SubjTrain <- read.table("UCI HAR Dataset/train/subject_train.txt")
train <- cbind(SubjTrain, ActTrain, train)

#concatenate the test
test <- read.table("UCI HAR Dataset/test/X_test.txt")[featuresData]
ActTests <- read.table("UCI HAR Dataset/test/Y_test.txt")
SubjTests <- read.table("UCI HAR Dataset/test/subject_test.txt")
test <- cbind(SubjTests, ActTests, test)

##############################################################################
# remove individual data tables to save memory
##############################################################################
rm(ActTrain, SubjTrain, ActTests,SubjTests)

##############################################################################
#Merge the training and the test sets to create one data set  with subject and activity label
##############################################################################
MergedData <- rbind(train, test)
colnames(MergedData) <- c("subject", "activity", featuresData.names)

##############################################################################
# using descriptive activity names to name the activities in the data
############################################################################## 
MergedData$activity <- factor(MergedData$activity, levels = actLabels[,1], labels = actLabels[,2])
MergedData$subject <- as.factor(MergedData$subject)

MergedData.melted <- melt(MergedData, id = c("subject", "activity"))
MergedData.mean <- dcast(MergedData.melted, subject + activity ~ variable, mean)


##############################################################################
#creating the final data into tidy.txt
##############################################################################
write.table(MergedData.mean, "tidy.txt", row.names = FALSE, quote = FALSE)