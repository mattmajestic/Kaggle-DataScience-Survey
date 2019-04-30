

library(DBI)

con <- dbConnect(odbc::odbc(), "PHD_ODBC")

??DBI

#### Kaggle Survey Challenge ####

MJM_Dir <- 'C:\\Users\\Matt\\Desktop\\R_Stuff'

setwd(MJM_Dir)

# Kaggle Survey Data (KS) #
KS <- read.csv("Kaggle_Survey_Time.csv")

names(KS)

library(dplyr)
library(ggplot2)

KS_Time <- KS %>% filter(Time.Cutoff == '0')

names(KS_Time)

table(KS$Q1)
table(KS$Q2)
table(KS$Q4)
table(KS$Q5)
table(KS$Q6)
table(KS$Q7)

#View(KS)

Country_df <- as.data.frame(table(KS_Time$Q3))
names(Country_df) <- c('Country','Freq')


Country_bar <- ggplot(KS_Time,aes(Q3,color = Q3)) + geom_bar(aes(fill = Q3)) + labs(subtitle="Country of Respondents", y="Respondent Count", x="Country", title="Participants by Country", caption = "Source: Kaggle Survey") + theme_bw()+ scale_size(range=c(5,20))+theme(legend.justification=c(1,0), legend.position=c(1,0)) 
library(plotly)
Country_bar_py <- ggplotly(Country_bar)
Country_bar_py

Software_df <- as.data.frame(table(KS_Time$Q12_MULTIPLE_CHOICE))
names(Software_df) <- c('Software','Freq')

Software_bar <- ggplot(KS_Time,aes(Q12_MULTIPLE_CHOICE, color = Q2)) + geom_bar(aes(fill = Q2)) + labs(subtitle=" Used by Data Scienctists", y="Respondent Count", x="Software", title="Popular Software Used by Data Scientists", caption = "Source: Kaggle Survey") + theme_bw()+ scale_size(range=c(5,20))+theme(legend.justification=c(1,0), legend.position=c(1,0)) 
Software_bar_py <- ggplotly(Software_bar)
Software_bar_py

Software_density <- ggplot(KS_Time,aes(Q12_MULTIPLE_CHOICE, color = Q12_MULTIPLE_CHOICE)) + geom_density(aes(fill=factor(Q12_MULTIPLE_CHOICE)))
Software_density_py <- ggplotly(Software_density)
Software_density_py

#View(KS_Time)

Viz_Usage_bar <- ggplot(KS_Time,aes(Q22, color = Q22)) + geom_bar()
Viz_Usage_bar_py <- ggplotly(Viz_Usage_bar)
Viz_Usage_bar_py

library(cowplot)
plot_grid(Viz_Usage_bar, Software_density, labels = c("A", "B"))
