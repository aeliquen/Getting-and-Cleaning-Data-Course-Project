# Getting-and-Cleaning-Data-Course-Project

This repository is a requirement for the course project as the final course assignment to complete the course Getting and Cleaning Data available through Coursera and administered by Johns Hopkins University.

This README.md file explains how all of the scripts work and how they are connected.

The primary required course project deliverable is an R script called run_analysis.R that does the following:

1) Merges the training and the test sets to create one data set.
2) Extracts only the measurements on the mean and standard deviation for each measurement.
3) Uses descriptive activity names to name the activities in the data set
4) Appropriately labels the data set with descriptive variable names.
5) From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Also part of this repository are the following:

> TidyData.txt                                                 - final resulting tidy independent dataset
> CodeBook.md                                                  - code book that describes the variables, the data, and any transformations or work that you performed to clean up the data
> run_analysis.R                                               - R script that analyzes and cleans up the provided dataset
> Human Activity Recognition Using Smartphones Data Set        - a copy of the dataset provided in the course project

Background of the Dataset:

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

More information can be found here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

In accessing the dataset, you will find the following attributes of the dataset:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

For the purposes of this project, the data in the 'Inertial Signals' folder will not be used. 
More information can be found in the 'README.txt' inside the dataset folder.

To see a comprehensive explanation on the feature selection, refer to the 'features_info.txt' file.
To see the complete list of variables of each feature vector available, refer to the 'features.txt' file.
