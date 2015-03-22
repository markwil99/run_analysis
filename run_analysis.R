##run_analysis.R is set up to read, load, process and extract the averages of every mean and standard deviation
#variable from the http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones dataset.
#The zip file should be downloaded from here: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
#and unzipped on your pc into a directory that you will use as the working directory for this script.

##step one is to set your working directory.  YOU MAY NEED TO ADJUST THE TOP LINE TO THE LOCATION WHERE YOU EXRACTED
#THE UCI HAR DATASET.

setwd("~/R/R Working Directory/GettingCleaningData/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset")

##read/load the test and train datasets, as well as the activity labels and subject ids.

library(plyr)
listOfFiles<-c("test/x_test.txt","train/x_train.txt") #this creates a variable to be used by plyr to build one dataset
bigdata<-ldply(listOfFiles,read.table) #creates a single master dataframe including both test and train sets
testLabels<-read.table("test/y_test.txt") #builds a df of the test set's activity codes
trainLabels<-read.table("train/y_train.txt") #builds a df of the training set's activity codes
labels<-rbind(testLabels,trainLabels) #combines the test and train label sets into a single df
names(labels)<-c("Labels") #renames the variable, for clarity and to be used in merging later

testsub<-read.table("test/subject_test.txt") #builds a df of the test subjects
trainsub<-read.table("train/subject_train.txt") #builds a df of the training subjects
subs<-rbind(testsub,trainsub) #combines the test and train subject sets into a single df
names(subs)<-c("Subject") #renames the variable, for clarity and to be used in merging later

features<-read.table("features.txt") #builds a df of the variable names
meanIndex<-grep("mean()",features$V2,fixed=TRUE) #builds an index of the variable names containing mean
stdIndex<-grep("std()",features$V2,fixed=TRUE) #builds an index of the variable names containing std
Index<-append(meanIndex,stdIndex) #combines the indices into one that can be used to subset the big data set

extract<-bigdata[,Index]  ##extracts std() and mean() variables, creates a small, manageable dataframe
extract$Labels<-labels[,1] ##adds the activity label id to each row
extract$Subject<-subs[,1] #adds the subject id to each row

labelVals<-read.table("activity_labels.txt") #this creates a small df to lookup the actual activity description by number
names(labelVals)<-c("Labels","Activity") #renames the variables, for clarity and for merging
extract<-merge(labelVals, extract, by="Labels",all.x=TRUE) #merges the extract with the lookup activity labels

##rename the variables based on the list of features from original dataset
names(extract)<-c("Labels","Activity",as.character(features[Index,2]),"Subject")

#calculate means by activity group and subject id, output tidy dataset
extract.x<-subset(extract,select=c(-Labels, -Activity,-Subject))
extract.a<-subset(extract,select=c(Activity,Subject))
agg<-aggregate(extract.x,extract.a,mean, na.rm=TRUE)
write.table(agg,"ActivityAverages.txt")
