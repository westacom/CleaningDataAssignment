run_analysis<-function()
{
  
  #Note: The UCI Har Dataset folder should be in your default working directory.
  OD=getwd()
  
  #If you do not have the dplyr package installed then uncomment the line below to install it.
  
  #install.packages(dplyr)
  
  #Using the dplyr library
  
  library(dplyr)
  #Setting the directories
  baseDirectory="UCI HAR Dataset"
  trainDirectory="train"
  testDirectory="test"
  setwd(baseDirectory)
  #Reading in the tables and feature names
  activity_labels<-read.table("activity_labels.txt")
  features<-read.table("features.txt")
  #Creating unique activity names
  activity_names<- c("Walking","Walking Upstairs","Walking Downstairs","Sitting","Standing","Laying")
  
  #Loading the training data set
  setwd(trainDirectory)
  X_train<-read.table("X_train.txt")
  y_train<-read.table("y_train.txt")
  subject_train<-read.table("subject_train.txt")
  setwd("..")
  #Loading the testing data set
  setwd(testDirectory)
  X_test<-read.table("X_test.txt")
  y_test<-read.table("y_test.txt")
  subject_test<-read.table("subject_test.txt")
  
  #Combining both data sets
  mergeX<-rbind(X_train,X_test)
  mergeY<-rbind(y_train,y_test)
  mergeSubjects<-rbind(subject_train,subject_test)
  
  colnames(mergeX)<-variableNames
  
  #Finds the locations of the mean and std deviation for all data types.
  meanLocations<-grepl("mean()",variableNames)
  stdLocations<-grepl("std()",variableNames)
  
  #Pulling out the mean and std measurments only
  meanData<-mergeX[,meanLocations]
  stdData<-mergeX[,stdLocations]
  
  #Creates a matrix of means and std for measurments
  tinyData<-cbind(meanData,stdData)
  tinyData<-cbind(tinyData,mergeSubjects)
  tinyData<-cbind(tinyData,mergeY)
  colnames(tinyData)[80]<-"Subject"
  colnames(tinyData)[81]<-"Test"
  
  #Renames the activity labels
  tinyData$Test=factor(tinyData$Test,labels=activity_names)
  #Calculates the mean for each subject and each test for the variables
  groupedData<-group_by(tinyData,Subject,Test)
  groupedDataMeans<-summarise_each(groupedData,funs(mean))
  
  setwd("..")
  setwd("..")
  #Returns the final summarized data set
  return(groupedDataMeans)
  
}
