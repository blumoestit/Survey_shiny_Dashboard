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

### Data frame
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

