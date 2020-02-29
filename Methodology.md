# Methodology

## Cleaning the data
For cleaning the data we first need to clean each dataset individually and then merge them into one file 

### Cleaning ACLED data
Use ACLED_Cleaning_Code.R to get rid of countries and events we are not going to work on
Use 'Adding actor filters to ACLED.R' to get the list of actors Violent Extremist actors
Note: If choosing another region, the actor list will need to be checked again. 
We are using mostly actor types 2 and 4 of the ACLED database but made individual changes if the actor doesn't 
fit the definition of Violent Extremist


### Cleaning Afrobarometer data
Use 'Consolidating Afrobarometer DBs.R' to paste together the seven existing rounds of Afrobarometer data and align questions
Continue cleaning Afrobarometer data with the Afro_clean.R code. This will put all the questions in a scale from 0 to 1

### Cleaning WVS data
Use WVS_Cleaning_Code.R to eliminate countries and questions we are not interested in. 
Also it will put all the questions in a scale from 0 to 1

### Merging the datasets
Final formating details in each database can be found in 'Formatting DBs to merge.R' including grouping the dataset by year/round
Use Grouping.R to finally merge the dataset and create the indices and subindices


## Analysis

### Quadrant to map each country on a grid of VSC-HSC
Use Quadrants.R to map each country on a grid of VSC-HSC and color them according to whether they are VE or NonVE countries

### Regressions to test the correlations between Social Cohesion and Violent Extremism
Use Regressions.Rmd to test correlations. This document will need to be adapted depending on which relations are significant
Usually the first three regressions from each section will always apply and from there it is about choosing what is important
to explore further

### T-test of difference of means between VE and Non-VE countries
Ttest.R
Tests all variables to see if the means from VE and Non-VE countries differ

### Kolmogorov-Smirnov test and Cumulative Distribution Plots
Cumulative Distribution plots
KS test to see if our distributions are normal or not



