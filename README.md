CleaningDataAssignment
======================

Course Project for Cleaning Data 

The run_anlysis script works by including the UCI HAR Dataset in the same working directory as the script. The 
code initialized the dplyr library, reads in the Xtrain, XTest,yTrain,yTest information and merges them into a larger data table. 

I use grepl commands to search the data table for the mean and std measurments and selectivly pull those out. Next I use the group_by and summarize_eeach commands to calucluate the means of each variable for each subject and activity. I store this information in a new matrix.

CODEBOOK:

Directory varaibles: OD,baseDirectory,trainDirectory,testDirectory 

variableNames: description of the measurment

activity_names: list of text activities that each subjet performs

X_train: the measurments of the training subjects list

y_train: activity list for each measurments

subject_train: subject list for the training

X_test: the measurments of the test subjects list

y_test: activity list for each measurments

subject_test: subject list for the test

mergeX: merging the measurements tables

mergeY: merging the activity tables

mergeSubjects: merging the subject tables

meanData: table of measurents which measure mean

stdData: table of measurments which show std

tinyData: combined table of mean and std deviation measurments

goupredData: groups the data by subject and activity

groupedDataMeans: Calculates the mean of each measurment by subject and activity (this is the final table)
