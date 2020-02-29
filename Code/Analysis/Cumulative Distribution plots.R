library(readr)
library(mosaic)

merged_data <- read_csv("merged_data.csv")

ks.test(merged_data$HSC, pnorm,
        alternative = c("two.sided", "less", "greater"),
        exact = NULL)

ks.test(merged_data$Events, pnorm,
        alternative = c("two.sided", "less", "greater"),
        exact = NULL)

ks.test(merged_data$VSC, pnorm,
        alternative = c("two.sided", "less", "greater"),
        exact = NULL)



plot(ecdf(merged_data[merged_data$VE_COUNTRY==1,]$HSC), cex = 0.8, col = (values = "#32CD32"),
     xlab="Horizontal Social Cohesion",
     ylab="Cumulative Proportion",
     main="Distribution of Horizontal Social Cohesion")
lines(ecdf(merged_data[merged_data$VE_COUNTRY==0,]$HSC),
      col= (values = "#8B008B"),  cex = 0.8)
legend('bottomright', 
       legend=c("VE","NonVE"),
       col=c("#32CD32","#8B008B"),
       pch=15)

plot(ecdf(merged_data$HSC), cex = 0.8, col = (values = "#5e6fe6"),
     xlab="Social Cohesion",
     ylab="Cumulative Proportion",
     main="Distribution of Social Cohesion")
lines(ecdf(merged_data$VSC),
      col= (values = "#66cdaa"),  cex = 0.8)
legend('bottomright', 
       legend=c("Horizontal","Vertical"),
       col=c("#5e6fe6","#66cdaa"),
       pch=15)



