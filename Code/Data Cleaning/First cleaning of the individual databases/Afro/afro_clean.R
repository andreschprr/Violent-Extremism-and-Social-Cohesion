###############
#script to clean & modify Afrobarometer Data from Rounds 1-7 for SC & VE analysis
#all survey variables scaled (0-1) and positively correlated with HSC, VSC, or VE
#Produces new data file "afro_scaled.csv" at end 
#code by Elise Egan and Jennica Betsch; Feb. 16, 2020
###############

setwd("~/Documents/2020/Lab/data") #or wherever it's stored!
rm(list=ls())
library(tidyverse)
#install.packages("lessR") #if you don't already have lessR
library(lessR) #for Transform

#import all-rounds afrobarometer dataset
afro <- read_csv("merged_afro_data.csv")

#removing variables: x1,ID_INT,IM1
afro <- afro[,-c(1,2,34)]

#survey categorization columns 1-2 coded as integers. Change to factors:
afro[1:2] <- sapply(afro[1:2],as.factor)

#survey data columns 20-36 coded as characters. Change to integer:
afro[21:38] <- sapply(afro[21:38],as.integer)

#create binaries: VE1 (4 vars:25,26,35,620; 3 columns merge), VE2 (1 var:9)
afro$VE1_PV = as.integer((afro$VE1_1==25) | (afro$VE1_2==25) | (afro$VE1_3 == 25))
afro$VE1_Tens = as.integer((afro$VE1_1==26) | (afro$VE1_2==26) | (afro$VE1_3 == 26))
afro$VE1_Terr = as.integer((afro$VE1_1==35) | (afro$VE1_2==35) | (afro$VE1_3 == 35))
afro$VE1_BH = as.integer((afro$VE1_1==620) | (afro$VE1_2==620) | (afro$VE1_3 == 620))

#create one (0-1) scale VE1 variable of all 4 components (respondents could only select up to 3 options)
afro$VE1_all = rowSums(afro[,c(39:42)], na.rm = T)/3 

afro$VE2_pnsh = as.integer(afro$VE2 == 9)

#then delete original VE1 (_1, _2, _3) and VE2 cols
afro2 <- afro[, -c(16,17,35,36)]

#verify all variables are the class we want (integer if a survey question, character if descriptive)
summary(afro2)

#remove irrelevant values (i.e. '99= do not know') that would thow off the [0-1] range we want.
afro2[afro2 ==-1] <- NA
afro2[afro2 ==6] <- NA #only if ROUND is in "R1" form and not numbers (1)
afro2[afro2 ==7] <- NA #only if ROUND is in "R1" form and not numbers (1)
afro2[afro2 ==8] <- NA
afro2[afro2 ==9] <- NA
afro2[afro2 ==97] <- NA
afro2[afro2 ==98] <- NA
afro2[afro2 ==99] <- NA
afro2[afro2 ==998] <- NA
afro2[afro2 ==9995] <- NA
afro2[afro2 ==9998] <- NA
afro2[afro2 ==9999] <- NA
  
#Rename variables to include VSC or HSC categorization for easy identification
colnames(afro2)[3:11] <- paste("VSC_", colnames(afro2[,c(3:11)]), sep = "") ##'paste' the prefix "VSC_" to every VSC column
colnames(afro2)[19:29] <- paste("VSC_", colnames(afro2[,c(19:29)]), sep = "")
colnames(afro2)[12:15] <- paste("HSC_", colnames(afro2[,c(12:15)]), sep = "") ##repeat for HSC columns
colnames(afro2)[30:32] <- paste("HSC_", colnames(afro2[,c(30:32)]), sep = "")

#"flip" reverse-coded variables (higher values in original codebook = low values of SC or VE)
  ##3 reverse-coded vars (all VSC): VSC_PP5 #9 (0-4), VSC_UG1 #25 (0-3), VSC_UG2 #13 (0-3)
afro2$VSC_UG1 = 3 - afro2$VSC_UG1
afro2$VSC_UG2 = 3 - afro2$VSC_UG2
afro2$VSC_PP5 = 4 - afro2$VSC_PP5

#MATH TIME (turning scales into [0,1] standard)
  ## variables with range (1-#) in group to subtract 1. Divide by highest number in range to create (0,1) scale
  afro2$HSC_IM2 = (afro2$HSC_IM2 - 1)/4 #all IMs are (0-4). To normalize to (0,1) scale, divide by 4
  afro2$HSC_IM3 = (afro2$HSC_IM3 - 1)/4
  afro2$HSC_IM4 = (afro2$HSC_IM4 - 1)/4
  
  afro2$VSC_GQ1 = (afro2$VSC_GQ1 - 1)/3 #all GQs are (0-3). To normalize to (0,1) scale, divide by 3
  afro2$VSC_GQ2 = (afro2$VSC_GQ2 - 1)/3
  afro2$VSC_GQ3 = (afro2$VSC_GQ3 - 1)/3
  afro2$VSC_GQ4 = (afro2$VSC_GQ4 - 1)/3
  afro2$VSC_GQ5 = (afro2$VSC_GQ5 - 1)/3
  afro2$VSC_GQ6 = (afro2$VSC_GQ6 - 1)/3
  
  afro2$VSC_DE1 = (afro2$VSC_DE1 - 1)/3
  
  afro2$VE4 = (afro2$VE4 - 1)/4

  ## Remaining variables with range (0-4) to be divided by 4 --> [0,1]
  afro2$VE3 = afro2$VE3/4
  
  afro2$HSC_CI1 = afro2$HSC_CI1/4
  afro2$HSC_CI2 = afro2$HSC_CI2/4
  
  afro2$VSC_PP5 = afro2$VSC_PP5/4
  
  #remove other 5 and 4 values (previous round NAs)
  afro2[afro2 ==5] <- NA
  afro2[afro2 ==4] <- NA
  
  ## repeat process for variables remaining in (0-3) range
  afro2$VSC_CA1 = afro2$VSC_CA1/3
  
  afro2$VSC_DE2 = afro2$VSC_DE2/3
  afro2$VSC_DE3 = afro2$VSC_DE3/3
  
  afro2$VSC_PP1 = afro2$VSC_PP1/3
  afro2$VSC_PP2 = afro2$VSC_PP2/3
  afro2$VSC_PP3 = afro2$VSC_PP3/3
  afro2$VSC_PP4 = afro2$VSC_PP4/3
  
  afro2$VSC_SP1 = afro2$VSC_SP1/3
  afro2$VSC_SP2 = afro2$VSC_SP2/3
  
  afro2$VSC_UG1 = afro2$VSC_UG1/3
  afro2$VSC_UG2 = afro2$VSC_UG2/3
  
  afro2$HSC_CS1 = afro2$HSC_CS1/3
  afro2$HSC_CS2 = afro2$HSC_CS2/3

  ## Round 2 of CA2 is (0-3), should be normalized to (0-2) to match remaining rounds, then divide by 2
  afro2$VSC_CA2_norm = ifelse(afro2$ROUND=="R2", afro2$VSC_CA2/3, afro2$VSC_CA2/2)
  #afro2 <- afro2[,-c("VSC_CA2")]
  afro2$VSC_CA2 = afro2$VSC_CA2_norm #rename as VSC_CA2
  #afro2 <- afro2[, -c("VSC_CA2_norm")] #delete VSC_CA2_norm variable

#verify all survey data variables in (0-1) range
summary(afro2)

#save .csv file & upload to GDrive with this script
write.csv(afro2,'afro_scaled.csv') #uncomment to save new data file