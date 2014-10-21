library(reshape2)

features_cleaned <- read.table("features.txt",stringsAsFactors=FALSE)
f_names <- features_cleaned[,2]
varnames <- append(features_cleaned[,2],c("Subject","Activity"))

X_train <- read.table("train/X_train.txt",stringsAsFactors=FALSE)
X_test <- read.table("test/X_test.txt",stringsAsFactors=FALSE)
X_train_test <- rbind(X_train,X_test)

subject_train <- read.table("train/subject_train.txt", stringsAsFactors=FALSE)
subject_test <- read.table("test/subject_test.txt", stringsAsFactors=FALSE)
subject_train_test <- rbind(subject_train,subject_test)

y_train <- read.table("train/y_train.txt", stringsAsFactors=FALSE)
y_test <- read.table("test/y_test.txt", stringsAsFactors=FALSE)
y_train_test <- rbind(y_train,y_test)

combined_df <- cbind(X_train_test,subject_train_test, y_train_test)
names(combined_df) <- varnames

selected_df <- combined_df[,c(1,2,3,4,5,6,41,42,43,44,45,46,559,560,561,562,563)]

selected_df$actlabel <- "Unset"
selected_df$actlabel[selected_df$Activity==1] <- "Walking"
selected_df$actlabel[selected_df$Activity==2] <- "wALKING_UPSTAIRS"
selected_df$actlabel[selected_df$Activity==3] <- "wALKING_DOWNSTAIRS"
selected_df$actlabel[selected_df$Activity==4] <- "SITTING"
selected_df$actlabel[selected_df$Activity==5] <- "STANDING"
selected_df$actlabel[selected_df$Activity==6] <- "LAYING"

names(selected_df) <- gsub("Acc","Acceleration",names(selected_df))
names(selected_df) <- gsub("std","StandardDeviation",names(selected_df))
names(selected_df) <- tolower(names(selected_df))

names(selected_df) <- gsub("tbody","tbody.", names(selected_df))
names(selected_df) <- gsub("x",".x", names(selected_df))
names(selected_df) <- gsub("y",".y", names(selected_df))
names(selected_df) <- gsub("z",".z", names(selected_df))
names(selected_df) <- gsub("acceleration","acceleration.", names(selected_df))

names(selected_df) <- gsub("activit.y","activity", names(selected_df))
names(selected_df) <- gsub("tbod.y","tbody", names(selected_df))
names(selected_df) <- gsub("tgravit.y","tgravity", names(selected_df))
names(selected_df) <- gsub("angle.xgravit.ymean","angle.x.gravity.mean", names(selected_df))
names(selected_df) <- gsub("angle.ygravit.ymean","angle.y.gravity.mean", names(selected_df))
names(selected_df) <- gsub("angle.zgravit.ymean","angle.z.gravity.mean", names(selected_df))
names(selected_df) <- gsub("tgravityacceleration","tgravity.acceleration", names(selected_df))

fdf.melt <- melt(selected_df, id=c("subject","actlabel"))

fdf.cast <- dcast(fdf.melt, subject+actlabel ~ variable,mean)
write.table(file="tidy_data.txt",x=fdf.cast)