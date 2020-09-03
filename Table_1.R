library(shinyWidgets)
library(tidyr)

Q_100 <- read.csv("Questionnaire.csv")
Q_100
#Q_100[,2]
#Q_100[,3:7]

choices <- c("starke Ablehnung" = 1,
             "Ablehnung" = 2,
             "neutral" = 3,
             "Zustimmung" = 4,
             "starke Zustimmung" = 5)


buttons <- list()

for(i in 1:nrow(Q_100)) {
    
     buttons[[i*2-1]] <- radioGroupButtons(inputId = paste0("q",Q_100[i, 1]), 
                                 label = Q_100[i,2],
                                 choices = choices,
                                 individual = TRUE,
                                 selected = character())
     buttons[[i*2]] <- br()
    
}

### Style action buttons

## weiter
style_weiter <- "color: white; 
                 background-color: #01A75A; 
                 position: relative; 
                 left: 1%;
                 height: 33px;
                 width: 65px;
                 text-align:center;
                 text-indent: -2px;
                 border-radius: 1px;
                 border-width: 1px"
## zurück
style_zuruck <- "color: white; 
                 background-color: #222D32"
## zu den Ergebnissen
style_Erg <- "color: white; 
                 background-color: #A7004E; 
                 position: relative; 
                 left: 1%;
                 height: 33px;
                 width: 150px;
                 text-align:center;
                 text-indent: -2px;
                 border-radius: 1px;
                 border-width: 1px"

## used in tabBox
tab_style_color <- tags$style(".nav-tabs {background: #f4f4f4;}
                .nav-tabs-custom .nav-tabs li.active:hover a, 
                .nav-tabs-custom .nav-tabs li.active a {background-color: #fff;
                                                        border-color: #fff;
                                                      }
                .nav-tabs-custom .nav-tabs li.active {border-top-color: 
                                                      #A7004E;
                                                      }"
)




#### Data frame #####
## save the respods to google spreadsheet
  
  # Authorisation
  # gs4_auth() #blumoestit@gmail.com

  # Write a new spreadsheet
# if (exists("ss")) {
#       ss
#   } else {
#    ss <- gs4_create(
#      "ShinyApp_Personality_Survey_responds",
#         sheets = list(trials = data.frame(qn1 = 1, qn2 = 2,	qn3 = 3, qn4 = 4, qn5 = 5, SysTime = Sys.time(),
#                                           first_participation = "test", sex = "test",
#                                           age = "test", education = "test", email = "test")))
#   }



## Pseudo Box Plot
comparison_study <- read.csv("Student_Sample_mean_sd_n1126.csv")
comparison_study$factor <- factor(comparison_study$factor, levels = c("Ehrlichkeit - Demut", "Emotionalität",
                                                                      "Extraversion", "Verträglichkeit",
                                                                      "Gewissenhaftigkeit", "Offenheit für Erfahrungen",
                                                                      "Altruism"))
comparison_study_percentile <- comparison_study %>%
  mutate(perc_10 = qnorm(0.1, mean = total_mean_self, sd = total_sd_self),
         perc_90 = qnorm(0.9, mean = total_mean_self, sd = total_sd_self))

#perc_10 <- qnorm(0.1, mean, sd)
#perc_90 <- qnorm(0.9, mean, sd)

#df_rect <- data.frame(x = c(perc_10, perc_10, perc_90, perc_90))

box_plot <- ggplot(comparison_study_percentile) +
  geom_rect(aes(xmin = perc_10, xmax = perc_90, ymin = 0, ymax = 0.3), fill = "#B6E5CF",  alpha = 0.9) +
  geom_segment(aes(x = total_mean_self, xend = total_mean_self, y = 0, yend = 0.3), linetype = "solid",
               color = "#01A75A", size = 2, alpha = 0.7) +
  geom_point(aes(x = xintercept, y = 0.15), color = "#A7004E", size = 7) +
  facet_wrap(~factor, strip.position = "left", ncol = 1) +
  scale_x_continuous(limits = c(1, 5), position = "top",
                     breaks = seq(1, 5, by = 1)) +
  scale_y_continuous(expand = c(0, 0), limits = c(0, 0.3)) +
  theme_classic() +
  theme(axis.line.x = element_blank(),
        axis.line.y = element_blank(),
        axis.text.x = element_text(size = 22, margin = margin(10, 0, 0, 0, "pt"), face = "bold", color = "#222D32"),
        axis.text.y = element_blank(),
        axis.title.x = element_blank(),#element_text(size = 30, face = "bold", color = "#222D32",
        #hjust = -0.0, vjust = 5.8
        #),
        axis.title.y = element_blank(),
        axis.ticks.length.x = grid::unit(10, "pt"),
        axis.ticks.x = element_blank(),
        axis.ticks.y = element_blank(),
        plot.margin = margin(10, 40, 10, 40, "pt"),
        plot.title = element_text(size = 40, face = "bold.italic", color = "#222D32"),
        panel.background = element_rect(fill = "#ECF0F5"),
        plot.background = element_rect(fill = "#ECF0F5"),
        panel.grid.major.x = element_line(linetype = "solid", size = 0.5, color = "grey"),
        strip.background = element_rect(fill = "#ECF0F5", color = "#ECF0F5"),
        #strip.placement = "outside",
        strip.text.y.left = element_text(angle = 0, size = 16, face = "bold", hjust = 0)
  ) #+
#xlab("Score") +
#ggtitle("Ehrlickeit-Demut")





