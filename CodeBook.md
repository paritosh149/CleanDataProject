This Code Book explains about the variables and data I've used to combine data sets.


``` features_cleaned ``` is the data frame where the features are read after cleaning up features.txt
``` f_names ``` is the vector containing the names of features extracted from data frame feature

``` varnames ``` vector of variables of combined data.

``` X_train ``` Loaded X_train.txt file.

``` X_test ``` Loaded X_test.txt file.

``` X_train_test ``` Combined X train test with rbind.

``` subject_train ``` Loaded subject train file.

``` subject_test ``` Loaded subject test file.

``` subject_train_test ``` Combined subject train test with rbind.

``` y_train ``` Loaded Y_train.txt file.

``` y_test ``` Loaded Y_test.txt file.

``` y_train_test ``` Combined Y train test with rbind.

``` combined_df ``` Binding the datasets got columnwise

``` selected_df ``` Extracting the variables needed from the combined data frame.

``` fdf.melt ``` Melted data frames using subject and actlabel ids.

``` fdf.cast ``` Final tidy data set.