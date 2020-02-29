#################################################
#################################################
## Policy Lab                                  ##
## Rebecca Wolfe                               ## 
## Spring 2020                                 ##
## This version: Feb 17, 2020                  ##
## WVS Scaling Code                            ##
## J Betsch                                    ##
#################################################
#################################################


# Load some packages to your library. 

library(foreign)
library(ggplot2)
library(jtools)
library(tidyverse)


setwd("~/Downloads/UChi/Policy Lab/WVS Cleaning")
wvs <- readRDS("WV6_data.rds")

library(dplyr) # to select certain cols to keep based on name

# Just keep columns we need
# Each new line is a different kind of value (Labels, VSC, HSC, then VE)
wvs2 <- wvs %>%
  select(V1:V3, 
         V86, V91, V93, V113, V114, V138, V214,
         V24, V25, V26, V27, V28, V29, V30, V31, V32, V33, V34, V35, V103, V106, V107, V170, V213,
         V187, V210)

#Rename variables to include VSC or HSC categorization for easy identification
colnames(wvs2)[5:11] <- paste("VSC_", colnames(wvs2[,c(5:11)]), sep = "") ##'paste' the prefix "VSC_" to every VSC column
colnames(wvs2)[12:28] <- paste("HSC_", colnames(wvs2[,c(12:28)]), sep = "") ##repeat for HSC columns
colnames(wvs2)[29:30] <- paste("VE_", colnames(wvs2[,c(29:30)]), sep = "")


#remove irrelevant values (i.e. '99= do not know') that would thow off the [0-1] range we want.
wvs2[wvs2 ==-1] <- NA
wvs2[wvs2 ==-2] <- NA
wvs2[wvs2 ==-3] <- NA
wvs2[wvs2 ==-4] <- NA
wvs2[wvs2 ==-5] <- NA

summary(wvs2)
sapply(wvs2, class)

#change class from labelled to integer
library(labelled)
wvs2[5:30] <- sapply(wvs2[5:30],as.integer)

#then math time (turning scales into [0,1] standard)
## variables with range (1-#) in group to subtract 1
ones = c("VSC_V86", "VSC_V91", "VSC_V93", "VSC_V113", "VSC_V114", "VSC_V138", "VSC_V214",
         "HSC_V24", "HSC_V103", "HSC_V106", "HSC_V107", "HSC_V170", "HSC_V213", 
         "VE_V187", "VE_V210")
wvs2[,ones] = wvs2[,ones] - 1

#"flip" reverse-coded variables (higher values in original codebook = low values of SC or VE)
##3 reverse-coded vars (all VSC): VSC_PP5 #9 (0-4), VSC_UG1 #25 (0-3), VSC_UG2 #13 (0-3)
wvs2$VSC_V91 = 4 - wvs2$VSC_V91
wvs2$VSC_V93 = 4 - wvs2$VSC_V93
wvs2$VSC_V113 = 3 - wvs2$VSC_V113
wvs2$VSC_V114 = 3 - wvs2$VSC_V114
wvs2$VSC_V214 = 3 - wvs2$VSC_V214
wvs2$HSC_V103 = 3 - wvs2$HSC_V103
wvs2$HSC_V106 = 3 - wvs2$HSC_V106
wvs2$HSC_V107 = 3 - wvs2$HSC_V107
wvs2$HSC_V170 = 3 - wvs2$HSC_V170
wvs2$HSC_V213 = 3 - wvs2$HSC_V213

# Time to divide 

div4 = c("VSC_V91", "VSC_V93")
wvs2[,div4] = wvs2[,div4]/4

div3 = c("VSC_V113", "VSC_V114", "VSC_V214",
         "HSC_V103","HSC_V106","HSC_V107","HSC_V170","HSC_V213")
wvs2[,div3] = wvs2[,div3]/3

div2 = c("VSC_V86", 
         "HSC_V25", "HSC_V26","HSC_V27","HSC_V28","HSC_V29","HSC_V30","HSC_V31","HSC_V32","HSC_V33","HSC_V34","HSC_V35")
wvs2[,div2] = wvs2[,div2]/2

div9 = c("VSC_V138", "VE_V210")
wvs2[,div9] = wvs2[,div9]/9

summary(wvs2)

# Create binaries and delete original rows for HSC_V24 and VE_V187
wvs2$VE1_PV = as.integer(wvs2$VE1 == 25)

# Export as csv file 
write.csv(wvs2,'wvs_scaled.csv')
wvs3 <- read_csv("wvs_scaled.csv")
summary(afro3)































