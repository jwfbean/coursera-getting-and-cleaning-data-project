library(data.table)

#
# The activity_labels.txt contains a text description of the integer activity code field
#
  
activities <- read.table('activity_labels.txt', row.names = NULL, col.names = c('activity_code', 'activity_label'))

#
# Features contains the name of the feature measured by the integer feature_id. Used as column names in our analysis.
#
features <- read.table('features.txt', row.names = NULL, col.names = c('feature_id', 'feature_name'), stringsAsFactors = FALSE );

#
# Pull in subject data from test and train datasets
#

subject_test = read.table('test/subject_test.txt')
subject_train = read.table('train/subject_train.txt')

#
# Pull in activity codes from test and train data sets
#

testlabels <- read.table('test/y_test.txt', row.names = NULL)
trainlabels <- read.table('train/y_train.txt', row.names = NULL)

#
# Set the column labels for the activity code column
#

colnames(testlabels)<-c("activity_code")
colnames(trainlabels)<-c("activity_code")

#
# Read the measurements from test and train data sets
#

testdata <- read.table('test/X_test.txt', row.names = NULL)
traindata <- read.table('train/X_train.txt', row.names = NULL)

#
# Apply the column names from the features
#
colnames(testdata) <- features$feature_name
colnames(traindata) <- features$feature_name

#
# Join in the activity codes
#

test_activities <- merge(testlabels, activities, by="activity_code", sort=FALSE)
train_activities <- merge(trainlabels, activities, by="activity_code", sort=FALSE)

#
# Apply the activity labels 
#

testdata$activity_label <- test_activities$activity_label
traindata$activity_label <- train_activities$activity_label

#
# Apply the subjects
#
testdata$subject <- subject_test$V1
traindata$subject <- subject_train$V1

#
# Merge training and test data sets
#
fulldata <- rbind(testdata, traindata)

#
# Find the mean and stddev columns by column name
#
meancols<-grep('mean', names(fulldata))
stdcols<-grep('std', names(fulldata))

#
# Don't forget subject and activity columns
#

newcols<-c(562:563)

#
# Pull out mean and stddev columns as well as the subject and activity columns
#
extractedcols<-sort(c(meancols, stdcols, newcols))
extracted<-fulldata[extractedcols]

#
# Find the mean measurement per subject per activity
#

dt <- data.table(extracted)
outputz <- dt[,lapply(.SD, mean), by=c("subject", "activity_label")]

# output written with
# write.table(outputz, file="output", row.name=FALSE)