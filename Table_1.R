library(shinyWidgets)
library(tidyr)
library(ggplot2)
library(dplyr)

#### LOAD QUESTIONNAIRE ####
  Q_100 <- read.csv("Questionnaire.csv")
  Q_100$questions <- as.character(Q_100$questions)
  
#### COLORS ####
  color_lightgreen <- "#75BDD2"   #"#B6E5CF"
  color_darkgreen <- "#007E99"
  color_purple <- "#9C3B68"    #"#91518D"
  color_lightgrey <- "#ECF0F5"
  color_darkgrey <- "#8499B5"
  color_black <- "#222D32"
  
#### ANSWER BUTTON ####
 
   
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
                                   status = "info",
                                   selected = character())
       buttons[[i*2]] <- br()
      
  }
  
  
  
  buttons_fq <- list()
  
  for (j in 1:nrow(Q_FM)) {
  
      buttons_fq[[j]] <- prettyRadioButtons(inputId = paste0("fq",Q_FM[j, 1]),
                                       label = qfm[[j]],
                                       choices = qfm_choices[[paste0("qfm",j)]],
                                       width = '150%',
                                       icon = icon("check"), 
                                       bigger = FALSE,
                                       status = "info",
                                       animation = "jelly",
                                       selected = character())
  
}
  
  
#### STYLE ACTION BUTTONS ####

## weiter
  style_weiter <- "color: white; 
                   font-size: 18px;
                   background-color: #4DBF85; 
                   position: relative; 
                   left: 0%;
                   height: 42px;
                   width: 75px;
                   text-align:center;
                   text-indent: -1px;
                   border-radius: 4px;
                   border-width: 1px"
## zurück
  style_zuruck <- "color: white; 
                   font-size: 18px;
                   height: 42px;
                   width: 75px;
                   border-width: 1px;
                   background-color: #96AFB8"
  ## Test starten
  style_start <- "color: white; 
                   font-size: 18px;
                   background-color: #009DE0; 
                   border-color: #EDFCFF; 
                   position: relative; 
                   left: 35%;
                   height: 42px;
                   width: 180px;
                   text-align:center;
                   text-indent: -2px;
                   box-shadow: 1px 2px #B4C5CC;
                   border-radius: 6px;
                   border-width: 1px"  
  
## zu den Ergebnissen
  style_Erg <- "color: white; 
                    font-size: 18px;
                   background-color: #009DE0; 
                   position: relative; 
                   left: 0%;
                   height: 42px;
                   width: 180px;
                   text-align:center;
                   text-indent: -2px;
                   border-radius: 6px;
                   border-width: 1px"

## used in tabBox
  tab_style_color <- tags$style(".nav-tabs {background: #ECF0F5;}
                                .nav-tabs-custom .nav-tabs li.active:hover a, 
                                .nav-tabs-custom .nav-tabs li.active a {background-color: #fff;
                                                                        border-color: #ECF0F5;
                                                                      }
                                .nav-tabs-custom .nav-tabs li.active {border-top-color: #399FBA;
                                                                      border-color: #399FBA;
                                                                }"
                    )


  
#### Data frame to goole sheets #####
## save the respods to google spreadsheet
  
  # # Authorisation
  # gs4_auth() #blumoestit@gmail.com
  # 
  # # Write a new spreadsheet if does not exist
  # if (exists("ss")) {
  #       ss
  #   } else {
  # 
  #     col <- c()
  #     for (i in 1:100) {
  #       col[i] <- paste0("qn", i)
  #     }
  # 
  #     col1 <- data.frame(col, row1 = seq(1,1,1)) %>%
  #       spread(col, row1) %>%
  #       add_column(first = "test",
  #                  sex = "test",
  #                  age = "test",
  #                  education = "test",
  #                  email = "ema",
  #                  timestamp_1 = Sys.time(),
  #                  timestamp_2 = Sys.time())
  # 
  #    ss <- gs4_create(
  #      "ShinyApp_Personality_Survey_responds",
  #         sheets = list(trials = col1))
  # 
  #    }



#### GGPLOT THEME ####
  
theme_survey <- function(base_size = 11,
                            base_family = "Source Sans Pro",
                            base_line_size = base_size / 170,
                            base_rect_size = base_size / 170){
  theme_classic(base_size = base_size, 
                base_family = base_family,
                base_line_size = base_line_size) %+replace%
    theme(axis.line.x = element_blank(),
          axis.line.y = element_blank(),
          axis.text.x = element_text(size = 18, 
                                     margin = margin(10, 0, 0, 0, "pt"), 
                                     face = "bold", 
                                     color = color_black),
          axis.text.y = element_blank(),
          axis.title.x = element_blank(),#element_text(size = 30, face = "bold", color = "#222D32",
          #hjust = -0.0, vjust = 5.8
          #),
          axis.title.y = element_blank(),
          axis.ticks.length.x = grid::unit(10, "pt"),
          axis.ticks.x = element_blank(),
          axis.ticks.y = element_blank(),
          plot.margin = margin(10, 40, 10, 40, "pt"),
          plot.title = element_text(size = 40, 
                                    face = "bold.italic", 
                                    color = color_black),
          panel.background = element_rect(fill = color_lightgrey, 
                                          color = "white"),
          plot.background = element_rect(fill = color_lightgrey,
                                         color = color_lightgrey),
          panel.grid.major = element_line(linetype = "dotted", 
                                          size = 0.5, 
                                          color = color_darkgrey),
          strip.background = element_rect(fill = color_lightgrey, 
                                          color = color_lightgrey),
          strip.text.y.left = element_text(angle = 0, 
                                           size = 16, 
                                           face = "bold", 
                                           hjust = 0),
          
          complete = TRUE
    )
}




#### PSEUDO BOX PLOT ####

  comparison_study <- read.csv("Student_Sample_mean_sd_n1126.csv")
  comparison_study$Factor <- factor(comparison_study$Factor, levels = c("Ehrlichkeit - Demut", "Emotionalität",
                                                                        "Extraversion", "Verträglichkeit",
                                                                        "Gewissenhaftigkeit", "Offenheit für Erfahrungen",
                                                                        "Altruism"))
  comparison_study_percentile <- comparison_study %>%
    mutate(perc_10 = qnorm(0.1, mean = total_mean_self, sd = total_sd_self),
           perc_90 = qnorm(0.9, mean = total_mean_self, sd = total_sd_self),
           max_point_y = dnorm(x = total_mean_self, mean = total_mean_self, sd = total_sd_self))
  
  

  box_plot <- ggplot(comparison_study_percentile) +
                geom_rect(aes(xmin = perc_10, # green rectangle from 10 to 90 percentile
                              xmax = perc_90, 
                              ymin = 0, 
                              ymax = 0.3), 
                          fill = color_lightgreen,  
                          alpha = 0.9) +
                geom_segment(aes(x = total_mean_self, # vertical green - mean
                                 xend = total_mean_self, 
                                 y = 0, 
                                 yend = 0.3), 
                             linetype = "solid",
                             color = color_darkgreen, 
                             size = 1.5, 
                             alpha = 0.9) +
                # geom_point(aes(x = xintercept, # the responder's mean value
                #                y = 0.15), 
                #            color = color_purple, 
                #            size = 7) +
                facet_wrap(~Factor, strip.position = "left", 
                           ncol = 1) +
                scale_x_continuous(limits = c(1, 5), 
                                   position = "top",
                                   breaks = seq(1, 5, by = 1)) +
                scale_y_continuous(expand = c(0, 0), 
                                   limits = c(0, 0.3)) +
                theme_survey() +
                  theme(panel.grid.major.y = element_blank())


  

  
#### NORMAL DISTRINUTION PLOT ####
  # mean <- 3.19
  # sd <- 0.62
  # xintercept <- 2.82
  # # y <- dnorm(mean, mean, sd)
  # # y
  # 
  # perc_10 <- qnorm(0.1, mean, sd)
  # perc_90 <- qnorm(0.9, mean, sd)
  # perc_10
  # perc_90
  

dnorm_ggplot <- function(total_mean_self, total_sd_self, max_point_y, mean_response) {
  
  ggplot(data = data.frame(x = c(1, 5)), aes(x)) +
    stat_function(fun = dnorm, # dnorm curve
                  n = 1126, 
                  args = list(mean = total_mean_self, 
                  sd = total_sd_self), 
                  size = 2, 
                  color = color_darkgreen) +
    geom_segment(aes(x = total_mean_self, # mean line
                     xend = total_mean_self, 
                     y = 0, 
                     yend = max_point_y), 
                 linetype = "dashed", 
                 color = color_darkgreen, 
                 size = 1.5, 
                 alpha = 0.7) +
    scale_x_continuous(expand = c(0.05, 0.1, 0.05, 0.05), 
                       limits = c(0.8, 5.5), 
                       breaks = seq(1, 5, by = 1)) +
    scale_y_continuous(expand = c(0.02, 0, 0, 0.05)) +
    theme_survey() +
    theme(panel.grid.major.y = element_blank(),
          plot.margin = margin(10, 5, 10, 10, "pt")) + 
    geom_text(aes(x = total_mean_self, 
                  y = max_point_y+0.05, 
                  label = "Mittelwert der Vergleichsgruppe"),
                  size = 6, 
                  color = color_darkgreen) +
    xlab("Score")
}
  
  # dnorm_ggplot_1 <- dnorm_ggplot(comparison_study_percentile$total_mean_self[[1]], comparison_study_percentile$total_sd_self[[1]], 
  #                                comparison_study_percentile$max_point_y[[1]], comparison_study_percentile$mean_response[[1]])
  
  dnorm_ggplot_1 <- dnorm_ggplot(
    comparison_study_percentile$total_mean_self[comparison_study_percentile$Factor == "Ehrlichkeit - Demut"],
    comparison_study_percentile$total_sd_self[comparison_study_percentile$Factor == "Ehrlichkeit - Demut"],
    comparison_study_percentile$max_point_y[comparison_study_percentile$Factor == "Ehrlichkeit - Demut"],
    comparison_study_percentile$mean_response[comparison_study_percentile$Factor == "Ehrlichkeit - Demut"]
  )
  
  dnorm_ggplot_2 <- dnorm_ggplot(
    comparison_study_percentile$total_mean_self[comparison_study_percentile$Factor == "Emotionalität"],
    comparison_study_percentile$total_sd_self[comparison_study_percentile$Factor == "Emotionalität"],
    comparison_study_percentile$max_point_y[comparison_study_percentile$Factor == "Emotionalität"],
    comparison_study_percentile$mean_response[comparison_study_percentile$Factor == "Emotionalität"]
  )
  
  dnorm_ggplot_3 <- dnorm_ggplot(
    comparison_study_percentile$total_mean_self[comparison_study_percentile$Factor == "Extraversion"],
    comparison_study_percentile$total_sd_self[comparison_study_percentile$Factor == "Extraversion"],
    comparison_study_percentile$max_point_y[comparison_study_percentile$Factor == "Extraversion"],
    comparison_study_percentile$mean_response[comparison_study_percentile$Factor == "Extraversion"]
  )
  
  dnorm_ggplot_4 <- dnorm_ggplot(
    comparison_study_percentile$total_mean_self[comparison_study_percentile$Factor == "Verträglichkeit"],
    comparison_study_percentile$total_sd_self[comparison_study_percentile$Factor == "Verträglichkeit"],
    comparison_study_percentile$max_point_y[comparison_study_percentile$Factor == "Verträglichkeit"],
    comparison_study_percentile$mean_response[comparison_study_percentile$Factor == "Verträglichkeit"]
  )
  
  dnorm_ggplot_5 <- dnorm_ggplot(
    comparison_study_percentile$total_mean_self[comparison_study_percentile$Factor == "Gewissenhaftigkeit"],
    comparison_study_percentile$total_sd_self[comparison_study_percentile$Factor == "Gewissenhaftigkeit"],
    comparison_study_percentile$max_point_y[comparison_study_percentile$Factor == "Gewissenhaftigkeit"],
    comparison_study_percentile$mean_response[comparison_study_percentile$Factor == "Gewissenhaftigkeit"]
  )
  
  dnorm_ggplot_6 <- dnorm_ggplot(
    comparison_study_percentile$total_mean_self[comparison_study_percentile$Factor == "Offenheit für Erfahrungen"],
    comparison_study_percentile$total_sd_self[comparison_study_percentile$Factor == "Offenheit für Erfahrungen"],
    comparison_study_percentile$max_point_y[comparison_study_percentile$Factor == "Offenheit für Erfahrungen"],
    comparison_study_percentile$mean_response[comparison_study_percentile$Factor == "Offenheit für Erfahrungen"]
  )
  
  dnorm_ggplot_7 <- dnorm_ggplot(
    comparison_study_percentile$total_mean_self[comparison_study_percentile$Factor == "Altruism"],
    comparison_study_percentile$total_sd_self[comparison_study_percentile$Factor == "Altruism"],
    comparison_study_percentile$max_point_y[comparison_study_percentile$Factor == "Altruism"],
    comparison_study_percentile$mean_response[comparison_study_percentile$Factor == "Altruism"]
  )
  
  
  
  
  
  
  
  
  
    
  