
library(shiny)
library(shinydashboard)


source('Text_1.R')
source("Table_1.R")
tags$style(HTML(".checkbox-inline, .radio-inline {
    margin-right: 100px;
}"))

header <- dashboardHeader(title = "Persönlichkeitstest"#,
                          #dropdownMenu(type = "messages")
)


sidebar <- dashboardSidebar(
    sidebarMenu(id = "tabs",
        menuItem(text = "Home",
                  tabName = "HomeTab",
                 icon = icon('home')
        ),
        menuItem(text = "Test",
                 tabName = "TestTab",
                 icon = icon('check-square'),
                 menuSubItem(text = "Fragen 1-10",
                             tabName = "q1-10"
                 ),
                 menuSubItem(text = "Fragen 11-20",
                             tabName = "q11-20"
                 ),
                 menuSubItem(text = "Fragen 21-30",
                             tabName = "q21-30"
                 ),
                 menuSubItem(text = "Fragen 31-40",
                             tabName = "q31-40"
                 ),
                 menuSubItem(text = "Fragen 41-50",
                             tabName = "q41-50"
                 ),
                 menuSubItem(text = "Fragen 51-60",
                               tabName = "q51-60"
                 ),
                 menuSubItem(text = "Fragen 61-70",
                             tabName = "q61-70"
                 ),
                 menuSubItem(text = "Fragen 71-80",
                             tabName = "q71-80"
                 ),
                 menuSubItem(text = "Fragen 81-90",
                             tabName = "q81-90"
                 ),
                 menuSubItem(text = "Fragen 91-100",
                             tabName = "q91-100"
                 )
        ),
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



body <- dashboardBody(
    tabItems(
        tabItem(
            tabName = "HomeTab",
            fluidRow(
              column(width = 2),
              column(width = 8,
              box(width = NULL,
            h1("Persönlichkeitstest"), 
            h3(text1_t),
            p(text1))))
        ),
        tabItem(
          tabName = "TestTab",
          h2("Inwieweit treffen die folgenden Aussagen auf Sie zu?"),
          hr()
        ),
                  tabItem(
                    tabName = "q1-10",
                    fluidRow(
                      column(width = 3),
                      column(width = 6,
                             
                    h2("Inwieweit treffen die folgenden Aussagen auf Sie zu?"),
                    hr(),
                    buttons[1:20],#Survey Questins sourced from Table_1.R
                    actionButton('jumpToP2', 'weiter', class = "btn-success"))
                    )),
                    tabItem(
                    tabName = "q11-20",
                    h2("Inwieweit treffen die folgenden Aussagen auf Sie zu?"),
                    hr(),
                    buttons[21:40],
                    actionButton('jumpbackToP1', 'zurück', style = "color: white; 
                                                        background-color: #222D32" ),
                    actionButton('jumpToP3', 'weiter', style = "color: white; 
                     background-color: #01A75A; 
                     position: relative; 
                     left: 70%;
                     height: 35px;
                     width: 80px;
                     text-align:center;
                     text-indent: -2px;
                     border-radius: 6px;
                     border-width: 2px") 
                  ),
                  tabItem(
                    tabName = "q21-30",
                    h2("Inwieweit treffen die folgenden Aussagen auf Sie zu?"),
                    hr(),
                    buttons[41:60]
                  ),
                  tabItem(
                    tabName = "q31-40",
                    h2("Inwieweit treffen die folgenden Aussagen auf Sie zu?"),
                    hr(),
                    buttons[61:80]
                  ),
                  tabItem(
                    tabName = "q41-50",
                    h2("Inwieweit treffen die folgenden Aussagen auf Sie zu?"),
                    hr(),
                    buttons[81:100]
                  ),
                  tabItem(
                    tabName = "q51-60",
                    h2("Inwieweit treffen die folgenden Aussagen auf Sie zu?"),
                    hr(),
                    buttons[101:120]
                  ),
                  tabItem(
                    tabName = "q61-70",
                    h2("Inwieweit treffen die folgenden Aussagen auf Sie zu?"),
                    hr(),
                    buttons[121:140]
                  ),
                  tabItem(
                    tabName = "q71-80",
                    h2("Inwieweit treffen die folgenden Aussagen auf Sie zu?"),
                    hr(),
                    buttons[141:160]
                  ),
                  tabItem(
                    tabName = "q81-90",
                    h2("Inwieweit treffen die folgenden Aussagen auf Sie zu?"),
                    hr(),
                    buttons[161:180]
                  ),
                  tabItem(
                    tabName = "q91-100",
                    h2("Inwieweit treffen die folgenden Aussagen auf Sie zu?"),
                    hr(),
                    buttons[181:200]
                  ),
                  
        tabItem(
            tabName = "ErgTab"
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


# Define UI for application that draws a histogram
ui <- dashboardPage(header, sidebar, body,
                    skin = "green",
                    title = "Der 'Big Five' Persönlichkeitstest")

# Define server
 

server <- function(input, output, session) {
  
  observeEvent(input$jumpToP2, {
    updateTabItems(session, "tabs", "q11-20")
  })
  
  observeEvent(input$jumpbackToP1, {
    updateTabItems(session, "tabs", "q1-10")
  })
  
  observeEvent(input$jumpToP3, {
    updateTabItems(session, "tabs", "q21-30")
  })
  
  
  
}


# Run the application 
shinyApp(ui = ui, server = server)
