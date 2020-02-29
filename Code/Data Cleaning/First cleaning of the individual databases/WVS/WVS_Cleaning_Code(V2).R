


#################################################
#################################################
## Policy Lab                                  ##
## Rebecca Wolfe                               ## 
## Spring 2020                                 ##
## This version: Feb 19, 2020                  ##
## WVS Scaling Code                            ##
## J Betsch                                    ##
#################################################
#################################################

rm(list = ls())

# Load some packages to your library. 
library(tidyverse)

#setwd("~/Downloads/UChi/Policy Lab/WVS Cleaning")
wvs <- readRDS("wvs_complete_data.rds")


# Just keep columns we need
# Each new line is a different kind of value (Labels, VSC, HSC, then VE)
wvs2 <- wvs %>%
  select(S001, S002, S003, S003A, 
         E026, E026B, E028B, E069_06, E069_17, E233B, G021,
         A165, A098, A099, A100, A101, A102, A103, A104, A105, A106B, A106C, A106, G007_18_B, G007_35_B, G007_36_B, H001, G020,
         H007, F114_03)


#Rename variables to include VSC or HSC categorization for easy identification
colnames(wvs2)[5:11] <- paste("VSC_", colnames(wvs2[,c(5:11)]), sep = "") ##'paste' the prefix "VSC_" to every VSC column
colnames(wvs2)[12:28] <- paste("HSC_", colnames(wvs2[,c(12:28)]), sep = "") ##repeat for HSC columns
colnames(wvs2)[29:30] <- paste("VE_", colnames(wvs2[,c(29:30)]), sep = "")

wvs2$S002 <- paste("W",wvs2$S002,sep = "")
wvs2$S003 <- paste("W",wvs2$S003,sep = "")
wvs2$S003A <- paste("W",wvs2$S003A,sep = "")


#remove irrelevant values (i.e. '99= do not know') that would thow off the [0-1] range we want.
wvs2[wvs2 ==-1] <- NA
wvs2[wvs2 ==-2] <- NA
wvs2[wvs2 ==-3] <- NA
wvs2[wvs2 ==-4] <- NA
wvs2[wvs2 ==-5] <- NA

summary(wvs2)
sapply(wvs2, class)

#change class from labelled to integer
wvs2[5:30] <- sapply(wvs2[5:30],as.integer)

#then math time (turning scales into [0,1] standard)
## variables with range (1-#) in group to subtract 1
ones = c("VSC_E026", "VSC_E026B", "VSC_E028B", "VSC_E069_06", "VSC_E069_17", "VSC_E233B", "VSC_G021",
         "HSC_A165", "HSC_G007_18_B", "HSC_G007_35_B", "HSC_G007_36_B", "HSC_H001", "HSC_G020",
         "VE_F114_03")
wvs2[,ones] = wvs2[,ones] - 1

#"flip" reverse-coded variables (higher values in original codebook = low values of SC or VE)
##3 reverse-coded vars (all VSC): VSC_PP5 #9 (0-4), VSC_UG1 #25 (0-3), VSC_UG2 #13 (0-3)
wvs2$VSC_E026B = 4 - wvs2$VSC_E026B
wvs2$VSC_E028B = 4 - wvs2$VSC_E028B
wvs2$VSC_E069_06 = 3 - wvs2$VSC_E069_06
wvs2$VSC_E069_17 = 3 - wvs2$VSC_E069_17
wvs2$VSC_G021 = 3 - wvs2$VSC_G021
wvs2$HSC_G007_18_B = 3 - wvs2$HSC_G007_18_B
wvs2$HSC_G007_35_B = 3 - wvs2$HSC_G007_35_B
wvs2$HSC_G007_36_B = 3 - wvs2$HSC_G007_36_B
wvs2$HSC_H001 = 3 - wvs2$HSC_H001
wvs2$HSC_G020 = 3 - wvs2$HSC_G020

# Time to divide 

div4 = c("VSC_E026B", "VSC_E028B")
wvs2[,div4] = wvs2[,div4]/4

div3 = c("VSC_E069_06", "VSC_E069_17", "VSC_G021",
         "HSC_G007_18_B","HSC_G007_35_B","HSC_G007_36_B","HSC_H001","HSC_G020")
wvs2[,div3] = wvs2[,div3]/3

div2 = c("VSC_E026", 
         "HSC_A098", "HSC_A099","HSC_A100","HSC_A101","HSC_A102","HSC_A103","HSC_A104","HSC_A105","HSC_A106B","HSC_A106C","HSC_A106")
wvs2[,div2] = wvs2[,div2]/2

div9 = c("VSC_E233B", "VE_F114_03")
wvs2[,div9] = wvs2[,div9]/9

summary(wvs2)

# Export as csv file 
write.csv(wvs2,'wvs_merged.csv')



####To give the Country names
WVS_africa_countrycodes <- read_excel("~/Desktop/WVS_africa_countrycodes.xlsx")

wvs3 = merge(wvs2, 
             WVS_africa_countrycodes)


write.csv(wvs3,'wvs_merged_names.csv')















