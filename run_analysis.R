## installing dplyr package to handle the data later

install.packages("dplyr")
library(dplyr)

## set working directory to get the Training data first

setwd("C:/Users/raul/Documents/Raul_Barrea_Coursera/Cleaning_data/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train")

## read Train data files

Train.data <- read.delim("X_train.txt", sep = "", header = FALSE)
## read Activity Train
Activity.Train.data <- read.delim("Y_train.txt", sep = "", header = FALSE)
## read subject train
Subject.Train.data <- read.delim("subject_train.txt", sep = "", header = FALSE)
## 

## Chage working directory to get the test data sets
setwd("C:/Users/raul/Documents/Raul_Barrea_Coursera/Cleaning_data/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test")

## read Test data files
Test.data <- read.delim("X_test.txt", sep = "", header = FALSE)
## read Activity Test
Activity.Test.data <- read.delim("Y_test.txt", sep = "", header = FALSE)
## read subjet Test
Subject.Test.data <- read.delim("subject_test.txt", sep = "", header = FALSE)


## change dir to read feature data

setwd("C:/Users/raul/Documents/Raul_Barrea_Coursera/Cleaning_data/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset")

Features <- read.delim("features.txt", sep = "", header = FALSE)

#Clean Features names: remove '-' , '()', add "."


Features <- sub("^t", "time.",Features[,2])
Features <- sub("^f", "freq.",Features[])
Features <- sub("Body", "Body.",Features[])
Features <- sub("mean", "mean.",Features[])
Features <- sub("std", "std.",Features[])
Features <- sub("Gravity", "Gravity.",Features[])
Features <- sub("-", ".",Features[])
Features <- sub("()-", ".",Features[])
Features <- sub("[:(:]", "",Features[])
Features <- sub("[:):]", "",Features[])

##read activity labels

Activity.labels <- read.delim("activity_labels.txt", sep = "", header = FALSE)


## add colum names to data using values from Features
colnames(Train.data) <- Features[]
colnames(Test.data) <- Features[]
colnames(Subject.Train.data) <- "Subject"
colnames(Activity.Train.data) <- "Activity"
colnames(Subject.Test.data) <- "Subject"
colnames(Activity.Test.data) <- "Activity"

## add two more columns to Train data: subject and activity

Train.data <- cbind(Activity.Train.data, Train.data)
Train.data <- cbind(Subject.Train.data, Train.data)


## add two more columns to Test data: subject and activity

Test.data <- cbind(Activity.Test.data, Test.data)
Test.data <- cbind(Subject.Test.data, Test.data)

# Merge Train and Test data

Full.data <- rbind(Test.data,Train.data)

## remove old data to clear some memory
rm(Train.data)
rm(Test.data)

## select columns containing mean, std, Activity, and Subject

Means <- Full.data[ , grepl( "mean" , names( Full.data ) ) | grepl( "std" , names( Full.data ) ) |grepl( "Activity" , names( Full.data ) ) |grepl( "Subject" , names( Full.data ) )]

## remove old data to clear some memory
rm(Full.data)

## Setting meaningfull names Activities in Activity column 

Means[Means$Activity ==1,2] <- as.character(Activity.labels[1,2])
Means[Means$Activity ==2,2] <- as.character(Activity.labels[2,2])
Means[Means$Activity ==3,2] <- as.character(Activity.labels[3,2])
Means[Means$Activity ==4,2] <- as.character(Activity.labels[4,2])
Means[Means$Activity ==5,2] <- as.character(Activity.labels[5,2])
Means[Means$Activity ==6,2] <- as.character(Activity.labels[6,2])

## arrange the Means data by Subject and by Activity
## Prepare to create a New data set containing all mean values
Means <- arrange(Means,Subject, Activity)
##group values by Subject and Activity
Means <- group_by(Means,Subject,Activity)
## create Tidy data using mean values per subject per activity
Tidy.data <- Means %>% summarize_all(mean)


## save Tidy data in a file

write.table(Tidy.data, file = "Tidy_data.txt", sep = "")