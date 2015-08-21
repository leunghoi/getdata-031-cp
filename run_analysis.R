getwd()
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",
                destfile = "FUCI HAR Dataset.zip")
#data <- read.table(unz("FUCI HAR Dataset.zip", exdir="./"))
unzip("FUCI HAR Dataset.zip")

features <- read.fwf("./UCI HAR Dataset/features.txt", widths = c(3, 38))



sub_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
names(sub_train) <- c("subject")

y_train_set <- read.table("./UCI HAR Dataset/train/Y_train.txt")
names(y_train_set) <- c("y")

x_train <- read.fwf(file="./UCI HAR Dataset/train/X_train.txt", 
                   widths = rep(16, 561))
names(x_train) <- features[,2]

var_type <- rep("train", dim(y_train_set)[1])

train_data <- cbind(var_type, y_train_set, sub_train, x_train)
head(train_data[,1:10])




sub_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
names(sub_test) <- c("subject")

y_test_set <- read.table("./UCI HAR Dataset/test/Y_test.txt")
names(y_test_set) <- c("y")

x_test <- read.fwf(file="./UCI HAR Dataset/test/X_test.txt", 
                   widths = rep(16, 561))
names(x_test) <- features[,2]

var_type <- rep("test", dim(y_test_set)[1])

test_data <- cbind(var_type, y_test_set, sub_test, x_test)
head(test_data[,1:10])


combined <- rbind(train_data, test_data)


col_index <- c(1, 2, 3, grep("mean()", features[,2]) + 3, 
               grep("std()", features[,2]) + 3)
col_index <- col_index[order(col_index)]

combined <- combined[, col_index]
dim(combined)
head(combined)




s <- split(combined, combined$subject)
mean_by_sub <- sapply(s, function(x) { lapply(x[, 4:82], mean) } )
mean_by_sub <- t(mean_by_sub)
mean_by_sub <- cbind(row.names(mean_by_sub), mean_by_sub)
colnames(mean_by_sub)[1] <- c("subject")
head(mean_by_sub)

write.table(mean_by_sub, file = "./mean_by_sub.txt", append = FALSE)


#name_list <- colnames(mean_by_sub)
#mean_by_sub <- data.frame(mean_by_sub)
#names(mean_by_sub) <- c(name_list)
#mean_by_sub$subject <- row.names(mean_by_sub)


#dim(mean_by_sub)
#name_list
