
#### Questions fron FinaMetrica questionnaire ####
  Q_FM <- read.csv("Q_FM_questions_only.csv", stringsAsFactors = FALSE)
  
  qfm <- list()
  for (j in 1:nrow(Q_FM)) {
    
    qfm[j] <- Q_FM$Item[j]
    
  }

  qfm_choices <- list(
  qfm1 = c("Extrem niedrige Risikobereitschaft." = 1,
                    "Sehr niedrige Risikobereitschaft." = 2,
                    "Niedrige Risikobereitschaft." = 3,
                    "Durchschnittliche Risikobereitschaft." = 4,
                    "Hohe Risikobereitschaft." = 5,
                    "Sehr hohe Risikobereitschaft." = 6,
                    "Extrem hohe Risikobereitschaft." = 7),
  
  qfm2 = c("Gar nicht leicht." = 1,
                    "Nicht so leicht." = 2,
                    "Ziemlich leicht." = 3,
                    "Sehr leicht." = 4),
  
  qfm3 = c("Gefahr." = 1,
                    "Unsicherheit." = 2,
                   "Chance." = 3,
                    "Nervenkitzel." = 4),
    
  qfm4 = c("Nein." = 1,
                    "Ja, sehr selten." = 2,
                    "Ja, eher selten." = 3,
                    "Ja, schon öfter." = 4,
                    "Ja, sehr oft." = 5),
  
  qfm5 = c("Mit Sicherheit für mehr Arbeitsplatzsicherheit mit kleiner Gehaltssteigerung." = 1,
                    "Wahrscheinlich für mehr Arbeitsplatzsicherheit mit kleiner Gehaltssteigerung." = 2,
                    "Ich bin mir nicht sicher." = 3,
                    "Wahrscheinlich für weniger Arbeitsplatzsicherheit mit großer Gehaltssteigerung." = 4,
                    "Mit Sicherheit für weniger Arbeitsplatzsicherheit mit großer Gehaltssteigerung." = 5),
  
  qfm6 = c("Immer mehr mit den möglichen Verlusten." = 1,
                    "Normalerweise mehr mit den möglichen Verlusten." = 2,
                    "Normalerweise mehr mit den möglichen Gewinnen." = 3,
                    "Immer mehr mit den möglichen Gewinnen." = 4),
    
  qfm7 = c("Sehr pessimistisch." = 1,
                    "Ein wenig pessimistisch." = 2,
                    "Ein wenig optimistisch." = 3,
                    "Sehr optimistisch." = 4),
  
  qfm8 = c("Nur Gehalt." = 1,
                    "Hauptsächlich Gehalt." = 2,
                    "Gleichmäßige Kombination aus Gehalt und Provision." = 3,
                    "Hauptsächlich Provision." = 4,
                    "Nur Provision." = 5),
  
  qfm9 = c("Sehr niedrig." = 1,
                    "Niedrig." = 2,
                    "Durchschnittlich." = 3,
                    "Hoch." = 4,
                    "Sehr hoch." = 5),
  
  qfm10 = c("Sehr niedrig." = 1,
              "Niedrig." = 2,
              "Durchschnittlich." = 3,
              "Hoch." = 4,
              "Sehr hoch." = 5),
  
  qfm11 = c("Sehr unwahrscheinlich." = 1,
                    "Etwas unwahrscheinlich." = 2,
                    "Etwas wahrscheinlich." = 3,
                    "Sehr wahrscheinlich." = 4),
  
  qfm12 = c("Kein." = 1,
                       "Ein wenig." = 2,
                       "Ein angemessenes Maß." = 3,
                       "Sehr viel." = 4,
                       "Voll." = 5),
  
  qfm13 = c("Mit Sicherheit nicht." = 1,
                     "Wahrscheinlich nicht." = 2,
                     "Ich bin mir nicht sicher." = 3,
                     "Wahrscheinlich." = 4,
                     "Mit Sicherheit." = 5),
  
  qfm14 = c("Jeder Rückgang würde mich verunsichern." = 1,
                     "10%." = 2,
                     "20%." = 3,
                     "33%." = 4,
                     "50%." = 5,
                      "Mehr als 50%." = 6),
  
  qfm15 = c("Es so zu verkaufen." = 1,
                     "Es unverändert behalten, aber vermieten." = 2,
                     "Eine Hypothek über €100.000 aufnehmen und die Renovierungsarbeiten durchführen." = 3),
  
  qfm16 = c("1) 0%, 2) 0%, 3) 100%" = 1,
                     "1) 0%, 2) 30%, 3) 70%" = 2,
                     "1) 10%, 2) 40%, 3) 50%" = 3,
                     "1) 30%, 2) 40%, 3) 40%" = 4,
                     "1) 50%, 2) 40%, 3) 10%" = 5,
                     "1) 70%, 2) 30%, 3) 0%" = 6,
                     "1) 100%, 2) 0%, 3) 0%" = 7),
  
  qfm17 = c("Null, d.h. kein Verlustrisiko." = 1,
                     "Sehr niedriges Verlustrisiko." = 2,
                     "Mäßiges Verlustrisiko." = 3,
                     "50% Verlustrisiko." = 4),
  
  qfm18 = c("Sehr viel wichtiger, dass der Wert nicht abnimmt." = 1,
                     "Ziemlich wichtig, dass der Wert nicht abnimmt." = 2,
                     "Ziemlich wichtig, dass der Wert seine Kaufkraft behält." = 3,
                     "Sehr viel wichtiger, dass der Wert seine Kaufkraft behält." = 4),
  
  qfm19 = c("Immer niedrigeres Risiko." = 1,
                     "Meistens niedrigeres Risiko." = 2,
                     "Keine Änderungen oder Änderungen ohne klares Ziel." = 3,
                     "Meistens höheres Risiko." = 4,
                     "Immer höheres Risiko." = 5),
  
  qfm20 = c("Gar keine." = 1,
                     "10%" = 2,
                     "20%" = 3,
                     "30%" = 4,
                     "40%" = 5, 
                     "50%" = 6,
                     "60%" = 7,
                     "70%" = 8,
                     "80%" = 9,
                     "90%" = 10,
                     "100%" = 11),
  
  qfm21 = c("Etwa gleich hoch wie die von kurzfristigen Spareinlagen.n." = 1,
                     "Etwa eineinhalb mal so hoch wie die von kurzfristigen Spareinlagen." = 2,
                     "Etwa doppelt so hoch wie die von kurzfristigen Spareinlagen." = 3,
                     "Etwa zweieinhalb mal so hoch wie die von kurzfristigen Spareinlagen." = 4,
                     "Etwa dreimal so hoch wie die von kurzfristigen Spareinlagen." = 5,
                     "Mehr als dreimal so hoch wie die von kurzfristigen Spareinlagen." = 6),
  
  qfm22 = c("Ich würde kein Risiko eingehen, wenn die Möglichkeit besteht, dass ich schlechter gestellt werde." = 1,
                     "Ich würde ein Risiko eingehen, wenn nur eine kleine Möglichkeit besteht, dass ich schlechter gestellt werde." = 2,
                     "Ich würde ein Risiko eingehen, wenn es eine Chance von über 50% gibt, dass ich besser gestellt werde.n." = 3),
  
  qfm23 = c("Auf jeden Fall den variablen Satz." = 1,
                     "Wahrscheinlich den variablen Satz." = 2,
                     "Wahrscheinlich den festen Satz." = 3,
                     "Auf jeden Fall den festen Satz." = 4),
  
  qfm24 = c("Sehr geringe oder keine Selbstbeteiligung – höchste Versicherungskosten." = 1,
                     "Kleine Selbstbeteiligung – höhere Versicherungskosten." = 2,
                     "Große Selbstbeteiligung – geringere Versicherungskosten." = 3,
                     "Sehr große Selbstbeteiligung – geringste Versicherungskosten." = 4),
  
  # 25 numeric input
  # qfm25 = c(seq(1, 100, 1)),
    
  # 1
  qfm26 = c("Männlich." = 1,
            "Weiblich." = 2,
            "Sonstiges." = 3),
  
  # 2 numeric input
  
  # 3
  qfm28 = c("Ich habe keinen höheren Schulabschluss." = 1,
            "Ich habe einen höheren Schulabschluss." = 2,
            "Handwerks- oder Diplomabschluss." = 3,
            "Universitäts- oder Hochschulabschluss." = 4),
  
  # 4
  qfm29 = c("Unter €10.000." = 1,
            "€10.000 - €24.999." = 2,
            "€25.000 - €49.999." = 3,
            "€50.000 - €99.999." = 4,
            "€100.000 - €249.999." = 5,
            "€250.000 - €499.999." = 6,
            "€500.000 oder mehr." = 7),
  
  # 5
  qfm30 = c("Ja." = 1,
            "Nein." = 2),
  
  # 6
  qfm31 = c("Unter €10.000." = 1,
            "€10.000 - €24.999." = 2,
            "€25.000 - €49.999." = 3,
            "€50.000 - €99.999." = 4,
            "€100.000 - €249.999." = 5,
            "€250.000 - €499.999." = 6,
            "€500.000 oder mehr." = 7),
  
  # 7 numeric input
  
  # 8
  qfm33 = c("Unter €5.000." = 1,
            "€5.000 - €12.499." = 2,
            "€12.500 - €24.999." = 3,
            "€25.000 - €49.999." = 4,
            "€50.000 - €99.999." = 5,
            "€100.000 - €249.999." = 6,
            "€250.000 - €499.999." = 7,
            "€500.000 - €999.999." = 8,
            "€1.000.000 - €2.499.999." = 9,
            "€2.500.000 - €4.999.999." = 10,
            "€5.000.000 - €9.999.999." = 11,
            "€10.000.000 oder mehr." = 12)
  
  )
  



#### Personality description ####
text1_t <- "Lorem ipsum dolor sit amet"
text1 <- "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet."
text2_t <- "Honesty-Humility"
text2 <- "Persons with very high scores on the Honesty-Humility scale avoid manipulating others for personal gain, feel little temptation to break rules, are uninterested in lavish wealth and luxuries, and feel no special entitlement to elevated social status. Conversely, persons with very low scores on this scale will flatter others to get what they want, are inclined to break rules for personal profit, are motivated by material gain, and feel a strong sense of self-importance."
text3_t <- "Emotionality"
text3 <- "Persons with very high scores on the Emotionality scale experience fear of physical dangers, experience anxiety in response to life's stresses, feel a need for emotional support from others, and feel empathy and sentimental attachments with others. Conversely, persons with very low scores on this scale are not deterred by the prospect of physical harm, feel little worry even in stressful situations, have little need to share their concerns with others, and feel emotionally detached from others."
text4_t <- "eXtraversion"
text4 <- "Persons with very high scores on the Extraversion scale feel positively about themselves, feel confident when leading or addressing groups of people, enjoy social gatherings and interactions, and experience positive feelings of enthusiasm and energy. Conversely, persons with very low scores on this scale consider themselves unpopular, feel awkward when they are the center of social attention, are indifferent to social activities, and feel less lively and optimistic than others do."
text5_t <- "Agreeableness (versus Anger)"
text5 <- "Persons with very high scores on the Agreeableness scale forgive the wrongs that they suffered, are lenient in judging others, are willing to compromise and cooperate with others, and can easily control their temper. Conversely, persons with very low scores on this scale hold grudges against those who have harmed them, are rather critical of others' shortcomings, are stubborn in defending their point of view, and feel anger readily in response to mistreatment."
text6_t <- "Conscientiousness"
text6 <- "Persons with very high scores on the Conscientiousness scale organize their time and their physical surroundings, work in a disciplined way toward their goals, strive for accuracy and perfection in their tasks, and deliberate carefully when making decisions. Conversely, persons with very low scores on this scale tend to be unconcerned with orderly surroundings or schedules, avoid difficult tasks or challenging goals, are satisfied with work that contains some errors, and make decisions on impulse or with little reflection."
text7_t <- "Openness to Experience"
text7 <- "Persons with very high scores on the Openness to Experience scale become absorbed in the beauty of art and nature, are inquisitive about various domains of knowledge, use their imagination freely in everyday life, and take an interest in unusual ideas or people. Conversely, persons with very low scores on this scale are rather unimpressed by most works of art, feel little intellectual curiosity, avoid creative pursuits, and feel little attraction toward ideas that may seem radical or unconventional."


finMet_1 <- "Bitte beantworten Sie alle Fragen. Wenn Ihnen keine der Antwortmöglichkeiten zusagt, wählen Sie die Antwort, die Ihrer eigentlich gewünschten Antwort am nächsten kommt."

finMet_2 <- "Abschließend folgen ein paar Fragen zu Ihrer Person, die uns helfen, das Verhaltensmuster Risikobereitschaft in unserer Gesellschaft besser zu verstehen. Bitte beachten Sie, dass Ihre Angaben in diesem Abschnitt freiwillig sind und somit keinen Bestandteil des Auswertungsprozesses darstellen. Es ist Ihnen freigestellt, die Fragen ganz, teilweise oder gar nicht zu beantworten."




