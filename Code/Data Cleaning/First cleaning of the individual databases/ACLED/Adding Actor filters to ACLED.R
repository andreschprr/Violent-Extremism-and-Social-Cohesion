library(dplyr)

acled_data <- read_csv("~/Downloads/ACLED Africa data_Normalfilters.csv")
actor_list <- read_csv("~/Desktop/actor_acled.csv")


acled_with_codenames = merge(acled_data[, c("year", "event_type", "sub_event_type","actor1", "inter1", "country", "admin1")], 
                  actor_list[, c("Unique Code", "Include","Actor Name", "Country")],
                  by.x = c("actor1", "country"), by.y = c("Actor Name", "Country"))


acled_filt_actors <- filter(acled_with_codenames, Include == 1)
acled_filt_actors$Include = NULL

write.csv(acled_filt_actors, "acled_finalfilters.csv")