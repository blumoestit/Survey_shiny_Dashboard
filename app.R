
library(shiny)
library(shinydashboard)
library(shinyWidgets)
library(DT)
library(tidyr)
library(dplyr)
library(tibble)
library(googlesheets4)

#### source ####
source('Text_1.R')
source("Table_1.R")


#### google auth ####
gs4_auth(path = ".secrets/dogwood-boulder-283009-f84cf0d697c8.json")

ss <- gs4_get('https://docs.google.com/spreadsheets/d/12F4vDtIjgKbo1xrFxAAXIquk7o72dc6NfX5bHP-lnMY/edit#gid=990841242')


#### tag style ####
tags$style(HTML(".checkbox-inline, .radio-inline {
    margin-right: 100px;
}"))



#### header ####
header <- dashboardHeader(title = "Persönlichkeitstest"#,
                          #dropdownMenu(type = "messages")
)


#### sidebar ####
sidebar <- dashboardSidebar(
    sidebarMenu(id = "tabs",
        menuItem(text = "Home",
                 tabName = "HomeTab",
                 icon = icon('home')
        ),
        menuItem(text = "Der Test",
                 tabName = "DerTestTab",
                 icon = icon('check-square')),
        # menuItem(text = "Test",
        #          tabName = "TestTab",
        #          icon = icon('check-square'),
        #          # menuSubItem(text = "Fragen 1-10",
        #          #             tabName = "q1-10"
        #          # ),
        #          # menuSubItem(text = "Fragen 11-20",
        #          #             tabName = "q11-20"
        #          # ),
        #          menuSubItem(text = "Fragen 21-30",
        #                      tabName = "q21-30"
        #          ),
        #          menuSubItem(text = "Fragen 31-40",
        #                      tabName = "q31-40"
        #          ),
        #          menuSubItem(text = "Fragen 41-50",
        #                      tabName = "q41-50"
        #          ),
        #          menuSubItem(text = "Fragen 51-60",
        #                        tabName = "q51-60"
        #          ),
        #          menuSubItem(text = "Fragen 61-70",
        #                      tabName = "q61-70"
        #          ),
        #          menuSubItem(text = "Fragen 71-80",
        #                      tabName = "q71-80"
        #          ),
        #          menuSubItem(text = "Fragen 81-90",
        #                      tabName = "q81-90"
        #          ),
        #          menuSubItem(text = "Fragen 91-100",
        #                      tabName = "q91-100"
        #          ),
        #          menuSubItem(text = "Für Statistik",
        #                      tabName = "demographic"
        #          )
        # ),
        menuItem(text = "Ergebnisse",
                 tabName = "ErgTab",
                 icon = icon('poll')
        ),
        menuItem(text = "Beschreibung",
                 tabName = "BeschTab",
                 icon = icon('poll-h')
        )
    )
)



#### body ####
body <- dashboardBody(
    tabItems(
      
  #### HOME #####
          tabItem(
              tabName = "HomeTab",
              h1("Hier kommen Informationen über die Studie und den Persönlichkeitstest"),
              fluidRow(
                column(width = 2),
                column(width = 8,
                box(width = NULL,
              h1("Persönlichkeitstest"), 
              h3(text1_t),
              p(text1), 
              hr(),
              actionButton(inputId = "startTest",
                           label = "Test starten",
                           style = style_Erg
                           )
                    )
                  )
              )
          ),
          
  #### DER TEST ####
          tabItem(tabName = "DerTestTab",
                  h2("Der 100-Fragen Persönlichkeitstest"),
                  fixedRow(
                    tab_style_color, # defined in 'Table_1.R'
                    tabItem(tabName = "null", column(width = 1)),
                    tabBox(width = 10, id = "tabBoxTest",
                        tabPanel(value = "q1-10",
                          title = "Fragen 1-10",
                          h2("Inwieweit treffen die folgenden Aussagen auf Sie zu?"),
                          hr(),buttons[1:20],#Survey Questins sourced from Table_1.R
                          actionButton('jumpToP2', 'weiter', style = style_weiter)
                       ),
                       tabPanel(value = "q11-20",
                         title = "Fragen 11-20",
                         h2("Inwieweit treffen die folgenden Aussagen auf Sie zu?"),
                         hr(),
                         buttons[21:40],
                         actionButton('jumpbackToP1', 'zurück', style = style_zuruck),
                         actionButton('jumpToP3', 'weiter', style = style_weiter)
                       ),
                       tabPanel(value = "q21-30",
                                title = "Fragen 21-30",
                                h2("Inwieweit treffen die folgenden Aussagen auf Sie zu?"),
                                hr(),
                                buttons[41:60],
                                actionButton('jumpbackToP2', 'zurück', style = style_zuruck),
                                actionButton('jumpToP4', 'weiter', style = style_weiter)
                       ),
                       tabPanel(value = "q31-40",
                                title = "Fragen 31-40",
                                h2("Inwieweit treffen die folgenden Aussagen auf Sie zu?"),
                                hr(),
                                buttons[61:80],
                                actionButton('jumpbackToP3', 'zurück', style = style_zuruck),
                                actionButton('jumpToP5', 'weiter', style = style_weiter)
                       ),
                       tabPanel(value = "q41-50",
                                title = "Fragen 41-50",
                                h2("Inwieweit treffen die folgenden Aussagen auf Sie zu?"),
                                hr(),
                                buttons[81:100],
                                actionButton('jumpbackToP4', 'zurück', style = style_zuruck),
                                actionButton('jumpToP6', 'weiter', style = style_weiter)
                       ),
                       tabPanel(value = "q51-60",
                                title = "Fragen 51-60",
                                h2("Inwieweit treffen die folgenden Aussagen auf Sie zu?"),
                                hr(),
                                buttons[101:120],
                                actionButton('jumpbackToP5', 'zurück', style = style_zuruck),
                                actionButton('jumpToP7', 'weiter', style = style_weiter)
                       ),
                       tabPanel(value = "q61-70",
                                title = "Fragen 61-70",
                                h2("Inwieweit treffen die folgenden Aussagen auf Sie zu?"),
                                hr(),
                                buttons[121:140],
                                actionButton('jumpbackToP6', 'zurück', style = style_zuruck),
                                actionButton('jumpToP8', 'weiter', style = style_weiter)
                       ),
                       tabPanel(value = "q71-80",
                                title = "Fragen 71-80",
                                h2("Inwieweit treffen die folgenden Aussagen auf Sie zu?"),
                                hr(),
                                buttons[141:160],
                                actionButton('jumpbackToP7', 'zurück', style = style_zuruck),
                                actionButton('jumpToP9', 'weiter', style = style_weiter)
                       ),
                       tabPanel(value = "q81-90",
                                title = "Fragen 81-90",
                                h2("Inwieweit treffen die folgenden Aussagen auf Sie zu?"),
                                hr(),
                                buttons[161:180],
                                actionButton('jumpbackToP8', 'zurück', style = style_zuruck),
                                actionButton('jumpToP10', 'weiter', style = style_weiter)
                       ),
                       tabPanel(value = "q91-100",
                                title = "Fragen 91-100",
                                h2("Inwieweit treffen die folgenden Aussagen auf Sie zu?"),
                                hr(),
                                buttons[181:200],
                                actionButton('jumpbackToP9', 'zurück', style = style_zuruck),
                                actionButton('jumpToDemographic', 'weiter', style = style_weiter)
                       ),
                       tabPanel(value = "demographic",
                                title = "Für Statistik",
                                h2("Fragen für statistische Zwecke"),
                                hr(),
                                prettyRadioButtons(inputId = "q_first",
                                                   label = "Haben Sie diesen Fragebogen hier
                                                    auf der Seite schon jemals zuvor ausgefüllt?",
                                                   choices = c("Nein, das ist mein erster Test" = "nein",
                                                               "Ja, schon wenigstens ein mal gemacht" = "ja"),
                                                   width = '150%',
                                                   status = "success",
                                                   selected = character()
                                ),
                                hr(),
                                prettyRadioButtons(inputId = "q_sex",
                                                   label = "Geschlecht",
                                                   choices = c("weiblich",
                                                               "männlich",
                                                               "anders",
                                                               "keine Angabe"),
                                                   status = "success",
                                                   selected = character()),
                                hr(),
                                selectInput(inputId = "q_age", # pickerInput from shinyWidgets
                                            label = "Ihr Alter",
                                            choices = c(10:101),
                                           #choicesOpt = (list(style = "background: forestgreen; color: white;")),
                                             selected = NULL
                                             ),
                                br(),
                                hr(),
                                selectInput(inputId = "q_education",
                                            label = "Ihr höchster erreichter Bildungsabschluss",
                                            choices = c("Ohne allgemeinen Schulabschluss",
                                                        "noch in schulischer Ausbildung",
                                                        "Haupt-(Volks-)schulabschluss",
                                                        "Abschluss der polytechnischen Oberschule",
                                                        "Realschul- oder gleichwertiger Abschluss",
                                                        "Fachhohschul- oder Hochschulreife",
                                                        "Fachhochschulstudium Bachelor",
                                                        "Fachhochschulstudium Master",
                                                        "Fachhochschulstudium Promotion",
                                                        "Hochschulstudium Bachelor",
                                                        "Hochschulstudium Master/Magister",
                                                        "Hochschulstudium Promotion",
                                                        "Staatsexamen",
                                                        "Meister",
                                                        "Ohne Angabe zur Art des Abschlusses")
                                ),
                                br(),
                                hr(),
                                textInput(inputId = "email",
                                          label = "Ihre Emailadresse (optional)",
                                          placeholder = "persona@beispiel.com"),
                                
                                br(),br(),br(),
                                actionButton('jumpbackToP10', 'zurück', style = style_zuruck),
                                actionButton('jumpToPErg', 'zu den Ergebnissen', style = style_Erg)
                                )
                       )
                       
                  
                  )
          ),
  
  #### TEST ####
          # tabItem(
          #   tabName = "TestTab",
          #   h2("Der Persönlichkeitstest"),
          #   hr()
          # ),
                    # tabItem(
                    #   tabName = "q1-10",
                    #   fluidRow(
                    #     column(width = 3),
                    #     column(width = 8,
                    #   h2("Inwieweit treffen die folgenden Aussagen auf Sie zu?"),
                    #   hr(),
                    #   buttons[1:20],#Survey Questins sourced from Table_1.R
                    #   actionButton('jumpToP2', 'weiter', style = style_weiter)))
                    # ),
                    # tabItem(
                    #   tabName = "q11-20",
                    #   fluidRow(
                    #     column(width = 3),
                    #     column(width = 8,
                    #   h2("Inwieweit treffen die folgenden Aussagen auf Sie zu?"),
                    #   hr(),
                    #   buttons[21:40],
                    #   actionButton('jumpbackToP1', 'zurück', style = style_zuruck),
                    #   actionButton('jumpToP3', 'weiter', style = style_weiter))) 
                    # ),
                    # tabItem(
                    #   tabName = "q21-30",
                    #   fluidRow(
                    #     column(width = 3),
                    #     column(width = 8,
                    #   h2("Inwieweit treffen die folgenden Aussagen auf Sie zu?"),
                    #   hr(),
                    #   buttons[41:60],
                    #   actionButton('jumpbackToP2', 'zurück', style = style_zuruck),
                    #   actionButton('jumpToP4', 'weiter', style = style_weiter))) 
                    # ),
                    # tabItem(
                    #   tabName = "q31-40",
                    #   fluidRow(
                    #     column(width = 3),
                    #     column(width = 8,
                    #   h2("Inwieweit treffen die folgenden Aussagen auf Sie zu?"),
                    #   hr(),
                    #   buttons[61:80],
                    #   actionButton('jumpbackToP3', 'zurück', style = style_zuruck),
                    #   actionButton('jumpToP5', 'weiter', style = style_weiter))) 
                    # ),
                    # tabItem(
                    #   tabName = "q41-50",
                    #   fluidRow(
                    #     column(width = 3),
                    #     column(width = 8,
                    #   h2("Inwieweit treffen die folgenden Aussagen auf Sie zu?"),
                    #   hr(),
                    #   buttons[81:100],
                    #   actionButton('jumpbackToP4', 'zurück', style = style_zuruck),
                    #   actionButton('jumpToP6', 'weiter', style = style_weiter))) 
                    # ),
                    # tabItem(
                    #   tabName = "q51-60",
                    #   fluidRow(
                    #     column(width = 3),
                    #     column(width = 8,
                    #   h2("Inwieweit treffen die folgenden Aussagen auf Sie zu?"),
                    #   hr(),
                    #   buttons[101:120],
                    #   actionButton('jumpbackToP5', 'zurück', style = style_zuruck),
                    #   actionButton('jumpToP7', 'weiter', style = style_weiter))) 
                    # ),
                    # tabItem(
                    #   tabName = "q61-70",
                    #   fluidRow(
                    #     column(width = 3),
                    #     column(width = 8,
                    #   h2("Inwieweit treffen die folgenden Aussagen auf Sie zu?"),
                    #   hr(),
                    #   buttons[121:140],
                    #   actionButton('jumpbackToP6', 'zurück', style = style_zuruck),
                    #   actionButton('jumpToP8', 'weiter', style = style_weiter))) 
                    # ),
                    # tabItem(
                    #   tabName = "q71-80",
                    #   fluidRow(
                    #     column(width = 3),
                    #     column(width = 8,
                    #   h2("Inwieweit treffen die folgenden Aussagen auf Sie zu?"),
                    #   hr(),
                    #   buttons[141:160],
                    #   actionButton('jumpbackToP7', 'zurück', style = style_zuruck),
                    #   actionButton('jumpToP9', 'weiter', style = style_weiter))) 
                    # ),
                    # tabItem(
                    #   tabName = "q81-90",
                    #   fluidRow(
                    #     column(width = 3),
                    #     column(width = 8,
                    #   h2("Inwieweit treffen die folgenden Aussagen auf Sie zu?"),
                    #   hr(),
                    #   buttons[161:180],
                    #   actionButton('jumpbackToP8', 'zurück', style = style_zuruck),
                    #   actionButton('jumpToP10', 'weiter', style = style_weiter))) 
                    # ),
                    # tabItem(
                    #   tabName = "q91-100",
                    #   fluidRow(
                    #     column(width = 3),
                    #     column(width = 8,
                    #   h2("Inwieweit treffen die folgenden Aussagen auf Sie zu?"),
                    #   hr(),
                    #   buttons[181:200],
                    #   actionButton('jumpbackToP9', 'zurück', style = style_zuruck),
                    #   actionButton('jumpToDemographic', 'weiter', style = style_weiter))) 
                    # ),
                    # tabItem(
                    #   tabName = "demographic",
                    #   fluidRow(
                    #     column(width = 3),
                    #     column(width = 8,
                    #            h2("Freiwilige fragen für statistische Zwecke"),
                    #            hr(),
                    #            
                    #            prettyRadioButtons(inputId = "q_first",
                    #                         label = "Haben Sie diesen Fragebogen hier
                    #                                 auf der Seite schon jemals zuvor ausgefüllt?",
                    #                         choices = c("Nein, das ist mein erster Test",
                    #                                     "Ja, schon wenigstens ein mal gemacht"),
                    #                         width = '150%',
                    #                         status = "success",
                    #                         selected = character()
                    #                         ),
                    #            hr(),
                    #            prettyRadioButtons(inputId = "q_sex",
                    #                         label = "Geschlecht",
                    #                         choices = c("weiblich",
                    #                                     "männlich",
                    #                                     "anders",
                    #                                     "keine Angabe"),
                    #                         status = "success",
                    #                         selected = character()),
                    #            hr(),
                    #            selectInput(inputId = "q_age", # pickerInput from shinyWidgets
                    #                        label = "Ihr Alter",
                    #                        choices = c("unter 18",
                    #                                    "18-25",
                    #                                    "26-35",
                    #                                    "36-45",
                    #                                    "46-55",
                    #                                    "56-65",
                    #                                    "66-75",
                    #                                    "über 75"),
                    #                        #choicesOpt = (list(style = "background: forestgreen; color: white;")),
                    #                        selected = NULL
                    #            ),
                    #            br(),
                    #            hr(),
                    #            selectInput(inputId = "q_education",
                    #                        label = "Ihr höchster erreichter Bildungsabschluss",
                    #                        choices = c("kein Schulabschluss",
                    #                                    "Hauptschulabschluss",
                    #                                    "Realschulabschluss | mittlere Reife",
                    #                                    "Fachhohschulreife",
                    #                                    "Abitur",
                    #                                    "abgeschlossenes Fachhochschulstudium",
                    #                                    "abgeschlossenes Hochschulstudium")
                    #            ),
                    #            br(),
                    #            hr(),
                    #            textInput(inputId = "email",
                    #                      label = "Ihre Emailadresse",
                    #                      placeholder = "persona@beispiel.com"),
                    #            
                    #            br(),br(),br(),
                    #            actionButton('jumpbackToP10', 'zurück', style = style_zuruck),
                    #            actionButton('jumpToPErg', 'zu den Ergebnissen', style = style_Erg))
                    #     )
                    #   ),
                    
          
  #### ERGEBNISSE ####
          tabItem(
              tabName = "ErgTab",
              h2("Ihre Ergebnisse"),
              tableOutput(outputId = "answers_table"),
              textOutput(outputId = "testtext")
          ),
          
          tabItem(
              tabName = "BeschTab",
              h1("Scale Descriptions"),
              h2("Domain-Level Scales"),
              h3(text2_t),
              p(text2),
              h3(text3_t),
              p(text3),
              h3(text4_t),
              p(text4),
              h3(text5_t),
              p(text5),
              h3(text6_t),
              p(text6),
              h3(text7_t),
              p(text7)
              
          )
      )
      
  )
  
  

#### Define UI for application that draws a histogram ####
  ui <- dashboardPage(header, sidebar, body,
                      skin = "green",
                      title = "Der HEXACO-PI-R Persönlichkeitstest")



#### Define server ####
server <- function(input, output, session) {

#### Action buttons "weiter" and "zurück" ####
    ## home to test
    observeEvent(input$startTest, {
      updateTabsetPanel(session, "tabs", "DerTestTab")
    })
    ## page 1
    observeEvent(input$jumpToP2, {
      updateTabsetPanel(session, "tabBoxTest", "q11-20")
    })
    ## page 2
    observeEvent(input$jumpbackToP1, {
      updateTabsetPanel(session, "tabBoxTest", "q1-10")
    })
    observeEvent(input$jumpToP3, {
      updateTabsetPanel(session, "tabBoxTest", "q21-30")
    })
    ## page 3
    observeEvent(input$jumpbackToP2, {
      updateTabItems(session, "tabBoxTest", "q11-20")
    })
    observeEvent(input$jumpToP4, {
      updateTabItems(session, "tabBoxTest", "q31-40")
    })
    ## page 4
    observeEvent(input$jumpbackToP3, {
      updateTabItems(session, "tabBoxTest", "q21-30")
    })
    observeEvent(input$jumpToP5, {
      updateTabItems(session, "tabBoxTest", "q41-50")
    })
    ## page 5
    observeEvent(input$jumpbackToP4, {
      updateTabItems(session, "tabBoxTest", "q31-40")
    })
    observeEvent(input$jumpToP6, {
      updateTabItems(session, "tabBoxTest", "q51-60")
    })
    ## page 6
    observeEvent(input$jumpbackToP5, {
      updateTabItems(session, "tabBoxTest", "q41-50")
    })
    observeEvent(input$jumpToP7, {
      updateTabItems(session, "tabBoxTest", "q61-70")
    })
    ## page 7
    observeEvent(input$jumpbackToP6, {
      updateTabItems(session, "tabBoxTest", "q51-60")
    })
    observeEvent(input$jumpToP8, {
      updateTabItems(session, "tabBoxTest", "q71-80")
    })
    ## page 8
    observeEvent(input$jumpbackToP7, {
      updateTabItems(session, "tabBoxTest", "q61-70")
    })
    observeEvent(input$jumpToP9, {
      updateTabItems(session, "tabBoxTest", "q81-90")
    })
    ## page 9
    observeEvent(input$jumpbackToP8, {
      updateTabItems(session, "tabBoxTest", "q71-80")
    })
    observeEvent(input$jumpToP10, {
      updateTabItems(session, "tabBoxTest", "q91-100")
    })
    ## page 10
    observeEvent(input$jumpbackToP9, {
      updateTabItems(session, "tabBoxTest", "q81-90")
    })
    observeEvent(input$'jumpToDemographic', {
      updateTabItems(session, "tabBoxTest", "demographic")
    })
    ## page 11
    observeEvent(input$jumpbackToP10, {
      updateTabItems(session, "tabBoxTest", "q91-100")
    })
    observeEvent(input$jumpToPErg, {
      updateTabItems(session, "tabs", "ErgTab")
  })
  
  
    
    
#### Create data table from the radioButtons answers ####

  # answer names from the radio buttons are q1 to q100
  observeEvent(input$jumpToPErg, {
              
    df_answers_long <- tibble()
    questions <- c()
    answers <- c()
    
    # if(is.null(input$email)) {
    #   input$email <- input$q_sex
    # } else {
    #   input$email
    # }
    ema <- reactive({
      if (input$email == "")
        paste0("keine Angabe")
    })
    
      for(i in 1:5) {     
        questions[[i]] <- c(paste0("qn",Q_100[i, 1]))
        answers[[i]] <- input[[paste0("q", Q_100[i, 1])]]
          
        df_answers_long <- tibble(questions, answers)
         df_answers_wide <- df_answers_long %>% 
           spread(key = questions, value = answers) %>% 
           add_column(first = input$q_first, sex = input$q_sex, 
                      age = input$q_age, education = input$q_education, 
                      email = ema(),
                      timestamp = Sys.time())
      }
    
    answers_long <-reactive(df_answers_long)  
    answers_wide <-reactive(df_answers_wide)
    demographics <- reactive(tibble(first_participation = input$q_first, 
                                        sex = input$q_sex, 
                                        age = input$q_age, 
                                        education = input$q_education, 
                                        email = input$email))
   
              
  # Save to a google spreadsheet - use the wide table because the sheet_append() 
  # from package googlesheets4 add a new row at the bottom of the dataset in Google Sheets.
   
     sheet_append(ss, answers_wide(), sheet = "trials")
              
  # Show as table in Results tab
    output$answers_table <- renderTable(demographics())
    output$testtext <- renderText(input$q_first)
              
            })
  
}


#### Run the application ####
shinyApp(ui = ui, server = server)
