This file describes the variables, data, and transformations for the Tidy data project.

Variables

The variables i nthese data frames aare imported from the feaures file. The vaiables were modify to comply with the Tidy data rules. 
Some examples here:
tBodyAcc-mean()-X was modified  as 		time.Body.Acc.mean.X 
fBodyAcc-mean()-X was modified  as 		freq.Body.Acc.mean.X 


Data

Train.data = contains the raw data from the train set
Activity.Train.data = contains the activity data from the train set
Train.data = contains th Subject data from the Train set

Test.data = contains the raw data from the test set
Activity.Test.data = contains the activity data from the test set
Subject.Test.data = contains th Subject data from the Test set


Features = contains the 561 original features  
Activity.labels = contains the oiginal 6 activity labels


Full.data = contains the merged Train and Test data, including the Subject and Activiy columns.


Means = Contains only the columns of the mean and std values from the original set. The Subject and Activity columns are preserved here.


Tidy.data = this dat set conmtains the aerage values per activity per subject.

