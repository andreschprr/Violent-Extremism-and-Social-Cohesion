library(rdd)
library(ggrepel)
library(data.table)
library(broom)
library(ggpubr)
library(jtools)
library(huxtable)
library(readr)
library(plm)
library(mosaic)
library(tidyverse)
library(knitr)
library(corrplot)
library(reshape2)
library(gplots)
library(viridis)


merged_data <- read_csv("~/merged_data031012.csv")
lol <- read_csv("lol.csv")
merged_data22 <- merged_data
merged_dataVE <- merged_data[merged_data$VE_COUNTRY == 1,]
supermerged_dataVE <- merged_data[merged_data$Events > 10,]
merged_dataVE1 <- merged_data[,c("COUNTRY", "VE1_all", "VSC_UG")]


listVSC <- c("VSC", "VSC_CA", "VSC_DE", "VSC_PP", "VSC_SP", "VSC_GQ", "VSC_UG")
listHSC <- c("HSC", "HSC_CI", "HSC_CS", "HSC_IM")
listVEV <- c("Events", "VE1_all", "VE3", "VE4")
listSC <- c("HSC", "VSC")

##############################

ggplot(merged_data, aes(VSC_UG, VE1_all,
                        label = COUNTRY, 
                        color = factor(VE_COUNTRY))) +
  ggtitle("Perception of VE and Vertical Social Cohesion") +
  geom_lm(col="black", linetype = "dashed") + 
  geom_jitter() + 
  theme(legend.box.just = "right", legend.justification = c("right")) +
  guides(fill=guide_legend(title=NULL)) +
  scale_color_discrete(name="COUNTRY", labels=c("VE", "Comparison")) + 
  scale_color_manual(values =c("#32CD32","#8B008B"))


ggplot(merged_data, aes(HSC_CS, VE1_all,
                        label = COUNTRY, 
                        color = factor(VE_COUNTRY))) +
  ggtitle("Perception of VE and Vertical Social Cohesion") +
  geom_lm(col="black", linetype = "dashed") + 
  geom_jitter() + 
  theme(legend.box.just = "right", legend.justification = c("right")) +
  guides(fill=guide_legend(title=NULL)) +
  scale_color_discrete(name="COUNTRY", labels=c("VE", "Comparison")) + 
  scale_color_manual(values =c("#32CD32","#8B008B"))

##############################


ggplot(merged_data, aes(VSC, VE3,
                        label = COUNTRY, 
                        color = factor(VE_COUNTRY))) +
  ggtitle("Perception of VE and Vertical Social Cohesion") +
  geom_lm(col="black", linetype = "dashed") + 
  geom_jitter() + 
  theme(legend.box.just = "right", legend.justification = c("right")) +
  guides(fill=guide_legend(title=NULL)) +
  scale_color_discrete(name="COUNTRY", labels=c("VE", "Comparison")) + 
  scale_color_manual(values =c("#32CD32","#8B008B"))

ggplot(merged_data, aes(VSC, VE4,
                        label = COUNTRY, 
                        color = factor(VE_COUNTRY))) +
  ggtitle("Perception of VE and Vertical Social Cohesion") +
  geom_lm(col="black", linetype = "dashed") + 
  geom_jitter() + 
  theme(legend.box.just = "right", legend.justification = c("right")) +
  guides(fill=guide_legend(title=NULL)) +
  scale_color_discrete(name="COUNTRY", labels=c("VE", "Comparison")) + 
  scale_color_manual(values =c("#32CD32","#8B008B"))

ggplot(merged_data, aes(HSC, VE3,
                        label = COUNTRY, 
                        color = factor(VE_COUNTRY))) +
  ggtitle("Perception of VE and Vertical Social Cohesion") +
  geom_lm(col="black", linetype = "dashed") + 
  geom_jitter() + 
  theme(legend.box.just = "right", legend.justification = c("right")) +
  guides(fill=guide_legend(title=NULL)) +
  scale_color_discrete(name="COUNTRY", labels=c("VE", "Comparison")) + 
  scale_color_manual(values =c("#32CD32","#8B008B"))

ggplot(merged_data, aes(HSC, VE4,
                        label = COUNTRY, 
                        color = factor(VE_COUNTRY))) +
  ggtitle("Perception of VE and Vertical Social Cohesion") +
  geom_lm(col="black", linetype = "dashed") + 
  geom_jitter() + 
  theme(legend.box.just = "right", legend.justification = c("right")) +
  guides(fill=guide_legend(title=NULL)) +
  scale_color_discrete(name="COUNTRY", labels=c("VE", "Comparison")) + 
  scale_color_manual(values =c("#32CD32","#8B008B"))

##############################



ggplot(merged_data, aes(VSC_GQ, VE3,
                        label = COUNTRY, 
                        color = factor(VE_COUNTRY))) +
  ggtitle("Perception of VE and Vertical Social Cohesion") +
  geom_lm(col="black", linetype = "dashed") + 
  geom_jitter() + 
  theme(legend.box.just = "right", legend.justification = c("right")) +
  guides(fill=guide_legend(title=NULL)) +
  scale_color_discrete(name="COUNTRY", labels=c("VE", "Comparison")) + 
  scale_color_manual(values =c("#32CD32","#8B008B"))

ggplot(merged_data, aes(HSC_CI, VE3,
                        label = COUNTRY, 
                        color = factor(VE_COUNTRY))) +
  ggtitle("Perception of VE and Vertical Social Cohesion") +
  geom_lm(col="black", linetype = "dashed") + 
  geom_jitter() + 
  theme(legend.box.just = "right", legend.justification = c("right")) +
  guides(fill=guide_legend(title=NULL)) +
  scale_color_discrete(name="COUNTRY", labels=c("VE", "Comparison")) + 
  scale_color_manual(values =c("#32CD32","#8B008B"))


##############################



ggplot(merged_data, aes(VSC_SP, VE4,
                        label = COUNTRY, 
                        color = factor(VE_COUNTRY))) +
  ggtitle("Perception of VE and Vertical Social Cohesion") +
  geom_lm(col="black", linetype = "dashed") + 
  geom_jitter() + 
  theme(legend.box.just = "right", legend.justification = c("right")) +
  guides(fill=guide_legend(title=NULL)) +
  scale_color_discrete(name="COUNTRY", labels=c("VE", "Comparison")) + 
  scale_color_manual(values =c("#32CD32","#8B008B"))

ggplot(merged_data, aes(HSC_CS, VE4,
                        label = COUNTRY, 
                        color = factor(VE_COUNTRY))) +
  ggtitle("Perception of VE and Vertical Social Cohesion") +
  geom_lm(col="black", linetype = "dashed") + 
  geom_jitter() + 
  theme(legend.box.just = "right", legend.justification = c("right")) +
  guides(fill=guide_legend(title=NULL)) +
  scale_color_discrete(name="COUNTRY", labels=c("VE", "Comparison")) + 
  scale_color_manual(values =c("#32CD32","#8B008B"))


############################