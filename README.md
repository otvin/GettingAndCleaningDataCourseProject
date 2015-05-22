# Course Project for Getting and Cleaning Data

## Contents of Repository
In this GitHub repo, there are three files:
* README.md - this file
* CodeBook.md - the Code Book describing the data
* run_analysis.R - the R script for processing the data and generating the tidy data set

## Dependencies
This code requires the `dplyr` library to be installed.  Please run `install.packages("dplyr")` prior to executing this script.

## Assumptions
This code assumes that R working directory contains a copy of the "Samsung" data set.  Full citation for this data:

Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. A Public Domain Dataset for Human Activity Recognition Using Smartphones. 21th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning, ESANN 2013. Bruges, Belgium 24-26 April 2013.
URL: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

This code was tested on the version of this data that was available at the below URL as of May 13, 2015
URL: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

## Script Execution

1. Download the aforementioned zip file, and unzip it on your local machine.  All the data are located in the zip in a folder named `UCI HAR Dataset`.
2. Set the working directory in R (or RStudio) to the folder which contains `UCI HAR Dataset`.  This can be done via the `setwd()` command.
3. Download and then execute the `run_analysis.R` script via the `source()` command.  If you place the `run_analysis.R` script in the same directory as the `UCI HAR Dataset` folder, the command would be `source("run_analysis.R")`.
4. The script creates a variable tidy_set contianing 180 observations of the 68 variables (subject, activity, and the 66 features being averaged).  You can manipulate this as you see fit.  If you are running RStudio, you can do `View(tidy_set)` to see the data (verified in RStudio version0.98.1103 on Windows 7 and Ubuntu Linux 15.04).
 
## Script Output

The output of this script is a tidy data set which looks at all activities performed in both the test and training sets combined, looks at the measurements that involved mean and standard deviation only, and then averaged the mean and standard deviation for each activity for each participant.  The tidy data set which is output has 180 observations, corresponding to the averages for each of the 6 activities for each of the 30 participants.  The data set conforms to the definition of tidy by ensuring that:
* each variable is a column - the variables here are the acitivities, the participants, and the 66 other variables described in the attached code book.
* each observation is a row - the observations are the averages for each participant for each activity

See: http://vita.had.co.nz/papers/tidy-data.pdf for definition of tidy data

## Viewing a copy of the output 

To view the data that I generated on my PC using this script and these instructions on May 22, 2015, you could execute the following from RStudio (I used RStudio version 0.98.1103 on both Ubuntu Linux and Windows 7 Enterprise)

`data <- read.table(url("http://s3.amazonaws.com/coursera-uploads/user-15b5014833b7da4089901b16/973501/asst-3/8573723000be11e599dd0b67c8885217.txt"), header = TRUE)`

`View(data)`




