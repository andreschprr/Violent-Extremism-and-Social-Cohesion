library(readr)
rm(list = ls())

#######WVS################
wvs <- read_csv("Desktop/wvs_final.csv")

wvs_2groupedby <- wvs %>% 
  group_by(ROUND, COUNTRY) %>%
  summarise_all("mean", na.rm = TRUE)

wvs_3groupedby <- wvs %>% 
  group_by(ROUND) %>%
  summarise_all("mean", na.rm = TRUE)

##########ACLED############
acled_rtm <- read_csv("Desktop/acled_groupedby_round.csv")


#########AFRO##############
afro_rtm <- read_csv("Desktop/afro_scaled_final.csv")

afro_groupedby <- afro_rtm %>% 
  group_by(ROUND, COUNTRY) %>%
  summarise_all("mean", na.rm = TRUE)

write_csv(afro_groupedby, "afro_GBy_ready.csv")

###########################



write_csv(afro_rtm, "afro_rtm_USE.csv")




























