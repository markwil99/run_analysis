# run_analysis
This is a Coursera class project submission repo.  Course is "Getting and Cleaning Data," and demonstrates how to build a tidy data set, share the R code used to do so, and create some documentation.

The code is fairly straightforward.  You'll first need to download the Human Activity Recognition data from UCI here:https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The zipfile will need to be unzipped into a directory similar to the following: "~/R/R Working Directory/GettingCleaningData/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset".  You'll set your working directory in R to this level.

This R script requires the 'plyr' package.  If you do not already have plyr installed, you'll need to do so.

This code builds several dataframes from .txt files contained within the unpacked zipfile above, manipulates them, combines them, and extracts relevant sensor measurements for aggregation across 6 activity types and 30 observed subjects.  The output file (ActivityAverages.txt) is included in this repo.

Cheers.
