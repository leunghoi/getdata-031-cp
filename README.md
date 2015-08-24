# getdata-031-cp
class project for get and cleaning data

step 1: download and unzip the datasets in the working directory

step 2: read the feastures list / variable names

step 3: read the 3 train datasets into dataframes, name all the columns, and combine the 3 dataframs into one dataframe.

step 3: read the 3 test datasets into dataframes, name all the columns, and combine the 3 dataframes into one dataframe.

step 4: combine the train and test dataframes into one dataframe using rbind.

step 5: get the column indexes of all the fields where the name contains "mean()" or "std()".

step 6: keep only the fields with the indexes in step 5.

step 7: calculate the means of each field by subject.
