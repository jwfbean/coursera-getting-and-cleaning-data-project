# Jeff Bean's submission for the course project for the Coursera "Getting and Cleaning Data" course.

## Contents
**run_analysis.R**: assumed run from a directory containing the UCI smartphone accelerometer data
(https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip). Analysis calculates
the average of the standard deviation and mean metrics reported in the accelerometer data per
activity type per subject. Analysis capitalizes on some key characteristics of the data:

- Row numbers in features.txt match column numbers in X_train.txt and X_test.txt. This allows us to easily 
apply the contents of features.txt as column names in the data set.
- Codes for Activity names in activity_labels.txt match the codes for activity in y_train.txt and y_test.txt. This allows us to easily apply the activity label for the corresponding code.
- x_train and x_test correspond line-by-line as does y_train and y_test. This allows us to easily merge the x and y
data sets as well as the train and test data sets.

###Analysis Analysis does the following:
1.  Reads activity_labels.txt contaiing a text description of the integer activity code field
2.  Reads features.txt containing the name of the feature measured by the integer feature_id. Later used as column names in our analysis.
3.  Reads subject data from test and train datasets
4.  Reads activity codes from test and train datasets
5.  Sets the column labels for activity codes from the contents of activity_labels.txt
6.  Reads the measurements from the test and train data sets
7.  Sets the column labels for the measurements from the features.txt file
8.  Joins the activity codes to the train and test measurements
9.  Applies the activity labels to the train and test measurements
10.  Applies the subject data to the train and test measurements
11.  merges train and test datasets with an rbind operation
12.  grabs the mean and sttdev columns with grep operations on the column names
13.  Calculates the average of the mean and stddev columns storing in the variable called outputz, cuz I'm a putz.

**codebook.md**: Describes variables used in the program and the output

**readme.md**: this file, recursively mentioning itself on the last line.
