Getting and Cleaning Data - Course Project 
==========================================

The purpose of this project is to provide a tidy data set that meets the principles
of tidy data, as taught on the Coursera "Getting and Cleaning Data" course.

This repository contains an R script:

run_analysis.R

Which contains the code to fulfil the requirements of the course project.

The code book for the work is also provided, see [CodeBook.md](CodeBook.md).


How to use run_analysis.R
-------------------------

The code itself contains many comments describing what it is doing at each step.

However some important notes are provided here.

### Install Test Data ###

Before the script can run, the working directory must contain the unzipped data
for the project.  As per the project instructions, this can be downloaded from:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

And must be unzipped maintaining its original directory structure.  So the working 
directory should contain a subdirectory: "UCI HAR Dataset" and (at least) the following files:

  * UCI HAR Dataset/activity\_labels.txt
  * UCI HAR Dataset/features.txt
  * UCI HAR Dataset/test/subject\_test.txt
  * UCI HAR Dataset/test/X\_test.txt
  * UCI HAR Dataset/test/y\_test.txt
  * UCI HAR Dataset/train/subject\_train.txt
  * UCI HAR Dataset/train/X\_train.txt
  * UCI HAR Dataset/train/y\_train.txt

### Inertial Signals data ###

Note that the "Inertial Signals" data are not used by the script, since the purpose of the 
script is to use the mean and standard deviation variables derived from this raw data,
so the variables of interest are in the X\_test.txt and X\_train.txt files.

### Running the Script ###

Once the data is in place in the working directory, the script may be run.

Upon completion it will write a file **tidy-data.txt** to the working directory.

This is a standard R data table with a header row, it may be read using:

read.table("tidy-data.txt", header = TRUE)




