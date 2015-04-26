# It is a prerequisite for this script that the dataset has been downloaded and 
# unzipped in the working directory.  That is, there should be a directory
# called "UCI HAR Dataset" under the working directory, which contains the 
# dataset.  This directory is created when unzipping the file found at:
#
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

# First load the necessary libraries:

library(dplyr)
library(reshape2)

# Step 1 - Read in the training data set and the test data set, and merge these:

# Each row of the dataset represents a single observation and contains 561
# whitespace separated numeric variables.  The read.table function defaults to 
# whitespace separation.  It also defaults to not expecting a header row, which
# is correct for our data.

# We also load the files containing the subject and activity ids.  Because these
# are in single column files, we can use the scan function to read these into 
# a vector.

# Note that we don't need to load the "Inertial Signals" data, since it provides
# the raw data from which the other data is derived.  As per the instructions,
# we only care about the mean and standard deviation data in the derived data set.

testSet <- read.table("UCI HAR Dataset/test/X_test.txt")
testSubjects <- scan("UCI HAR Dataset/test/subject_test.txt", what = integer())
testActivities <- scan("UCI HAR Dataset/test/y_test.txt", what = integer())

trainSet <- read.table("UCI HAR Dataset/train/X_train.txt")
trainSubjects <- scan("UCI HAR Dataset/train/subject_train.txt", what = integer())
trainActivities <- scan("UCI HAR Dataset/train/y_train.txt", what = integer())

# Combine the data:

combinedSet <- rbind(testSet, trainSet)
combinedSubjects <- c(testSubjects, trainSubjects)
combinedActivities <- c(testActivities, trainActivities)

# Append the subject and activity ids to the main data:

combinedSet <- cbind(combinedSet, 
                     subject = combinedSubjects, 
                     activity = combinedActivities)

# Step 2 - Extract only the columns containing mean and standard deviation

# To do this, load the features.txt file containing the feature names (or the 
# names of the variables derived from the features) for each column in the main
# data set:

features <- read.table("UCI HAR Dataset/features.txt", 
                       stringsAsFactors = FALSE,
                       col.names = c("columnNumber", "name"))

# We are only interested in the mean and standard deviation columns for each
# signal.  For this data the feature name will include "-mean()" or "-std()",
# we will use the dplyr filter function with grepl for this, using 'fixed' to
# indicate that we're searching for an exact substring, not a regular expression.
# (Note that we are not interested in the meanFreq or angle variables, since
# these are not simple means of the underlying signals):

interestingVariables <- filter(features, grepl("-mean()", name, fixed = TRUE) | 
                                         grepl("-std()", name, fixed = TRUE))

# Now we can select the interesting columns from our data (including keeping
# the subject and activity columns, and moving them into the first and second
# column positions):

interestingData <- select(combinedSet, subject,
                                       activity,
                                       interestingVariables$columnNumber)

# Step 3 - Descriptively name the activities in the data set

# First read in the names of the activities:

activities <- read.table("UCI HAR Dataset/activity_labels.txt", 
                         stringsAsFactors = FALSE,
                         col.names = c("id", "name"))

# Create a vector of activity names, and use it to replace the activity ids in
# our data:

activityNames <- activities[interestingData$activity,"name"]
interestingData <- mutate(interestingData, activity = activityNames)


# Step 4 - Apply descriptive variable names to our columns:

# "interestingVariables$name" contains the names of the data columns from the 
# original data set.  
# 
# We'll start by cleaning up these names a little bit, removing hyphens and 
# parentheses and replacing some abbreviations. Also remove duplicate "body" 
# from some variable names.

# We'll also prepend the first two column  names, "subject" and 
# "activity" to keep things simple:

columnNames <- c("subject", "activity", interestingVariables$name)

columnNames <- sub("mean()", "Mean", columnNames, fixed = TRUE)
columnNames <- sub("std()", "Std", columnNames, fixed = TRUE)
columnNames <- gsub("-", "", columnNames, fixed = TRUE)
columnNames <- gsub("Acc", "Acceleration", columnNames)
columnNames <- gsub("Mag", "Magnitude", columnNames)
columnNames <- sub("^t", "time", columnNames)
columnNames <- sub("^f", "frequency", columnNames)
columnNames <- sub("BodyBody", "Body", columnNames)

# Now apply these cleaned-up variable names to the columns:

colnames(interestingData) <- columnNames



# Step 5 - Produce an average for each variable for each activity and each subject.

# So we want to produce a table of the form:

# subject activity variable1 variable2 variable3 ...
# 2       WALKING  n1        n2        n3            

# Where n1 is the average of all values of variable 1 where the subject is 2
# and the activity is "WALKING", similarly for n2 and n3 etc.

# So we melt the data around the id fields, "subject" and "activity".  This 
# defaults to treating all of the other fields as measures - thus we avoid 
# needing to explicitly list all of the other variables in the code:

melted <- melt(interestingData, id=c("subject", "activity"))

# And we now cast the data into the form we want, subjects and activities in the
# rows, and everything else (...) in the columns, aggregated using the mean
# function, and we write the data out to a file in the working directory:

summaryData <- dcast(melted, subject + activity ~ ..., mean)

write.table(summaryData, "results-table.txt", row.names = FALSE)

