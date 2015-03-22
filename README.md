# run_analysis
This is a Coursera class project submission repo.  Course is "Getting and Cleaning Data," and demonstrates how to build a tidy data set, share the R code used to do so, and create some documentation.

The code is fairly straightforward.  You'll first need to download the Human Activity Recognition data from UCI here:https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The zipfile will need to be unzipped into a directory similar to the following: "~/R/R Working Directory/GettingCleaningData/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset".  You'll set your working directory in R to this level.

This R script requires the 'plyr' package.  If you do not already have plyr installed, you'll need to do so.

This code builds several dataframes from .txt files contained within the unpacked zipfile above, manipulates them, combines them, and extracts relevant sensor measurements for aggregation across 6 activity types and 30 observed subjects.  The code first reads and combines the test and train datasets, then reads the respective label files and adds them to the combined dataset, then reads the subject files and adds them to the combined dataset.  The code then subsets the combined dataset, using an index of the variables containing either "mean()" or "std()", as found in the features.txt file.  This subset dataset (extract) contains 66 variables.  It is then complemented with activity labels (which require a lookup to get plain language descriptions) and subjet IDs.  Column names are then renamed with descriptive names from the features.txt file.

Lastly, in order to aggregate means by activity and subject, we create two subsets of the 'extract' dataframe, one with the groups, and one without.  Then using the aggregate() function, we can calculate mean by the appropriate levels.

The output file (ActivityAverages.txt) is included in this repo.

Cheers.
