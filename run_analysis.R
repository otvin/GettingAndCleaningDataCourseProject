library(dplyr)

run_analysis <- function () {

  #start with testing the directory and file exist...
  if (file.exists("UCI HAR Dataset") == FALSE) {
    stop("Dataset not found.  Dataset must be present in working directory.  See README.md for details.")
  }
    
  test_data <- read.table("UCI HAR Dataset/test/X_test.txt", header = FALSE)
  test_subjects <- read.table("UCI HAR Dataset/test/subject_test.txt", header = FALSE)
  test_activities <- read.table("UCI HAR Dataset/test/y_test.txt", header = FALSE)
  test_activities[test_activities == 1] <- "WALKING"
  test_activities[test_activities == 2] <- "WALKING_UPSTAIRS"
  test_activities[test_activities == 3] <- "WALKING_DOWNSTAIRS"
  test_activities[test_activities == 4] <- "SITTING"
  test_activities[test_activities == 5] <- "STANDING"
  test_activities[test_activities == 6] <- "LAYING"
  
  test_interim <- cbind(test_subjects, test_activities)
  test_combined <- cbind(test_interim, test_data)
  
  training_data <- read.table("UCI HAR Dataset/train/X_train.txt", header = FALSE)
  training_subjects <- read.table("UCI HAR Dataset/train/subject_train.txt", header = FALSE)
  training_activities <- read.table("UCI HAR Dataset/train/y_train.txt", header = FALSE)
  
  training_activities[training_activities == 1] <- "WALKING"
  training_activities[training_activities == 2] <- "WALKING_UPSTAIRS"
  training_activities[training_activities == 3] <- "WALKING_DOWNSTAIRS"
  training_activities[training_activities == 4] <- "SITTING"
  training_activities[training_activities == 5] <- "STANDING"
  training_activities[training_activities == 6] <- "LAYING"
  
  training_interim <- cbind(training_subjects, training_activities)
  training_combined <- cbind(training_interim, training_data)
  
  merged_set <- rbind(test_combined, training_combined)
  trimmed_set <- merged_set[,c(1,2,3,4,5,6,7,8,43,44,45,46,47,48,83,84,85,86,87,88,123,124,125,126,127,128,
                               163,164,165,166,167,168,203,204,216,217,
                               229,230,242,243,255,256,268,269,270,271,272,273,
                               347,348,349,350,351,352,426,427,428,429,430,431,
                               505,506,518,519,531,532,544,545)]
  
  colnames(trimmed_set) <- c("subject", "activity",
  "tBodyAcc-mean()-X",
  "tBodyAcc-mean()-Y",
  "tBodyAcc-mean()-Z",
  "tBodyAcc-std()-X",
  "tBodyAcc-std()-Y",
  "tBodyAcc-std()-Z",
  "tGravityAcc-mean()-X",
  "tGravityAcc-mean()-Y",
  "tGravityAcc-mean()-Z",
  "tGravityAcc-std()-X",
  "tGravityAcc-std()-Y",
  "tGravityAcc-std()-Z",
  "tBodyAccJerk-mean()-X",
  "tBodyAccJerk-mean()-Y",
  "tBodyAccJerk-mean()-Z",
  "tBodyAccJerk-std()-X",
  "tBodyAccJerk-std()-Y",
  "tBodyAccJerk-std()-Z",
  "tBodyGyro-mean()-X",
  "tBodyGyro-mean()-Y",
  "tBodyGyro-mean()-Z",
  "tBodyGyro-std()-X",
  "tBodyGyro-std()-Y",
  "tBodyGyro-std()-Z",
  "tBodyGyroJerk-mean()-X",
  "tBodyGyroJerk-mean()-Y",
  "tBodyGyroJerk-mean()-Z",
  "tBodyGyroJerk-std()-X",
  "tBodyGyroJerk-std()-Y",
  "tBodyGyroJerk-std()-Z",
  "tBodyAccMag-mean()",
  "tBodyAccMag-std()",
  "tGravityAccMag-mean()",
  "tGravityAccMag-std()",
  "tBodyAccJerkMag-mean()",
  "tBodyAccJerkMag-std()",
  "tBodyGyroMag-mean()",
  "tBodyGyroMag-std()",
  "tBodyGyroJerkMag-mean()",
  "tBodyGyroJerkMag-std()",
  "fBodyAcc-mean()-X",
  "fBodyAcc-mean()-Y",
  "fBodyAcc-mean()-Z",
  "fBodyAcc-std()-X",
  "fBodyAcc-std()-Y",
  "fBodyAcc-std()-Z",
  "fBodyAccJerk-mean()-X",
  "fBodyAccJerk-mean()-Y",
  "fBodyAccJerk-mean()-Z",
  "fBodyAccJerk-std()-X",
  "fBodyAccJerk-std()-Y",
  "fBodyAccJerk-std()-Z",
  "fBodyGyro-mean()-X",
  "fBodyGyro-mean()-Y",
  "fBodyGyro-mean()-Z",
  "fBodyGyro-std()-X",
  "fBodyGyro-std()-Y",
  "fBodyGyro-std()-Z",
  "fBodyAccMag-mean()",
  "fBodyAccMag-std()",
  "fBodyBodyAccJerkMag-mean()",
  "fBodyBodyAccJerkMag-std()",
  "fBodyBodyGyroMag-mean()",
  "fBodyBodyGyroMag-std()",
  "fBodyBodyGyroJerkMag-mean()",
  "fBodyBodyGyroJerkMag-std()"
  )
  
  
  # remove all the temporary variables - likely not necessary but I did it during debugging
  rm(merged_set, test_activities, test_combined, 
                 test_data, test_interim, test_subjects,
                 training_activities, training_combined, training_data,
                 training_interim, training_subjects)
  
  # this call uses dplyr
  tidy_set <- trimmed_set %>% group_by(subject,activity) %>% summarise_each(funs(mean))

  tidy_set
}

tidy_set <- run_analysis()
