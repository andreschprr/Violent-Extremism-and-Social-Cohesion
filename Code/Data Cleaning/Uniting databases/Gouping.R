

survey_qs <- merge(afro_groupedby, wvs_2groupedby, all.x = TRUE, by = c("ROUND", "COUNTRY"))

survey_qs$VSC_UG <- (survey_qs$VSC_UG1 + survey_qs$VSC_UG2) / 2


survey_qs$VSC_CA <- rowMeans(survey_qs[,c("VSC_CA1","VSC_CA2","VSC_E026","VSC_E026B","VSC_E028B","VSC_G021")], na.rm = TRUE)
survey_qs$VSC_DE <- rowMeans(survey_qs[,c("VSC_DE1","VSC_DE2","VSC_DE3","VSC_E233B")], na.rm = TRUE)
survey_qs$VSC_PP <- rowMeans(survey_qs[,c("VSC_PP1","VSC_PP2","VSC_PP3","VSC_PP4","VSC_PP5")], na.rm = TRUE)
survey_qs$VSC_GQ <- rowMeans(survey_qs[,c("VSC_GQ1","VSC_GQ2","VSC_GQ3","VSC_GQ4","VSC_GQ5","VSC_GQ6","VSC_E069_06","VSC_E069_17")], na.rm = TRUE)
survey_qs$VSC_UG <- rowMeans(survey_qs[,c("VSC_UG1","VSC_UG2")], na.rm = TRUE)
survey_qs$VSC_SP <- rowMeans(survey_qs[,c("VSC_SP1","VSC_SP2")], na.rm = TRUE)

survey_qs$HSC_CI <- rowMeans(survey_qs[,c("HSC_CI1","HSC_CI2","HSC_G020")], na.rm = TRUE)
survey_qs$HSC_CS <- rowMeans(survey_qs[,c("HSC_CS1","HSC_CS2","HSC_A098","HSC_A099","HSC_A100","HSC_A101","HSC_A102","HSC_A103"
                                          ,"HSC_A104","HSC_A105","HSC_A106","HSC_A106B","HSC_A106C")], na.rm = TRUE)
survey_qs$HSC_IM <- rowMeans(survey_qs[,c("HSC_IM2","HSC_IM3","HSC_IM4")], na.rm = TRUE)
survey_qs$HSC_ST <- rowMeans(survey_qs[,c("HSC_A165","HSC_G007_18_B","HSC_G007_35_B","HSC_G007_36_B","HSC_H001")], na.rm = TRUE)


survey_qs$VSC <- rowMeans(survey_qs[,c("VSC_CA","VSC_DE","VSC_PP","VSC_GQ","VSC_UG","VSC_SP")], na.rm = TRUE)
survey_qs$HSC <- rowMeans(survey_qs[,c("HSC_CI","HSC_CS","HSC_IM","HSC_ST")], na.rm = TRUE)


indices <- survey_qs %>%
  select(ROUND, COUNTRY,
         VSC_CA, VSC_DE, VSC_PP, VSC_GQ, VSC_UG, VSC_SP, VSC,
         HSC_CI, HSC_CS, HSC_IM, HSC_ST, HSC,
         VE3, VE4, VE1_PV, VE1_Tens, VE1_Terr, VE1_BH, VE1_all, VE2_pnsh, VE_H007, VE_F114_03)

write_csv(indices, "indices.csv")


  
merged_data <- merge(indices, acled_groupedby_round)


write_csv(merged_data, "merged_data.csv")



write_csv(wvs, "wvs_best.csv")




