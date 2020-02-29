###################################
#Consolidating Afrobarometer DBs
#Andres Chaparro
#02/14/2020
###################################


library(data.table)
library(haven)

#Loading Data from SPSS Format

merged_r1_data <- read_sav("Documents/UChicago/5th Quarter/Policy Lab/UNDP/Data/Afrobarometer/merged_r1_data.sav")
merged_r2_data <- read_sav("Documents/UChicago/5th Quarter/Policy Lab/UNDP/Data/Afrobarometer/merged_r2_data.sav")
merged_r3_data <- read_sav("Documents/UChicago/5th Quarter/Policy Lab/UNDP/Data/Afrobarometer/merged_r3_data.sav")
merged_r4_data <- read_sav("Documents/UChicago/5th Quarter/Policy Lab/UNDP/Data/Afrobarometer/merged_r4_data.sav")
merged_r5_data <- read_sav("Documents/UChicago/5th Quarter/Policy Lab/UNDP/Data/Afrobarometer/merged-round-5-data-34-countries-2011-2013-last-update-july-2015.sav")
merged_r6_data <- read_sav("Documents/UChicago/5th Quarter/Policy Lab/UNDP/Data/Afrobarometer/merged_r6_data_2016_36countries2.sav")
merged_r7_data <- read_sav("Documents/UChicago/5th Quarter/Policy Lab/UNDP/Data/Afrobarometer/r7_merged_data_34ctry.release.sav")

###########################
#Getting each round ready
###########################


#######ROUND 1#############

#First column of the dataset
final_r1_data <- merged_r1_data[,1]

##Extract only the columns we are using
#Name the columns that we want to extract. These are the question we are using
keepsr1 <- c("refnumb", "country","area","scint","scdsc","pfrele","parctg","pardem","pfgpre","pfgmp","pfgloc","pfrfai","memrel","memdev","parcom","pariss","mip1")
final_r1_data <- merged_r1_data[keepsr1]

#Change names of columns to Standardize ones. Included in the Indicator Calculator document
setnames(final_r1_data, old = c("refnumb", "country","area", "scint","scdsc","pfrele","parctg","pardem","pfgpre","pfgmp","pfgloc","pfrfai","memrel","memdev","parcom","pariss","mip1"), new = c("ID_INT", "COUNTRY","REGION", "CA1","CA2","DE1","PP1","PP5","GQ3","GQ4","GQ5","UG3","CS1","CS2","CI1","CI2","VE1"))

##Creating missing columns
#Add missing columns. These columns are for questions that didn't appear that year but that we need to add for the final merging of the datasets
missing_col_names_r1 <- c("ROUND", "YEAR","DISTRICT","PP2","PP3","PP4","SP1","SP2","UG1","DE2","DE3","GQ1","GQ2","GQ6","IM1","IM2","IM3","IM4","VE2","VE3","VE4")

#Create a dataframe with the column names but that is empty
missing_cols_r1 <- data.frame(matrix(ncol = length(missing_col_names_r1), nrow = nrow(final_r1_data)))
colnames(missing_cols_r1) <- missing_col_names_r1

##Binding the final dataset
#Bind the original dataset and add the extra columns for data we don't have
final_r1_data <- cbind(final_r1_data, missing_cols_r1)

#Name the round
final_r1_data$ROUND = 1

write.csv(final_r1_data, 'AR1_data_final.csv')


#######ROUND 2#############


final_r2_data <- merged_r2_data[,1]

keepsr2 <- c("respno", "country","region","q44pt1","q25e","q76","q24a","q24d","q25b","q25c","q27","q25a","q29a","q28b","q29c","q29d","q29f","q29e","q25d","q41d","q50b","q48a","q48b","q48d","q56")
final_r2_data <- merged_r2_data[keepsr2]

setnames(final_r2_data, old = c("respno", "country","region", "q44pt1","q25e","q76","q24a","q24d","q25b","q25c","q27","q25a","q29a","q28b","q29c","q29d","q29f","q29e","q25d","q41d","q50b","q48a","q48b","q48d","q56"), new = c("ID_INT", "COUNTRY","REGION", "VE1","VE3","VE4","CS1","CS2","CI1","CI2","CA1","CA2","PP1","PP2","PP3","PP4","SP1","SP2","PP5","UG1","DE2","GQ3","GQ4","GQ5","UG3"))

missing_col_names_r2 <- c("ROUND", "YEAR","VE2","IM1","IM2","IM3","IM4","DE1","DE3","GQ1","GQ2","GQ6","DISTRICT")

missing_cols_r2 <- data.frame(matrix(ncol = length(missing_col_names_r2), nrow = nrow(final_r2_data)))
colnames(missing_cols_r2) <- missing_col_names_r2

final_r2_data <- cbind(final_r2_data, missing_cols_r2)

final_r2_data$ROUND = 2

write.csv(final_r2_data, 'AR2_data_final.csv')


#######ROUND 3#############

final_r3_data <- merged_r3_data[,1]

keepsr3 <- c("respno", "country","region","district","q63pt1","q51","q28a","q28d","q31a","q31b","q16","q17","q45","q32a","q32b","q32c","q32d","q32e","q32f","q31c","q53d","q62a","q62b","q67a","q68a","q68b","q68c","q81")
final_r3_data <- merged_r3_data[keepsr3]

setnames(final_r3_data, old = c("respno", "country","region","district","q63pt1","q51","q28a","q28d","q31a","q31b","q16","q17","q45","q32a","q32b","q32c","q32d","q32e","q32f","q31c","q53d","q62a","q62b","q67a","q68a","q68b","q68c","q81"), new = c("ID_INT", "COUNTRY","REGION","DISTRICT","VE1","VE4","CS1","CS2","CI1","CI2","CA1","CA2","DE1","PP1","PP2","PP3","PP4","SP1","SP2","PP5","UG1","DE2","DE3","GQ1","GQ3","GQ4","GQ5","UG3"))

missing_col_names_r3 <- c("ROUND", "YEAR","VE2","VE3","IM1","IM2","IM3","IM4","GQ2","GQ6")

missing_cols_r3 <- data.frame(matrix(ncol = length(missing_col_names_r3), nrow = nrow(final_r3_data)))
colnames(missing_cols_r3) <- missing_col_names_r3

final_r3_data <- cbind(final_r3_data, missing_cols_r3)

final_r3_data$ROUND = 3

write.csv(final_r3_data, 'AR3_data_final.csv')


#######ROUND 4#############


final_r4_data <- merged_r4_data[,1]

keepsr4 <- c("RESPNO", "COUNTRY","REGION","DISTRICT","Q56PT1","Q22A","Q22B","Q23A","Q23B","Q13","Q14","Q71","Q25A","Q25B","Q25C","Q27B","Q27A","Q23C","Q45C","Q54A","Q54B","Q59A","Q59B","Q70A","Q70B","Q70C","Q82")
final_r4_data <- merged_r4_data[keepsr4]

setnames(final_r4_data, old = c("RESPNO", "COUNTRY","REGION","DISTRICT", "Q56PT1","Q22A","Q22B","Q23A","Q23B","Q13","Q14","Q71","Q25A","Q25B","Q25C","Q27B","Q27A","Q23C","Q45C","Q54A","Q54B","Q59A","Q59B","Q70A","Q70B","Q70C","Q82"), new = c("ID_INT", "COUNTRY","REGION","DISTRICT", "VE1","CS1","CS2","CI1","CI2","CA1","CA2","DE1","PP1","PP2","PP3","SP1","SP2","PP5","UG1","DE2","DE3","GQ1","GQ2","GQ3","GQ4","GQ5","UG3"))

missing_col_names_r4 <- c("ROUND", "YEAR","VE2","VE3","VE4","IM1","IM2","IM3","IM4","PP4","GQ6")

missing_cols_r4 <- data.frame(matrix(ncol = length(missing_col_names_r4), nrow = nrow(final_r4_data)))
colnames(missing_cols_r4) <- missing_col_names_r4

final_r4_data <- cbind(final_r4_data, missing_cols_r4)

final_r4_data$ROUND = 4

write.csv(final_r4_data, 'AR4_data_final.csv')


#######ROUND 5#############


final_r5_data <- merged_r5_data[,1]

keepsr5 <- c("RESPNO", "COUNTRY","REGION","Q63PT1","Q26E","Q78","Q25A","Q25B","Q26A","Q26B","Q14","Q15","Q28","Q30A","Q30B","Q30C","Q30D","Q26D","Q56B","Q62A","Q62B","Q66A","Q66B","Q71A","Q71B","Q71C","Q85A")
final_r5_data <- merged_r5_data[keepsr5]

setnames(final_r5_data, old = c("RESPNO", "COUNTRY","REGION","Q63PT1","Q26E","Q78","Q25A","Q25B","Q26A","Q26B","Q14","Q15","Q28","Q30A","Q30B","Q30C","Q30D","Q26D","Q56B","Q62A","Q62B","Q66A","Q66B","Q71A","Q71B","Q71C","Q85A"), new = c("ID_INT", "COUNTRY","REGION","VE1","VE3","VE4","CS1","CS2","CI1","CI2","CA1","CA2","DE1","PP1","PP2","PP3","PP4","PP5","UG1","DE2","DE3","GQ1","GQ2","GQ3","GQ4","GQ5","UG3"))

missing_col_names_r5 <- c("ROUND", "YEAR","DISTRICT","VE2","IM1","IM2","IM3","IM4","SP1","SP2","GQ6")

missing_cols_r5 <- data.frame(matrix(ncol = length(missing_col_names_r5), nrow = nrow(final_r5_data)))
colnames(missing_cols_r5) <- missing_col_names_r5

final_r5_data <- cbind(final_r5_data, missing_cols_r5)

final_r5_data$ROUND = 5

write.csv(final_r5_data, 'AR5_data_final.csv')


#######ROUND 6#############

final_r6_data <- merged_r6_data[,1]

keepsr6 <- c("RESPNO", "COUNTRY","REGION","LOCATION.LEVEL.1","Q60PT1","Q71B","Q19A","Q19B","Q20A","Q20B","Q76","Q89A","Q89B","Q89E","Q13","Q14","Q22","Q24A","Q24B","Q24C","Q24D","Q24E","Q24F","Q27E","Q51B","Q59A","Q59B","Q67A","Q67B","Q68A","Q68B","Q68C","Q68D","Q88A")
final_r6_data <- merged_r6_data[keepsr6]

setnames(final_r6_data, old = c("RESPNO", "COUNTRY","REGION","LOCATION.LEVEL.1","Q60PT1","Q71B","Q19A","Q19B","Q20A","Q20B","Q76","Q89A","Q89B","Q89E","Q13","Q14","Q22","Q24A","Q24B","Q24C","Q24D","Q24E","Q24F","Q27E","Q51B","Q59A","Q59B","Q67A","Q67B","Q68A","Q68B","Q68C","Q68D","Q88A"), new = c("ID_INT", "COUNTRY","REGION","DISTRICT","VE1","VE2","CS1","CS2","CI1","CI2","IM1","IM2","IM3","IM4","CA1","CA2","DE1","PP1","PP2","PP3","PP4","SP1","SP2","PP5","UG1","DE2","DE3","GQ1","GQ2","GQ3","GQ4","GQ5","GQ6","UG3"))

missing_col_names_r6 <- c("ROUND", "YEAR","VE3","VE4")

missing_cols_r6 <- data.frame(matrix(ncol = length(missing_col_names_r6), nrow = nrow(final_r6_data)))
colnames(missing_cols_r6) <- missing_col_names_r6

final_r6_data <- cbind(final_r6_data, missing_cols_r6)

final_r6_data$ROUND = 6

write.csv(final_r6_data, 'AR6_data_final.csv')

#######ROUND 7#############

final_r7_data <- merged_r7_data[,1]

keepsr7 <- c("RESPNO", "COUNTRY","REGION","LOCATION.LEVEL.1","Q13","Q23","Q25A","Q25B","Q25C","Q25D","Q25E","Q25F","Q26E","Q54A","Q54B","Q58A","Q58B","Q58C","Q58D","Q85A","Q20A","Q20B","Q21A","Q21B","Q87A","Q87B","Q87D","Q55PT1")
final_r7_data <- merged_r7_data[keepsr7]

setnames(final_r7_data, old = c("RESPNO", "COUNTRY","REGION","LOCATION.LEVEL.1","Q13","Q23","Q25A","Q25B","Q25C","Q25D","Q25E","Q25F","Q26E","Q54A","Q54B","Q58A","Q58B","Q58C","Q58D","Q85A","Q20A","Q20B","Q21A","Q21B","Q87A","Q87B","Q87D","Q55PT1"), new = c("ID_INT", "COUNTRY","REGION","DISTRICT","CA2","DE1","PP1","PP2","PP3","PP4","SP1","SP2","PP5","DE2","DE3","GQ3","GQ4","GQ5","GQ6","UG3","CS1","CS2","CI1","CI2","IM2","IM3","IM4","VE1"))

missing_col_names_r7 <- c("ROUND", "YEAR","CA1","UG1","GQ1","GQ2","IM1","VE2","VE3","VE4")

missing_cols_r7 <- data.frame(matrix(ncol = length(missing_col_names_r7), nrow = nrow(final_r7_data)))
colnames(missing_cols_r7) <- missing_col_names_r7

final_r7_data <- cbind(final_r7_data, missing_cols_r7)

final_r7_data$ROUND = 7

write.csv(final_r7_data, 'AR7_data_final.csv')


###########################
#Uniting all the databases
###########################


merged_afro_data <- rbind(final_r1_data,final_r2_data,final_r3_data,final_r4_data,final_r5_data,final_r6_data,final_r7_data)
setnames(merged_afro_data, old = "UG3", new = "UG2")

write.csv(merged_afro_data, 'merged_afro_data.csv')




























