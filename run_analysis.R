#download the data
file <- download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip","dataset.zip");
unzipped <- unzip("./dataset.zip", exdir = "./data", overwrite = TRUE );

labelsActivity <- read.table("./data/UCI HAR Dataset/activity_labels.txt");
featureLabels <- read.table("./data/UCI HAR Dataset/features.txt");

#create test set
testY <- read.table("./data/UCI HAR Dataset/test/y_test.txt", col.names=c("Activity"));
testSubject <- read.table("./data/UCI HAR Dataset/test/subject_test.txt", col.names=c("Subject")); 
testX <- read.table("./data/UCI HAR Dataset/test/X_test.txt", col.names=featureLabels$V2);

df1 <- data.frame( testY, testSubject, testX );

#create training set
trainY <- read.table("./data/UCI HAR Dataset/train/y_train.txt", col.names=c("Activity"));
trainSubject <- read.table("./data/UCI HAR Dataset/train/subject_train.txt", col.names=c("Subject")); 
trainX <- read.table("./data/UCI HAR Dataset/train/X_train.txt", col.names=featureLabels$V2);

df2 <- data.frame( trainY, trainSubject, trainX );

#merge data set
df <- data.frame( rbind(df1,df2) )

#extract mean and std
meanMeas <- grep("mean",names(df));
stdMeas  <- grep("std",names(df));
selectedCol <- c( 1,2, meanMeas, stdMeas );
df <- df[,selectedCol];

# factor levels
df$Subject <- as.factor(df$Subject);
df$Activity <- as.factor(df$Activity);
levels(df$Activity)<-labelsActivity$V2; 

#rename columns
colnames(df) <- gsub("\\.mean\\.\\.\\.","Mean", colnames(df));
colnames(df) <- gsub("\\.std\\.\\.\\.","Std", colnames(df));
colnames(df) <- gsub("\\.std\\.\\.","Std", colnames(df));
colnames(df) <- gsub("\\.mean\\.\\.","Mean", colnames(df));
colnames(df) <- gsub("\\.meanFreq\\.\\.\\.\\.","MeanFreq", colnames(df));
colnames(df) <- gsub("\\.meanFreq\\.\\.\\.","MeanFreq", colnames(df));
colnames(df) <- gsub("\\.meanFreq\\.\\.","MeanFreq", colnames(df));

dfMean <- aggregate( . ~ Subject + Activity, data = df, FUN= "mean" );
write.table(dfMean, "dataset-final.txt", row.name=FALSE)


