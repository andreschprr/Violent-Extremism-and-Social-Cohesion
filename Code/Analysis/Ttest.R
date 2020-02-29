rm(list = ls())
merged_data <- read.csv("C:/Users/Hanvit Park/OneDrive/Classes/6_2020 Winter/PPHA_60000/UNDP_PVE/datacleaning/data/merged_data.csv")

library(tidyverse)

lapply(merged_data[,c("HSC", "HSC_CI", "HSC_CS","HSC_IM","HSC_ST")], function(x) t.test(x ~ merged_data$VE_COUNTRY, var.equal = TRUE))
lapply(merged_data[,c("VSC", "VSC_CA", "VSC_DE","VSC_PP","VSC_GQ","VSC_UG","VSC_SP")], function(x) t.test(x ~ merged_data$VE_COUNTRY, var.equal = TRUE))
lapply(merged_data[,c("VE3","VE4")], function(x) t.test(x ~ merged_data$VE_COUNTRY, var.equal = TRUE))

merged_data <- merged_data %>%
        filter(COUNTRY != "Sudan")
t.test(Events ~ VE_COUNTRY,
       data = merged_data, paried = FALSE)


#########################################################################################################

# HSC
HSC <- t.test(HSC ~ VE_COUNTRY,
       data = merged_data, paired = FALSE)
CI <- t.test(HSC_CI ~ VE_COUNTRY,
       data = merged_data, paired = FALSE)
CS <- t.test(HSC_CS ~ VE_COUNTRY,
       data = merged_data, paired = FALSE)
IM <- t.test(HSC_IM ~ VE_COUNTRY,
       data = merged_data, paired = FALSE)
ST <- t.test(HSC_ST ~ VE_COUNTRY,
       data = merged_data, paired = FALSE)

Index <- c("HSC", "HSC_CI", "HSC_CS", "HSC_IM", "HSC_ST")
statistic <- c(HSC$statistic, CI$statistic, CS$statistic, IM$statistic, ST$statistic)
statistic <- round(statistic,2)
P_value <- c(HSC$p.value, CI$p.value, CS$p.value, IM$p.value, ST$p.value)
P_value <- round(P_value,2)
Method <- c(HSC$method, CI$method, CS$method, IM$method, ST$method)
Variables <- cbind(Indicator = Index, statistic, P_value, Method)

Variables

# VSC
VSC <- t.test(VSC ~ VE_COUNTRY,
              data = merged_data, paired = FALSE)
CA <- t.test(VSC_CA ~ VE_COUNTRY,
              data = merged_data, paired = FALSE)
DE <- t.test(VSC_DE ~ VE_COUNTRY,
             data = merged_data, paired = FALSE)
PP <- t.test(VSC_PP ~ VE_COUNTRY,
             data = merged_data, paired = FALSE)
GQ <- t.test(VSC_GQ ~ VE_COUNTRY,
             data = merged_data, paired = FALSE)
UG <- t.test(VSC_UG ~ VE_COUNTRY,
             data = merged_data, paired = FALSE)
SP <- t.test(VSC_SP ~ VE_COUNTRY,
             data = merged_data, paired = FALSE)

Index1 <- c("VSC", "VSC_CA", "VSC_DE", "VSC_PP", "VSC_GQ", "VSC_UG","VSC_SP")
statistic1 <- c(VSC$statistic, CA$statistic, DE$statistic, PP$statistic, GQ$statistic, UG$statistic, SP$statistic)
statistic1 <- round(statistic1,2)
P_value1 <- c(VSC$p.value, CA$p.value, DE$p.value, PP$p.value, GQ$p.value, UG$p.value, SP$p.value)
P_value1 <- round(P_value1,2)
Method1 <- c(VSC$method, CA$method, DE$method, PP$method, GQ$method, UG$method, SP$method)

Variables1 <- cbind(Indicator = Index1, statistic1, P_value1, Method1)
Variables1



