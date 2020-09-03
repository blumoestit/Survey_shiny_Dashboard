tabItem(
  tabName = "TestTab",
  h2("Der Persönlichkeitstest"),
  hr()
),
tabItem(
  tabName = "q1-10",
  fluidRow(
    column(width = 3),
    column(width = 8,
           h2("Inwieweit treffen die folgenden Aussagen auf Sie zu?"),
           hr(),
           buttons[1:20],#Survey Questins sourced from Table_1.R
           actionButton('jumpToP2', 'weiter', style = style_weiter)))
),
tabItem(
  tabName = "q11-20",
  fluidRow(
    column(width = 3),
    column(width = 8,
           h2("Inwieweit treffen die folgenden Aussagen auf Sie zu?"),
           hr(),
           buttons[21:40],
           actionButton('jumpbackToP1', 'zurück', style = style_zuruck),
           actionButton('jumpToP3', 'weiter', style = style_weiter)))
),
tabItem(
  tabName = "q21-30",
  fluidRow(
    column(width = 3),
    column(width = 8,
           h2("Inwieweit treffen die folgenden Aussagen auf Sie zu?"),
           hr(),
           buttons[41:60],
           actionButton('jumpbackToP2', 'zurück', style = style_zuruck),
           actionButton('jumpToP4', 'weiter', style = style_weiter)))
),
tabItem(
  tabName = "q31-40",
  fluidRow(
    column(width = 3),
    column(width = 8,
           h2("Inwieweit treffen die folgenden Aussagen auf Sie zu?"),
           hr(),
           buttons[61:80],
           actionButton('jumpbackToP3', 'zurück', style = style_zuruck),
           actionButton('jumpToP5', 'weiter', style = style_weiter)))
),
tabItem(
  tabName = "q41-50",
  fluidRow(
    column(width = 3),
    column(width = 8,
           h2("Inwieweit treffen die folgenden Aussagen auf Sie zu?"),
           hr(),
           buttons[81:100],
           actionButton('jumpbackToP4', 'zurück', style = style_zuruck),
           actionButton('jumpToP6', 'weiter', style = style_weiter)))
),
tabItem(
  tabName = "q51-60",
  fluidRow(
    column(width = 3),
    column(width = 8,
           h2("Inwieweit treffen die folgenden Aussagen auf Sie zu?"),
           hr(),
           buttons[101:120],
           actionButton('jumpbackToP5', 'zurück', style = style_zuruck),
           actionButton('jumpToP7', 'weiter', style = style_weiter)))
),
tabItem(
  tabName = "q61-70",
  fluidRow(
    column(width = 3),
    column(width = 8,
           h2("Inwieweit treffen die folgenden Aussagen auf Sie zu?"),
           hr(),
           buttons[121:140],
           actionButton('jumpbackToP6', 'zurück', style = style_zuruck),
           actionButton('jumpToP8', 'weiter', style = style_weiter)))
),
tabItem(
  tabName = "q71-80",
  fluidRow(
    column(width = 3),
    column(width = 8,
           h2("Inwieweit treffen die folgenden Aussagen auf Sie zu?"),
           hr(),
           buttons[141:160],
           actionButton('jumpbackToP7', 'zurück', style = style_zuruck),
           actionButton('jumpToP9', 'weiter', style = style_weiter)))
),
tabItem(
  tabName = "q81-90",
  fluidRow(
    column(width = 3),
    column(width = 8,
           h2("Inwieweit treffen die folgenden Aussagen auf Sie zu?"),
           hr(),
           buttons[161:180],
           actionButton('jumpbackToP8', 'zurück', style = style_zuruck),
           actionButton('jumpToP10', 'weiter', style = style_weiter)))
),
tabItem(
  tabName = "q91-100",
  fluidRow(
    column(width = 3),
    column(width = 8,
           h2("Inwieweit treffen die folgenden Aussagen auf Sie zu?"),
           hr(),
           buttons[181:200],
           actionButton('jumpbackToP9', 'zurück', style = style_zuruck),
           actionButton('jumpToDemographic', 'weiter', style = style_weiter)))
),
tabItem(
  tabName = "demographic",
  fluidRow(
    column(width = 3),
    column(width = 8,
           h2("Freiwilige fragen für statistische Zwecke"),
           hr(),

           prettyRadioButtons(inputId = "q_first",
                              label = "Haben Sie diesen Fragebogen hier
                                                    auf der Seite schon jemals zuvor ausgefüllt?",
                              choices = c("Nein, das ist mein erster Test",
                                          "Ja, schon wenigstens ein mal gemacht"),
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
                       choices = c("unter 18",
                                   "18-25",
                                   "26-35",
                                   "36-45",
                                   "46-55",
                                   "56-65",
                                   "66-75",
                                   "über 75"),
                       #choicesOpt = (list(style = "background: forestgreen; color: white;")),
                       selected = NULL
           ),
           br(),
           hr(),
           selectInput(inputId = "q_education",
                       label = "Ihr höchster erreichter Bildungsabschluss",
                       choices = c("kein Schulabschluss",
                                   "Hauptschulabschluss",
                                   "Realschulabschluss | mittlere Reife",
                                   "Fachhohschulreife",
                                   "Abitur",
                                   "abgeschlossenes Fachhochschulstudium",
                                   "abgeschlossenes Hochschulstudium")
           ),
           br(),
           hr(),
           textInput(inputId = "email",
                     label = "Ihre Emailadresse",
                     placeholder = "persona@beispiel.com"),

           br(),br(),br(),
           actionButton('jumpbackToP10', 'zurück', style = style_zuruck),
           actionButton('jumpToPErg', 'zu den Ergebnissen', style = style_Erg))
  )
),
