# Code Book

a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data

# Libraries Used

1) **data.table** - allows for faster functions that modify data frames
2) **dplyr**      - contains basic tools for modifying data frames
3) **tidyr**      - evolved version of 'rehshape2' ; used for data tidying

# Data Source

The data source files are contained in a zip file that can be found in [here] (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

More documentation can be found here: (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

# Variables Used

Variable | Description
---------|------------
subject | contains combined test and train data sets that has a numeric ID corresponding to the subject (Ranging from 1 to 30)
activity | contains combined test and train data sets that has a numeric ID (from 1 to 6) corresponding to an activity
features | contains combined test and train data sets that have the 561-feature vector with time and frequency domain variables.

# Activity Labels

Referencing 'activity_labels.txt' file, there are 6 activities measured during the experiment.

Activity ID | Label
------------|-----------
1 | WALKING
2 | WALKING_UPSTAIRS
3 | WALKING_DOWNSTAIRS
4 | SITTING
5 | STANDING
6 | LAYING

# Feature Vector Measurements

Out of the original 561 features, below are the ones extracted as having mean and standard deviation measurements. Note that the mean frequency measurements have been excluded.

 [1] "time-body-acceleration-mean-x"                       
 [2] "time-body-acceleration-mean-y"                       
 [3] "time-body-acceleration-mean-z"                       
 [4] "time-gravity-acceleration-mean-x"                    
 [5] "time-gravity-acceleration-mean-y"                    
 [6] "time-gravity-acceleration-mean-z"                    
 [7] "time-body-acceleration-jerk-mean-x"                  
 [8] "time-body-acceleration-jerk-mean-y"                  
 [9] "time-body-acceleration-jerk-mean-z"                  
[10] "time-body-angular-velocity-mean-x"                   
[11] "time-body-angular-velocity-mean-y"                   
[12] "time-body-angular-velocity-mean-z"                   
[13] "time-body-angular-velocity-jerk-mean-x"              
[14] "time-body-angular-velocity-jerk-mean-y"              
[15] "time-body-angular-velocity-jerk-mean-z"              
[16] "time-body-acceleration-magnitude-mean"               
[17] "time-gravity-acceleration-magnitude-mean"            
[18] "time-body-acceleration-jerk-magnitude-mean"          
[19] "time-body-angular-velocity-magnitude-mean"           
[20] "time-body-angular-velocity-jerk-magnitude-mean"      
[21] "frequency-body-acceleration-mean-x"                  
[22] "frequency-body-acceleration-mean-y"                  
[23] "frequency-body-acceleration-mean-z"                  
[24] "frequency-body-acceleration-jerk-mean-x"             
[25] "frequency-body-acceleration-jerk-mean-y"             
[26] "frequency-body-acceleration-jerk-mean-z"             
[27] "frequency-body-angular-velocity-mean-x"              
[28] "frequency-body-angular-velocity-mean-y"              
[29] "frequency-body-angular-velocity-mean-z"              
[30] "frequency-body-acceleration-magnitude-mean"          
[31] "frequency-body-acceleration-jerk-magnitude-mean"     
[32] "frequency-body-angular-velocity-magnitude-mean"      
[33] "frequency-body-angular-velocity-jerk-magnitude-mean" 
[34] "time-body-acceleration-stdev-x"                      
[35] "time-body-acceleration-stdev-y"                      
[36] "time-body-acceleration-stdev-z"                      
[37] "time-gravity-acceleration-stdev-x"                   
[38] "time-gravity-acceleration-stdev-y"                   
[39] "time-gravity-acceleration-stdev-z"                   
[40] "time-body-acceleration-jerk-stdev-x"                 
[41] "time-body-acceleration-jerk-stdev-y"                 
[42] "time-body-acceleration-jerk-stdev-z"                 
[43] "time-body-angular-velocity-stdev-x"                  
[44] "time-body-angular-velocity-stdev-y"                  
[45] "time-body-angular-velocity-stdev-z"                  
[46] "time-body-angular-velocity-jerk-stdev-x"             
[47] "time-body-angular-velocity-jerk-stdev-y"             
[48] "time-body-angular-velocity-jerk-stdev-z"             
[49] "time-body-acceleration-magnitude-stdev"              
[50] "time-gravity-acceleration-magnitude-stdev"           
[51] "time-body-acceleration-jerk-magnitude-stdev"         
[52] "time-body-angular-velocity-magnitude-stdev"          
[53] "time-body-angular-velocity-jerk-magnitude-stdev"     
[54] "frequency-body-acceleration-stdev-x"                 
[55] "frequency-body-acceleration-stdev-y"                 
[56] "frequency-body-acceleration-stdev-z"                 
[57] "frequency-body-acceleration-jerk-stdev-x"            
[58] "frequency-body-acceleration-jerk-stdev-y"            
[59] "frequency-body-acceleration-jerk-stdev-z"            
[60] "frequency-body-angular-velocity-stdev-x"             
[61] "frequency-body-angular-velocity-stdev-y"             
[62] "frequency-body-angular-velocity-stdev-z"             
[63] "frequency-body-acceleration-magnitude-stdev"         
[64] "frequency-body-acceleration-jerk-magnitude-stdev"    
[65] "frequency-body-angular-velocity-magnitude-stdev"     
[66] "frequency-body-angular-velocity-jerk-magnitude-stdev"

# Cleaning up the variable names

```
  colnames(features) <- gsub("^t","time-",colnames(features))
  colnames(features) <- gsub("^f","frequency-",colnames(features))
  colnames(features) <- gsub("Acc","-acceleration",colnames(features))
  colnames(features) <- gsub("Mag","-magnitude",colnames(features))
  colnames(features) <- gsub("std","stdev",colnames(features))
  colnames(features) <- gsub("\\(\\)","",colnames(features))
  colnames(features) <- gsub("(Jerk|Gyro)", "-\\1",colnames(features))
  colnames(features) <- gsub("BodyBody","body",colnames(features))
  colnames(features) <- gsub("Gyro","angular-velocity",colnames(features))
  colnames(features) <- tolower(colnames(features))
```
# Output File

The final tidied independent data set results into 4 columns: subject, activity, measurement and mean. It was designed to show the average of each variable for each activity and each subject.
Refer to the 'TidyData.txt' file in this repo.

**Snapshot**
```
  subject           activity                   measurement      mean
    <int>             <fctr>                         <chr>     <dbl>
1       1            WALKING time-body-acceleration-mean-x 0.2773308
2       1   WALKING_UPSTAIRS time-body-acceleration-mean-x 0.2554617
3       1 WALKING_DOWNSTAIRS time-body-acceleration-mean-x 0.2891883
4       1            SITTING time-body-acceleration-mean-x 0.2612376
5       1           STANDING time-body-acceleration-mean-x 0.2789176
6       1             LAYING time-body-acceleration-mean-x 0.2215982

  subject           activity                                          measurement       mean
    <int>             <fctr>                                                <chr>      <dbl>
1      30            WALKING frequency-body-angular-velocity-jerk-magnitude-stdev -0.5785800
2      30   WALKING_UPSTAIRS frequency-body-angular-velocity-jerk-magnitude-stdev -0.7913494
3      30 WALKING_DOWNSTAIRS frequency-body-angular-velocity-jerk-magnitude-stdev -0.6455039
4      30            SITTING frequency-body-angular-velocity-jerk-magnitude-stdev -0.9909464
5      30           STANDING frequency-body-angular-velocity-jerk-magnitude-stdev -0.9550086
6      30             LAYING frequency-body-angular-velocity-jerk-magnitude-stdev -0.9754815

```
# Data Structure

**summary(cleandata2)**
```
    subject                   activity    measurement             mean         
 Min.   : 1.0   WALKING           :1980   Length:11880       Min.   :-0.99767  
 1st Qu.: 8.0   WALKING_UPSTAIRS  :1980   Class :character   1st Qu.:-0.96205  
 Median :15.5   WALKING_DOWNSTAIRS:1980   Mode  :character   Median :-0.46989  
 Mean   :15.5   SITTING           :1980                      Mean   :-0.48436  
 3rd Qu.:23.0   STANDING          :1980                      3rd Qu.:-0.07836  
 Max.   :30.0   LAYING            :1980                      Max.   : 0.97451  
 ```




