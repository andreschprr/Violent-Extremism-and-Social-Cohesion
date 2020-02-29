###############
#script to create 'quadrants' plot of High-Low VSC & HSC by country
#Produces new plot files at end 
#code by Elise Egan, Jennica Betsch, & Lindsey Schafferer; Feb. 25, 2020
###############

setwd("~/Documents/2020/Lab/data") #or wherever it's stored!
rm(list=ls())
library(tidyverse)
#install.packages("data.table")
library(data.table) #for as.data.table
#install.packages("ggrepel")
library(ggrepel) #for plot labels

#import all-rounds afrobarometer dataset
matrix1 <- read_csv("merged_data.csv")

#Create new dataframe 'matrix_agg' with aggregated VSC & HSC variables by country (all time)
matrix_VSC <- as.data.table(matrix1)[, mean(VSC), by = .(COUNTRY)]
colnames(matrix_VSC)[2] <- "VSC"
matrix_HSC <- as.data.table(matrix1)[, mean(HSC), by = .(COUNTRY)]
colnames(matrix_HSC)[2] <- "HSC"
matrix_SC <- cbind(matrix_HSC,matrix_VSC[,2])

#Identify VE and non-VE countries
matrix_SC$is_VE <- ifelse(matrix_SC$COUNTRY %in% c("Cameroon", "Kenya", "Mali", "Mozambique","Niger","Nigeria","Sudan","Tanzania","Uganda"), "VE","non-VE")

#plot 'quadrants' of SC by country
ggplot(matrix_SC, aes(VSC, HSC,
                      label = COUNTRY, 
                      color = factor(is_VE))) +
  ggtitle("Countries by High/Low Social Cohesion") +
  theme(legend.title = element_blank()) +
  geom_jitter() + 
  geom_text_repel() + 
  theme_classic() +
  scale_color_discrete(name="COUNTRY") + 
  scale_color_manual(values =c("#32CD32","#8B008B")) +
  xlim(0.3,0.7) + ylim(0.3,0.7) +
  geom_vline(xintercept = 0.5, linetype = 3)+
  geom_hline(yintercept = 0.5, linetype = 3) +
  annotate("text", label= "LOW, HIGH", x=0.4, y=0.65, size=3) +
  annotate("text", label= "LOW, LOW", x=0.35, y=0.3, size=3) +
  annotate("text", label= "HIGH, HIGH", x=0.6, y=0.65, size=3) +
  annotate("text", label= "HIGH, LOW", x=0.6, y=0.3, size=3)

ggsave("SC_quadrants_all.png", width = 5, height = 5)

#repeat graph with just VE countries
ggplot(subset(matrix_SC, COUNTRY %in% c("Cameroon", "Kenya", "Mali", "Mozambique","Niger","Nigeria","Sudan","Tanzania","Uganda")), 
       aes(VSC, HSC, label = COUNTRY)) +
  ggtitle("VE Countries by High/Low Social Cohesion") +
  geom_jitter() + geom_text_repel() + 
  xlim(0.3,0.7) + ylim(0.3,0.7) +
  geom_vline(xintercept = 0.5, linetype = 3)+
  geom_hline(yintercept = 0.5, linetype = 3) +
  annotate("text", label= "LOW, HIGH", x=0.4, y=0.65, size=3) +
  annotate("text", label= "LOW, LOW", x=0.35, y=0.3, size=3) +
  annotate("text", label= "HIGH, HIGH", x=0.6, y=0.65, size=3) +
  annotate("text", label= "HIGH, LOW", x=0.6, y=0.3, size=3)

ggsave("SC_quadrants_VE.png", width = 5, height = 5)