
library(shiny)
library(shinydashboard)
library(shinydashboardPlus)
library(dashboardthemes)
library(shinyWidgets)
library(DT)
library(tidyr)
library(dplyr)
library(tibble)
library(googlesheets4)
library(shinyalert)
library(shinylogs)

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
sidebar <- dashboardSidebar(#width = 300,
    sidebarMenu(id = "tabs", 
        menuItem(text = "Home",
                 tabName = "HomeTab",
                 icon = icon('home')
        ),
        menuItem(text = "Persönlichkeitstest", 
                 tabName = "DerTestTab",
                 icon = icon('check-square')
        ),
        menuItem(text = "Ergebnisse Persönlichkeitstest",
                 tabName = "ErgTab",
                 icon = icon('poll')
        ),
        menuItem(text = "FinaMetrica Test",
                 tabName = "FinTab",
                 icon = icon('piggy-bank')
        ),
        menuItem(text = "Ergebnisse FinaMetrica",
                 tabName = "ErgFinTab",
                 icon = icon('poll')
        ),
        menuItem(text = "Beschreibung",
                 tabName = "BeschTab",
                 icon = icon('poll-h')
        ),
        menuItem(text = "Datenschutz",
                 tabName = "DatenTab",
                 icon = icon('umbrella')
        )
    )
)



#### body ####
body <- dashboardBody(useShinyalert(), 
                      shinyDashboardThemes(theme = "blue_gradient"),
                      tags$head(tags$style(HTML('
                                

                                /* body */
                                .content-wrapper, .right-side {
                                background-color: #ECF0F5;
                                }

                                '))),
  # tags$head(
  #   tags$style(
  #     "body{
  #   min-height: 611px;
  #   height: auto;
  #   max-width: 1800px;
  #   margin: auto;
  #       }"
  #   )
  # ),
    tabItems(
      
  #### HOME #####
          tabItem(
              tabName = "HomeTab",
              #h1("Hier kommen Informationen über die Studie und den Persönlichkeitstest"),
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
                                 style = style_start
                    )
                  )
                )
              )
          ),
          
  #### DER TEST ####  
          tabItem(tabName = "DerTestTab", 
                  tags$style(HTML("
                      .btn {
                      color: #222D32;
                      border-color: #D3EAE4;
                      background-color: #ECF0F5;
                      }
                      .btn:hover {
                      color: #fff;
                      border-color: #96AFB8;
                      background-color: #75BFD2;
                      }
                      ")),
                  
                  fixedRow(
                    column(width = 1),
                    column(width = 11,      
                  #h2("Füllen Sie bitte den Fragebogen aus"),
                  #hr(),
                      )
                  ),
                  fixedRow(
                    tab_style_color, # defined in 'Table_1.R'
                    #tabItem(tabName = "null", column(width = 1)),
                    column(width = 1),
                    column(width = 11,
                    tabBox(width = 11, id = "tabBoxTest", 
                        tabPanel(value = "q1-10",
                          title = "Fragen 1-10",
                          h3("Inwieweit treffen die folgenden Aussagen auf Sie zu?"),
                          #hr(),
                          buttons[1:20],#Survey Questins sourced from Table_1.R
                          actionButton('jumpToP2', 'weiter', style = style_weiter)
                       ),
                       tabPanel(value = "q11-20",
                               title = "Fragen 11-20",
                               h3("Inwieweit treffen die folgenden Aussagen auf Sie zu?"),
                               #hr(),
                               buttons[21:40],
                               actionButton('jumpbackToP1', 'zurück', style = style_zuruck),
                               actionButton('jumpToP3', 'weiter', style = style_weiter)
                       ),
                       tabPanel(value = "q21-30",
                                title = "Fragen 21-30",
                                h3("Inwieweit treffen die folgenden Aussagen auf Sie zu?"),
                                #hr(),
                                buttons[41:60],
                                actionButton('jumpbackToP2', 'zurück', style = style_zuruck),
                                actionButton('jumpToP4', 'weiter', style = style_weiter)
                       ),
                       tabPanel(value = "q31-40",
                                title = "Fragen 31-40",
                                h3("Inwieweit treffen die folgenden Aussagen auf Sie zu?"),
                                #hr(),
                                buttons[61:80],
                                actionButton('jumpbackToP3', 'zurück', style = style_zuruck),
                                actionButton('jumpToP5', 'weiter', style = style_weiter)
                       ),
                       tabPanel(value = "q41-50",
                                title = "Fragen 41-50",
                                h3("Inwieweit treffen die folgenden Aussagen auf Sie zu?"),
                                #hr(),
                                buttons[81:100],
                                actionButton('jumpbackToP4', 'zurück', style = style_zuruck),
                                actionButton('jumpToP6', 'weiter', style = style_weiter)
                       ),
                       tabPanel(value = "q51-60",
                                title = "Fragen 51-60",
                                h3("Inwieweit treffen die folgenden Aussagen auf Sie zu?"),
                                #hr(),
                                buttons[101:120],
                                actionButton('jumpbackToP5', 'zurück', style = style_zuruck),
                                actionButton('jumpToP7', 'weiter', style = style_weiter)
                       ),
                       tabPanel(value = "q61-70",
                                title = "Fragen 61-70",
                                h3("Inwieweit treffen die folgenden Aussagen auf Sie zu?"),
                                #hr(),
                                buttons[121:140],
                                actionButton('jumpbackToP6', 'zurück', style = style_zuruck),
                                actionButton('jumpToP8', 'weiter', style = style_weiter)
                       ),
                       tabPanel(value = "q71-80",
                                title = "Fragen 71-80",
                                h3("Inwieweit treffen die folgenden Aussagen auf Sie zu?"),
                                #hr(),
                                buttons[141:160],
                                actionButton('jumpbackToP7', 'zurück', style = style_zuruck),
                                actionButton('jumpToP9', 'weiter', style = style_weiter)
                       ),
                       tabPanel(value = "q81-90",
                                title = "Fragen 81-90",
                                h3("Inwieweit treffen die folgenden Aussagen auf Sie zu?"),
                                #hr(),
                                buttons[161:180],
                                actionButton('jumpbackToP8', 'zurück', style = style_zuruck),
                                actionButton('jumpToP10', 'weiter', style = style_weiter)
                       ),
                       tabPanel(value = "q91-100",
                                title = "Fragen 91-100",
                                h3("Inwieweit treffen die folgenden Aussagen auf Sie zu?"),
                                #hr(),
                                buttons[181:200],
                                actionButton('jumpbackToP9', 'zurück', style = style_zuruck),
                                actionButton('jumpToDemographic', 'weiter', style = style_weiter)
                       ),
                       tabPanel(value = "demographic",
                                title = "Für Statistik",
                                h3("Fragen für statistische Zwecke"),
                                #hr(),
                                prettyRadioButtons(inputId = "q_first",
                                                   label = "Haben Sie diesen Fragebogen hier
                                                    auf der Seite schon jemals zuvor ausgefüllt?",
                                                   choices = c("Nein, das ist mein erster Test" = "nein",
                                                               "Ja, schon wenigstens ein mal gemacht" = "ja"),
                                                   width = '150%',
                                                   icon = icon("check"), 
                                                   bigger = TRUE,
                                                   status = "info",
                                                   animation = "jelly",
                                                   selected = character()
                                ),
                                hr(),
                                prettyRadioButtons(inputId = "q_sex",
                                                   label = "Geschlecht",
                                                   choices = c("weiblich",
                                                               "männlich",
                                                               "anders",
                                                               "keine Angabe"),
                                                   icon = icon("check"), 
                                                   bigger = TRUE,
                                                   status = "info",
                                                   animation = "jelly",
                                                   selected = character()),
                                hr(),
                                selectInput(inputId = "q_age", # pickerInput from shinyWidgets
                                            label = "Ihr Alter",
                                            choices = c(" ", 10:101),
                                           #choicesOpt = (list(style = "background: forestgreen; color: white;")),
                                             selected = " "
                                             ),
                                br(),
                                hr(),
                                selectInput(inputId = "q_education",
                                            label = "Ihr höchster erreichter Bildungsabschluss",
                                            choices = c(#" ",
                                                        "Berufsausbildungsvorbereitung" = "DQR1",
                                                        "Hauptschule / Berufsfachschule" = "DQR2",
                                                        "Realschule / Mittlere Reife (MSA) / Duale Berufsausbildung (2 Jahre)" = "DQR3",
                                                        "Abitur / Fachhochschulreife / Duale Berufsausbildung (3 Jahre)" = "DQR4",
                                                        "Zertifizierter IT-Spezialist / Geprüfter Servicetechniker" = "DQR5",
                                                        "Bachelor / Diplom (FH) / Staatsexam / Fachwirt" = "DQR6",
                                                        "Master / Diplom (Univ.) / Magister / Staatsexamen" = "DQR7",
                                                        "Promotion" = "DQR8",
                                                        " "),
                                            selected = " "
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
                  )
          ),
                    
          
  #### ERGEBNISSE ####
          tabItem(
              tabName = "ErgTab",
              #h2("Ihre Ergebnisse"),
              fixedRow(
                column(width = 1),
                column(width = 10,
                       box(
                         width = 12,
                         status = "info",
                         h2(text1_t),
                         hr(),
                         text1,
                         tableOutput(outputId = "answers_table"),
                          #textOutput(outputId = "testtext")
                       ),
                       box(
                         width = 12,
                         status = "info",
                         h3("Zusammenfassung des Persönlichkeitsprofils"),
                         hr(),
                         img(src="Legend1.png", height = 35, width = 110),
                         img(src="Legend2.png", height = 35, width = 170),
                         img(src="Legend3.png", height = 35, width = 350),
                         # HTML('<center><img src ="Legend2.png", height = 35, width = 200></center>'),
                         # HTML('<center><img src ="Legend3.png", height = 35, width = 350></center>'),
                         plotOutput(outputId = "box_ggplot")
                       ),
                       box(
                         width = 12,#style = "background-color: #ECF0F5;",
                         status = "info",
                         h3("Persönlichkeitsmerkmale"),
                         hr(),
                         column(width = 3, #style = "background-color: #01A75A;",
                              h4(strong("Ehrlichkeit - Demut"))#,
                               #plotOutput(outputId = "nul", height = "200px")
                               ),
                         column(width = 9, style = "background-color: #ECF0F5;",
                           plotOutput(outputId = "dnorm_ggplot_1",
                                      width = "100%", height = "300px")
                                  ),
                         hr(),
                           text1,
                         hr(),
                         
                         column(width = 3, 
                                h4(strong("Emotionalität"))
                         ),
                         column(width = 9, style = "background-color: #ECF0F5;",
                                plotOutput(outputId = "dnorm_ggplot_2",
                                           width = "100%", height = "300px")
                         ),
                         hr(),
                         text1,
                         hr(),
                         
                         column(width = 3, 
                                h4(strong("Extraversion"))
                         ),
                         column(width = 9, style = "background-color: #ECF0F5;",
                                plotOutput(outputId = "dnorm_ggplot_3",
                                           width = "100%", height = "300px")
                         ),
                         hr(),
                         text1,
                         hr(),
                         
                         column(width = 3, 
                                h4(strong("Verträglichkeit"))
                         ),
                         column(width = 9, style = "background-color: #ECF0F5;",
                                plotOutput(outputId = "dnorm_ggplot_4",
                                           width = "100%", height = "300px")
                         ),
                         hr(),
                         text1,
                         hr(),
                         
                         column(width = 3, 
                                h4(strong("Gewissenhaftigkeit"))
                         ),
                         column(width = 9, style = "background-color: #ECF0F5;",
                                plotOutput(outputId = "dnorm_ggplot_5",
                                           width = "100%", height = "300px")
                         ),
                         hr(),
                         text1,
                         hr(),
                         
                         column(width = 3, 
                                h4(strong("Offenheit für Erfahrungen"))
                         ),
                         column(width = 9, style = "background-color: #ECF0F5;",
                                plotOutput(outputId = "dnorm_ggplot_6",
                                           width = "100%", height = "300px")
                         ),
                         hr(),
                         text1,
                         hr(),
                         column(width = 3, 
                                h4(strong("Altruism"))
                         ),
                         column(width = 9, style = "background-color: #ECF0F5;",
                                plotOutput(outputId = "dnorm_ggplot_7",
                                           width = "100%", height = "300px")
                         ),
                         hr(),
                         text1,
                         hr()
                       )
                )
              )
          ),
  
  #### FINA METRICA ####  
  tabItem(tabName = "FinTab", 
          tags$style(HTML("
                      .btn {
                      color: #222D32;
                      border-color: #D3EAE4;
                      background-color: #ECF0F5;
                      }
                      .btn:hover {
                      color: #fff;
                      border-color: #96AFB8;
                      background-color: #75BFD2;
                      }
                      ")),
          
          fixedRow(
            column(width = 1),
            column(width = 11,      
                   #h2("Füllen Sie bitte den Fragebogen aus"),
                   #hr(),
            )
          ),
          fixedRow(
            tab_style_color, # defined in 'Table_1.R'
            #tabItem(tabName = "null", column(width = 1)),
            column(width = 1),
            column(width = 11,
                   tabBox(width = 11, id = "tabBoxFin", 
                          tabPanel(value = "fq1-5",
                                   title = "Fragen 1-5",
                                   strong(finMet_1),
                                   br(),br(),
                                   buttons_fq[1:5],
                                   hr(),
                                   actionButton('jumpToFN2', 'weiter', style = style_weiter)
                          ),
                          tabPanel(value = "fq6-10",
                                   title = "Fragen 6-10",
                                   strong(finMet_1),
                                   br(),br(),
                                   buttons_fq[6:10],
                                   hr(),
                                   actionButton('jumpbackToFN1', 'zurück', style = style_zuruck),
                                   actionButton('jumpToFN3', 'weiter', style = style_weiter)
                          ),
                          tabPanel(value = "fq11-15",
                                   title = "Fragen 11-15",
                                   strong(finMet_1),
                                   br(),br(),
                                   buttons_fq[11:15],
                                   hr(),
                                   actionButton('jumpbackToFN2', 'zurück', style = style_zuruck),
                                   actionButton('jumpToFN4', 'weiter', style = style_weiter)
                          ),
                          tabPanel(value = "fq16-20",
                                   title = "Fragen 16-20",
                                   strong(finMet_1),
                                   br(),br(),
                                   buttons_fq[16:20],
                                   hr(),
                                   actionButton('jumpbackToFN3', 'zurück', style = style_zuruck),
                                   actionButton('jumpToFN5', 'weiter', style = style_weiter)
                          ),
                          tabPanel(value = "fq21-25",
                                   title = "Fragen 21-25",
                                   strong(finMet_1),
                                   br(),br(),
                                   buttons_fq[21:24],
                                     strong(qfm[[25]]),
                                     br(strong("Wie hoch, denken Sie, wird Ihre Punktzahl sein?")),
                                     numericInput(inputId = "fq25",
                                                  label = "",
                                                  min = 0, max = 100,
                                                  width = "15%",
                                                  verbatimTextOutput("value")),
                                   img(src="Question_25.png", height = 300, width = 500),
                                   
                                   hr(),
                                   actionButton('jumpbackToFN4', 'zurück', style = style_zuruck),
                                   actionButton('jumpToFNdemo', 'weiter', style = style_weiter)
                          ),
                          tabPanel(value = "fq-demo",
                                   title = "Demografische Fragen",
                                   strong(finMet_2),
                                   br(),br(),
                                   buttons_fq[26],
                                   strong("2. Mein Geburtsjahr ist:"),
                                     numericInput(inputId = "fqd2",
                                                  label = "",
                                                  min = 12, max = 112,
                                                  width = "10%",
                                                  verbatimTextOutput("value")),
                                   buttons_fq[28:31],
                                   strong("7. Wie viele Familienmitglieder, sich ausgenommen, 
                                          unterstützen Sie finanziell - teilweise oder voll?"),
                                     numericInput(inputId = "fqd7",
                                                  label = " ", #qfm[[32]],
                                                  min = 0, max = 20,
                                                  width = "10%",
                                                  verbatimTextOutput("value")),
                                   buttons_fq[33],
                                   hr(),
                                   actionButton('jumpbackToFN5', 'zurück', style = style_zuruck),
                                   actionButton('jumpToFNErg', 'zu den Ergebnissen', style = style_Erg)
                          )
                   )
                   
            )
          )
  ),
  
  #### BESCHREIBUNG ####       
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
              
          ),
            tabItem(
              tabName = "DatenTab",
              fluidRow(
                column(width = 2),
                column(width = 8,
                       box(width = NULL,
                           h1("Datenschutz"), 
                           h3(text1_t),
                           p(text1), 
                           hr()
                           )
                       )
                )
              )

  
      )
      
  )
  
  




#### Define UI for application that draws a histogram ####
  ui <- dashboardPage(header, sidebar, body,
                      #skin = "green",
                      title = "Der HEXACO-PI-R Persönlichkeitstest")







#### Define server ####
server <- function(input, output, session) {
  timestamp1 <<- Sys.time()

#### Action buttons "weiter" and "zurück" ####
    ## home to test
    observeEvent(input$startTest, {
      updateTabsetPanel(session, "tabs", "DerTestTab")
     # timestamp1 <<- Sys.time()
      #print(timestamp1)
    })
    ## page 1
    observeEvent(input$jumpToP2, {
      updateTabItems(session, "tabBoxTest", "q11-20")
    })
    ## page 2
    observeEvent(input$jumpbackToP1, {
      updateTabItems(session, "tabBoxTest", "q1-10")
    })
    observeEvent(input$jumpToP3, {
      updateTabItems(session, "tabBoxTest", "q21-30")
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
  
  
    
    
    
#### Create chart layers without results and from the radioButtons answers ####
  
    # Save plot in reactive BOX PLOT
    plot.dat <- reactiveValues(main=NULL, layer1=NULL)
    plot.dat$main <- box_plot
    
    observe({
      style <- isolate(input$style)
      withProgress(message = "Boxplot wird gemacht...", style = style, value = 0.1, {
        Sys.sleep(0.25)
      output$box_ggplot <- renderPlot({ plot.dat$main + plot.dat$layer1 })
      })
    })

    # Save plot in reactive DNORM PLOT
    plot.dat1 <- reactiveValues(main=NULL, layer1=NULL)
    plot.dat1$main <- dnorm_ggplot_1
    observe({
      output$dnorm_ggplot_1 <- renderPlot({ plot.dat1$main + plot.dat1$layer1 + plot.dat1$layer2})
    })
    
    plot.dat2 <- reactiveValues(main=NULL, layer1=NULL)
    plot.dat2$main <- dnorm_ggplot_2
    observe({
      output$dnorm_ggplot_2 <- renderPlot({ plot.dat2$main + plot.dat2$layer1 + plot.dat2$layer2})
    })
    
    plot.dat3 <- reactiveValues(main=NULL, layer1=NULL)
    plot.dat3$main <- dnorm_ggplot_3
    observe({
      output$dnorm_ggplot_3 <- renderPlot({ plot.dat3$main + plot.dat3$layer1 + plot.dat3$layer2})
    })
    
    plot.dat4 <- reactiveValues(main=NULL, layer1=NULL)
    plot.dat4$main <- dnorm_ggplot_4
    observe({
      output$dnorm_ggplot_4 <- renderPlot({ plot.dat4$main + plot.dat4$layer1 + plot.dat4$layer2})
    })
    
    plot.dat5 <- reactiveValues(main=NULL, layer1=NULL)
    plot.dat5$main <- dnorm_ggplot_5
    observe({
      output$dnorm_ggplot_5 <- renderPlot({ plot.dat5$main + plot.dat5$layer1 + plot.dat5$layer2})
    })
    
    plot.dat6 <- reactiveValues(main=NULL, layer1=NULL)
    plot.dat6$main <- dnorm_ggplot_6
    observe({
      output$dnorm_ggplot_6 <- renderPlot({ plot.dat6$main + plot.dat6$layer1 + plot.dat6$layer2})
    })
    
    plot.dat7 <- reactiveValues(main=NULL, layer1=NULL)
    plot.dat7$main <- dnorm_ggplot_7
    observe({
      output$dnorm_ggplot_7 <- renderPlot({ plot.dat7$main + plot.dat7$layer1 + plot.dat7$layer2})
    })
    
    
    
    
#### observeEvent radio buttons q1 to q100 ####
  observeEvent(input$jumpToPErg, {
    
    withProgress(message = "Warten auf Ihre Ergebnisse...", value = 3, {
    
    df_answers_long <- tibble()
    questions <- c()
    answers <- c()
    
    n <- 100
    
      for(i in 1:n) { 
        questions[[i]] <- paste0("qn",Q_100[i, 1])
        current_input <- input[[paste0("q", Q_100[i, 1])]]
        answers[[i]] <- if (is.null(current_input)) { NA } else { current_input }
        df_answers_long <- tibble(questions, answers)
      }

    first <- if (is.null(input$q_first)) { NA } else { input$q_first }
    sex <- if (is.null(input$q_sex)) { NA } else { input$q_sex }
    age <- if (is.null(input$q_age)) { NA } else { input$q_age }
    education <- if (is.null(input$q_education)) { NA } else { input$q_education }
    ema <- if (input$email == "") {paste0("keine Angabe")} else { input$email }

    stats <- data.frame(first, sex, age, education, ema)
    
    df_answers_wide <- df_answers_long %>%
      spread(key = questions, value = answers) %>%
      add_column(first = first,
                 sex = sex,
                 age = age,
                 education = education,
                 email = ema,
                 timestamp_1 = timestamp1,
                 timestamp_2 = Sys.time())
  

    questions_error <- NULL
    stats_error <- NULL
    if (any(is.na(df_answers_wide))) {
      if (any(is.na(stats))) {
        stats_error <- paste("Bitte beantworten Sie alle demographische Fragen.")
      }
      if (any(is.na(df_answers_long$answers))) {
        questions_error <- paste("Gehen Sie bitte zurück zu Frage(n): ", 
                                 paste0(which(is.na(df_answers_long$answers)), collapse = ", "))
      }
    }
    
    if (!is.null(questions_error) | !is.null(stats_error)) {
      shinyalert(title = "Noch nicht alle Fragen beantwortet!",
                 text = paste(questions_error, stats_error, sep = "\n"),
                 type = "warning",
                 showCancelButton = FALSE,
                 showConfirmButton = TRUE,
                 confirmButtonCol = "#96AFB8",
                 callbackR = function(){ updateTabsetPanel(session, "tabs", "DerTestTab") })
    } else {





      
      # if (any(is.na(df_answers_wide))) {
      #   shinyalert(title = "Noch nicht alle Fragen beantwortet! Gehen Sie bitte zurück zu Frage(n)",
      #              text = "Für Statistik",
      #              type = "warning",
      #              showCancelButton = TRUE,
      #              showConfirmButton = TRUE,
      #              confirmButtonCol = color_darkgreen,
      #              callbackR = function(){ updateTabsetPanel(session, "tabs", "DerTestTab") })
      # } 
        

         answers_long_responds <- df_answers_long %>%
                                  left_join(Q_100 , by = "questions") %>%
                                  select(-starke.Ablehnung, -Ablehnung, -neutral, -Zustimmung,-starke.Zustimmung, -Q_Id) %>%
                                  mutate(Factor = factor(Factor, levels = c("Ehrlichkeit - Demut", "Emotionalität",
                                                                           "Extraversion", "Verträglichkeit",
                                                                           "Gewissenhaftigkeit", "Offenheit für Erfahrungen",
                                                                           "Altruism")),
                                        answersRN = stringr::str_c(answers, Reverse)) %>%
                                  mutate(answers_right_order = ifelse(answersRN == "1R", "5",
                                                                ifelse(answersRN == "2R", "4",
                                                                 ifelse(answersRN == "4R", "2",
                                                                  ifelse(answersRN == "5R", "1", answers))))) %>%
                                  mutate(answers_right_order = as.numeric(answers_right_order)) %>%
                                  group_by(Factor) %>%
                                  summarise(mean_response = mean(answers_right_order))




    answers_long <-reactive(df_answers_long)

    answers_wide <-reactive(df_answers_wide)
    demographics <- reactive(tibble(first_participation = input$q_first,
                                        sex = input$q_sex,
                                        age = input$q_age,
                                        education = input$q_education,
                                        email = input$email))
    answers_long_resp <- reactive(answers_long_responds)

    answers_long_re <- answers_long_resp() # create not reactive data frame to boxplot_respond in geom_point()

    answers_long_re_DT <- answers_long_resp()

    answers_long_re_DT <-  answers_long_re_DT %>%
      rename("Merkmal" = "Factor", "Ihr Ergebnis" = "mean_response")

    comparison_study_percentile <- comparison_study_percentile %>%
      left_join(answers_long_re, by = "Factor")

    comparison_study_percentile$Factor <- factor(comparison_study_percentile$Factor,
                                            levels = c("Ehrlichkeit - Demut", "Emotionalität",
                                                        "Extraversion", "Verträglichkeit",
                                                          "Gewissenhaftigkeit", "Offenheit für Erfahrungen",
                                                             "Altruism"))


  # Save to a google spreadsheet - use the wide table because the sheet_append()
  # from package googlesheets4 add a new row at the bottom of the dataset in Google Sheets.
     sheet_append(ss, answers_wide(), sheet = "trials")

  # Show as table in Results tab

    output$answers_table <- renderTable({
      style <- isolate(input$style)
      withProgress(message = "Tabelle wird gemacht", style = style, value = 0.1, {
        Sys.sleep(0.25)
      answers_long_re_DT
      })
    })
    #output$answers_table <- renderTable(answers_long())
     
    # output$testtext <- renderText(input$q_first)


  # Show the updated box_plot with responder results (points)
  #
  
    
     #output$box_ggplot <- box_plot_respond
    boxplot_respond <- geom_point(aes(x = comparison_study_percentile$mean_response, # the responder's mean value
                                y = 0.15),
                              color = color_purple,
                              size = 7)

    plot.dat$layer1 <- boxplot_respond


    ### dnorm_ggplots

    plot.dat1$layer1 <-  geom_text(aes(x = comparison_study_percentile$mean_response[[6]]+0.1,
                                       y = comparison_study_percentile$max_point_y[[6]]+0.12,
                                       label = paste0("Ihr Ergebnis: ",
                                                      round(comparison_study_percentile$mean_response[[6]], 2))),
                                       size = 6,
                                       color = color_purple)
    plot.dat1$layer2 <-  annotate("segment", x = comparison_study_percentile$mean_response[[6]],
                                            xend = comparison_study_percentile$mean_response[[6]],
                                            y = 0,
                                            yend = comparison_study_percentile$max_point_y[[6]]+0.08,
                                            color = color_purple,
                                            size = 2,
                                            alpha = 0.8)

    plot.dat2$layer1 <-  geom_text(aes(x = comparison_study_percentile$mean_response[[5]]+0.1,
                                       y = comparison_study_percentile$max_point_y[[5]]+0.12,
                                       label = paste0("Ihr Ergebnis: ",
                                                      round(comparison_study_percentile$mean_response[[5]], 2))),
                                   size = 6,
                                   color = color_purple)
    plot.dat2$layer2 <-  annotate("segment", x = comparison_study_percentile$mean_response[[5]],
                                  xend = comparison_study_percentile$mean_response[[5]],
                                  y = 0,
                                  yend = comparison_study_percentile$max_point_y[[5]]+0.08,
                                  color = color_purple,
                                  size = 2,
                                  alpha = 0.8)

    plot.dat3$layer1 <-  geom_text(aes(x = comparison_study_percentile$mean_response[[4]]+0.1,
                                       y = comparison_study_percentile$max_point_y[[4]]+0.12,
                                       label = paste0("Ihr Ergebnis: ",
                                                      round(comparison_study_percentile$mean_response[[4]], 2))),
                                   size = 6,
                                   color = color_purple)
    plot.dat3$layer2 <-  annotate("segment", x = comparison_study_percentile$mean_response[[4]],
                                  xend = comparison_study_percentile$mean_response[[4]],
                                  y = 0,
                                  yend = comparison_study_percentile$max_point_y[[4]]+0.08,
                                  color = color_purple,
                                  size = 2,
                                  alpha = 0.8)

    plot.dat4$layer1 <-  geom_text(aes(x = comparison_study_percentile$mean_response[[3]]+0.1,
                                       y = comparison_study_percentile$max_point_y[[3]]+0.12,
                                       label = paste0("Ihr Ergebnis: ",
                                                      round(comparison_study_percentile$mean_response[[3]], 2))),
                                   size = 6,
                                   color = color_purple)
    plot.dat4$layer2 <-  annotate("segment", x = comparison_study_percentile$mean_response[[3]],
                                  xend = comparison_study_percentile$mean_response[[3]],
                                  y = 0,
                                  yend = comparison_study_percentile$max_point_y[[3]]+0.08,
                                  color = color_purple,
                                  size = 2,
                                  alpha = 0.8)

    plot.dat5$layer1 <-  geom_text(aes(x = comparison_study_percentile$mean_response[[2]]+0.1,
                                       y = comparison_study_percentile$max_point_y[[2]]+0.12,
                                       label = paste0("Ihr Ergebnis: ",
                                                      round(comparison_study_percentile$mean_response[[2]], 2))),
                                   size = 6,
                                   color = color_purple)
    plot.dat5$layer2 <-  annotate("segment", x = comparison_study_percentile$mean_response[[2]],
                                  xend = comparison_study_percentile$mean_response[[2]],
                                  y = 0,
                                  yend = comparison_study_percentile$max_point_y[[2]]+0.08,
                                  color = color_purple,
                                  size = 2,
                                  alpha = 0.8)

    plot.dat6$layer1 <-  geom_text(aes(x = comparison_study_percentile$mean_response[[1]]+0.1,
                                       y = comparison_study_percentile$max_point_y[[1]]+0.12,
                                       label = paste0("Ihr Ergebnis: ",
                                                      round(comparison_study_percentile$mean_response[[1]], 2))),
                                   size = 6,
                                   color = color_purple)
    plot.dat6$layer2 <-  annotate("segment", x = comparison_study_percentile$mean_response[[1]],
                                  xend = comparison_study_percentile$mean_response[[1]],
                                  y = 0,
                                  yend = comparison_study_percentile$max_point_y[[1]]+0.08,
                                  color = color_purple,
                                  size = 2,
                                  alpha = 0.8)

    plot.dat7$layer1 <-  geom_text(aes(x = comparison_study_percentile$mean_response[[7]]+0.1,
                                       y = comparison_study_percentile$max_point_y[[7]]+0.12,
                                       label = paste0("Ihr Ergebnis: ",
                                                      round(comparison_study_percentile$mean_response[[7]], 2))),
                                   size = 6,
                                   color = color_purple)
    plot.dat7$layer2 <-  annotate("segment", x = comparison_study_percentile$mean_response[[7]],
                                  xend = comparison_study_percentile$mean_response[[7]],
                                  y = 0,
                                  yend = comparison_study_percentile$max_point_y[[7]]+0.08,
                                  color = color_purple,
                                  size = 2,
                                  alpha = 0.8)
    
   
    }
    }) # end of progress bar function
    
     }, 
  ignoreInit = T)   # end of oserver go to Erg
        
        
      
    
    
}


#### Run the application ####
shinyApp(ui = ui, server = server)
