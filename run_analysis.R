## The R script below merges the training and test sets to create one data set
## that extracts 

# 0 - Prep Activities - Load Packages & Download

packages <- c("data.table","dplyr","tidyr")
lapply(packages,require,character.only=TRUE)

path <- getwd()


fileurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

f <- "ProjectData.zip"
if (!file.exists(path)) {
	dir.create(path)
}

download.file(fileurl,file.path(path,f),method="curl")
unzip(f, exdir = "./")



# 1 - Reading the data and merging the data sets

cleandata <- data.frame()
train_subj <- read.table("UCI HAR Dataset/train/subject_train.txt")
train_act  <- read.table("UCI HAR Dataset/train/y_train.txt")
train_feat  <- read.table("UCI HAR Dataset/train/X_train.txt")

test_subj <- read.table("UCI HAR Dataset/test/subject_test.txt")
test_act  <- read.table("UCI HAR Dataset/test/y_test.txt")
test_feat  <- read.table("UCI HAR Dataset/test/X_test.txt")

# Combine the train and test data sets 
subject  <- rbind(train_subj,test_subj)
activity <- rbind(train_act,test_act)
features <- rbind(train_feat,test_feat)

# Merge the test and train data sets

# Extract feature names and assign to the features table
featurename <- read.table("UCI HAR Dataset/features.txt")
featurename$V2 <- as.character(featurename$V2)
colnames(features) <- featurename$V2


# 2 - Extracts only the mean and standard deviation measurements

features <- features[,!duplicated(colnames(features))]
features <- features %>% dplyr:: select(grep("-mean\\(\\)",names(features)),grep("-std\\(\\)",names(features)))

# 3 - Map activity names to corresponding values in activity data 
actnames <- read.table("UCI HAR Dataset/activity_labels.txt")
activity[,1] <- factor(activity[,1],levels = actnames[,1],labels = actnames[,2])

names(activity) <- c("activity")
names(subject)  <- c("subject")


# 4 Label the variables

colnames(features) <- gsub("^t","time-",colnames(features))
colnames(features) <- gsub("^f","frequency-",colnames(features))
colnames(features) <- gsub("Acc","-acceleration",colnames(features))
colnames(features) <- gsub("Mag","-magnitude",colnames(features))
colnames(features) <- gsub("std","stdev",colnames(features))
colnames(features) <- gsub("\\(\\)","",colnames(features))
colnames(features) <- gsub("(Jerk|Gyro)", "-\\1",colnames(features))
colnames(features) <- gsub("BodyBody","body",colnames(features))
colnames(features) <- gsub("Gyro","angular-velocity",colnames(features))
colnames(features) <- tolower(colnames(features))

cleandata <- cbind(subject,activity,features)

# 5 Create a second independent tiny data set with the average of each variable for each activity and each subject

cleandata2 <- data.frame()
cleandata2 <- tbl_df(cleandata) %>% group_by(subject,activity) %>% summarize_each(funs(mean)) %>% gather(measurement,mean,-activity,-subject)

# Saving the data set and writing to a text file


write.table(cleandata2,file = "TidyData.txt", row.names = FALSE)
