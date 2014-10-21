CleanDataProject
================

Getting and Cleaning Data Course Project
========================================

Course project deliverables for the Coursera course [Getting and Cleaning Data](https://www.coursera.org/course/getdata)

## Installation
* Create a directory for this project, henceforth called `CleanDataProject`
* Download the script `run_analysis.R` to `CleanDataProject` 
* Download the raw data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip to `CleanDataProject` and unzip it. 

  Your directory structure should look like this now (only shown 2 levels deep):
 
 ```
    ├── UCI HAR Dataset
    │   ├── README.txt
    │   ├── activity_labels.txt
    │   ├── features.txt
    │   ├── features_info.txt
    │   ├── test
    │   └── train
    └── run_analysis.R
```

## Dependencies
The script `run_analysis.R` depends on the libraries `plyr` and `reshape2`. If you have not installed them, you must install them before running this analysis script.
    
## Running the analysis     
* Change the working directory in R to the installation directory (called `CleanDataProject` in the [Installation](#Installation) section).     
* Source the script `run_analysis.R` in R: `source("run_analysis.R")`
* A table will be written to UCI HAR Dataset directory now: `tidy_data.txt` 

## Codebook
Information about the datasets is provided in `CodeBook.md`.     

## Code 
The code contains detailed commments explaining the steps in which the original data was transformed to `tidy_data.txt` 
