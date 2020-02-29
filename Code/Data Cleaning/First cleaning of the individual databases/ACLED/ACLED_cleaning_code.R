###########################
# 60000 Policy Lab UNDP
# Cleaning of ACLED data
# Hanvit Park
# 02/16/2020
###########################

library(readr)
library(dplyr)

# Load data
ACLED <- read.csv("C:/Users/Hanvit Park/OneDrive/Classes/6_2020 Winter/PPHA_60000/UNDP_PVE/datacleaning/data/Africa_1997-2020_Feb08.csv")
str(ACLED)

### Country Selection ###

# subset nine countries to use for analysis
A9 <- subset(ACLED, COUNTRY =="Cameroon"|COUNTRY =="Kenya"|COUNTRY =="Mali"|COUNTRY =="Mozambique"|
               COUNTRY =="Niger"|COUNTRY =="Nigeria"|COUNTRY =="Sudan"|COUNTRY =="Tanzania"|COUNTRY =="Uganda")

### Row Selection ###

# retains only rows that satisfy our conditions for analysis
A9 <- A9 %>%
  filter(INTER1 == "2"|INTER1 =="4") %>% # VE actors
  filter(SUB_EVENT_TYPE == "Armed clash"|SUB_EVENT_TYPE == "Attack"|SUB_EVENT_TYPE == "Abduction/forced disappearance"|
           SUB_EVENT_TYPE == "Remote explosive/landmine/IED"|SUB_EVENT_TYPE == "Suicide bomb"|
           SUB_EVENT_TYPE == "Shelling/artillery/missile attack"|SUB_EVENT_TYPE == "Non-state actor overtakes territory"|
           SUB_EVENT_TYPE == "Grenade"|SUB_EVENT_TYPE == "Chemical weapon") # VE events


