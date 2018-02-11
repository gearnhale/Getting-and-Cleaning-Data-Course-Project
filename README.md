==============================================
#  getting-and-cleaning-data-course-project  # 
#  by: Ahdrian Camilo C. Gernale             #
==============================================

A.) In this project, data collected from the accelerometer and gyroscope of the Samsung Galaxy S smartphone was retrieved, worked with, and cleaned, to prepare a tidy data that can be used for later analysis.

B.) This Getting-and-Cleaning-Data-Course-Project repository has the following files:

    a. `README.md`, Overview of the data set and how it was created.
    b. `tidyData.txt`, the data set created after running the run_analysis.R
    c. `CodeBook.md`, the code book, which describes the contents of the data set 
    d. `run_analysis.R`, the R script that was used to create the data set

C.) The short description of the Data Set used:
    Human Activity Recognition Using Smartphones Data Set 
    Download: Data Folder, Data Set Description

    Abstract: Human Activity Recognition database built from the recordings of 30 subjects performing activities of daily living (ADL)    while carrying a waist-mounted smartphone with embedded inertial sensors.

    Data Set Characteristics:   Multivariate, Time-Series
    Number of Instances:        10299
    Area:                       Computer
    Attribute Characteristics:  N/A
    Number of Attributes:       561
    Date Donated:               2012-12-10
    Associated Tasks:           Classification, Clustering
    Missing Values:             N/A
    Number of Web Hits:         596745
    Source:
      Jorge L. Reyes-Ortiz(1,2), Davide Anguita(1), Alessandro Ghio(1), Luca Oneto(1) and Xavier Parra(2)
      1 - Smartlab - Non-Linear Complex Systems Laboratory
      DITEN - Università degli Studi di Genova, Genoa (I-16145), Italy. 
      2 - CETpD - Technical Research Centre for Dependency Care and Autonomous Living
      Universitat Politècnica de Catalunya (BarcelonaTech). Vilanova i la Geltrú (08800), Spain
      activityrecognition '@' smartlab.ws

      Data Set Information:

      The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

      The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.


D.) The R script `run_analysis.R` can be used to create the data set. It retrieves the source data set and transforms it to produce the final data set by implementing the following steps (see the Code book for details, as well as the comments in the script itself):

a. Download and unzip source data if it doesn't exist.
b. Read data.
c. Merge the training and the test sets to create one data set.
d. Extract only the measurements on the mean and standard deviation for each measurement.
e. Use descriptive activity names to name the activities in the data set.
f. Appropriately label the data set with descriptive variable names.
g. Create a second, independent tidy set with the average of each variable for each activity and each subject.
h. Write the data set to the `tidyData.txt` file.

E.) This script requires the `dplyr` package 
