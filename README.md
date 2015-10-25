Project - Getting and Cleaning Data
=========================================================

The repo contains three files: 1. README.txt (this file, where there is a summary of everithing
done in this project, which databases where used, transformations, etc.), 2. run_analysis.R (code
used to process the data provided, transform variables and datasets, and produce the final
database requested by the instructors), 3. FinalData.txt (Final dataset as requested)

=========================================================

What is developed in the code?

The code particularly processes the following files in order to merge the Train and Test data:

"./UCI HAR Dataset/features.txt" (includes all the variable names included in the dataset with the exception of the
firs and second columns of the FinalData.txt file ("Activity" and "Subject"))

"./UCI HAR Dataset/test/X_test.txt" = Test data
"./UCI HAR Dataset/test/y_test.txt" = Activity test data
"./UCI HAR Dataset/test/subject_test.txt" = Subject test data

"./UCI HAR Dataset/train/X_train.txt" = Train data
"./UCI HAR Dataset/train/y_train.txt" = Activity train data
"./UCI HAR Dataset/train/subject_train.txt" = Subject train data

The these datasets where merged in one single dataset using the rbind and cbind functions.
Any problem with the use of special characters in the column names was also addressed in the
code.

In the end, using the dplyr and the plyr packages the extraction of the varibles with information
about the mean and std of the observations was conducted. In the same way, the final calculation
of the mean by subject and activity was conducted by using the summarize_each function of
the dplyr package.

Finally, the final dataset was exported to the "./FinalData.txt" file.