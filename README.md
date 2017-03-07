# GettingCleaningDataProject

The purpose of this project is to collect and clean a data set in order to make it ready for later analysis.

## Files provided in the repository
In this repository you can find the following files:
* CodeBook.md: containing the description of the tidy data-set (variables, levels of factors)
* run_analysis.R: script used to clean the data set and to obtain "dataset-final.txt"
* dataset-final.txt: the "tidy-data-set".

Here below, after a short description of the original data set, I summarize the procedure implemented in order to obtain a tidy data set ("dataset-final.txt").

## Description of the original data set

*Human Activity Recognition Using Smartphones Dataset
*Version 1.0
*==================================================================
*Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
*Smartlab - Non Linear Complex Systems Laboratory
*DITEN - Università degli Studi di Genova.
*Via Opera Pia 11A, I-16145, Genoa, Italy.
*activityrecognition@smartlab.ws
*www.smartlab.ws


The initial dataset includes the following files:

* 'README.txt'
* 'features_info.txt': Shows information about the variables used on the feature vector.
* 'features.txt': List of all features.
* 'activity_labels.txt': Links the class labels with their activity name.
* 'train/X_train.txt': Training set.
* 'train/y_train.txt': Training labels.
* 'test/X_test.txt': Test set.
* 'test/y_test.txt': Test labels.

The following files are also available for the train and test data. 

* 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
* 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 
* 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 
* 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 


## Cleaning procedure

The following step have been performed in order to obtain the tidy data set:
* Download of the original data.set, unzip and exploration of the files contained in the folder. We build the training file by merging the data contained in the folder "./train" (no subfloder considered), and similary for the training set in the folder "./train". 
The names of the columns for the variables containing the observation have been extracted from the file "features.txt", the column for the id of the subject has been names "Subject" and the id of the activity "Activity".
* Merge of the training and the test sets to create one data set by using rbind on the two data frames (same number of columns!).
* Extracted only the measurements on the mean and standard deviation for each measurement (by using grep on the strings 'mean' and 'std').
* "Activity" and "Subject" have been modified as factor variables in R and the "Activity" values have been replace by the levels contained in the file "activity_labels.txt".
* Labels of the varibale in the data set has been renamed by removing dots.
* From the data set in the previous step, we creates a second, independent tidy data set with the average of each variable for each activity and each subject by using the function 'aggregate' in R.
* The final data set is saved by using 'write.table'.

## Guido Francesco Iori - 2017-03-07 