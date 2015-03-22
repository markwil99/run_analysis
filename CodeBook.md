This REPO is the course project submission for the Coursera course: Getting and Cleaning Data, part of the Data Science Specialized Track.  All code is designed for data from the 

==================================================================
Human Activity Recognition Using Smartphones Dataset
Version 1.0
==================================================================
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
==================================================================

More details about the underlying data, and information about how to access it are at the bottom of this CodeBook.

For the purposes of the course assignment, the run_analysis.R script was written to do the following:
1   Merges the training and the test sets to create one data set.
2   Extracts only the measurements on the mean and standard deviation for each measurement. 
3   Uses descriptive activity names to name the activities in the data set
4   Appropriately labels the data set with descriptive variable names. 
5   From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The script requires the installation of the 'plyr' R package, as well as the download and unzipping of the HAR dataset from UCI's website: http://archive.ics.uci.edu/ml/machine-learning-databases/00240/UCI%20HAR%20Dataset.zip

run_analysis.R will generate an output .txt file called 'ActivityAverages.txt'  This file displays the means for each variable, per activity type (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING), and for each of 30 subjects that were part of UCI's study.

run_analysis.R will generate the following dataframes and values:
agg - the final frame, as exported to "ActivityAverages.txt"
bigdata - the original table of test and training data loaded together
extract - a subset of bigdata, showing only the variables that are means or standard deviations
extract.a - a subset of extract used for aggregations and creating 'agg'
extract.x - a subset of extract used for aggregations and creating 'agg'
features - the table of feature classes, from UCI's data: "features.txt"
labelVals - a table of lookups for the plain language activity types (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)
labels - the combined output of codes from test and training data, used to identify what activity was observed
subs - the combined output of subject IDs for each observation, from test and training data combined
testLabels - the labels, as identified in "y_test.txt"
testsub - the list of subject IDs for each observation of test data, from "subject_test.txt"
trainLabels - the labels, as identified in "y_train.txt"
trainsub - the list of subject IDs for each observation of training data, from "subject_train.txt"

Index: an integer list of features containing either "mean()" or "std()"
listOfFiles - a tempory list of the "x_test.txt" and "x_train.txt" filepaths, used for reading the data into R
meanIndex: an integer list of features containing "mean()"
stdIndex: an integer list of features containing "std()"



Additional information about the data and underlying experiments, taken verbatum from the UCI data webpage:





The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each record it is provided:
======================================

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The dataset includes the following files:
=========================================

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

Notes: 
======
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

For more information about this dataset contact: activityrecognition@smartlab.ws

License:
========
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.

