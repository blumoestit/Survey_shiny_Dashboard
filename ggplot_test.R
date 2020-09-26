library(ggplot2)
library(tidyverse)

mean <- 3.19
sd <- 0.62
xintercept <- 2.82
y <- dnorm(mean, mean, sd)
y

perc_10 <- qnorm(0.1, mean, sd)
perc_90 <- qnorm(0.9, mean, sd)
perc_10
perc_90

insert_minor <- function(major_labs, n_minor) {labs <-
  c( sapply( major_labs, function(x) c(x, rep("", 4) ) ) )
labs[1:(length(labs)-n_minor)]}

ggplot(data = data.frame(x = c(0, 6)), aes(x)) +
        stat_function(fun = dnorm, n = 1126, args = list(mean = mean, sd = sd), size = 2.5, color = "#01A75A") +
        #geom_vline(aes(xintercept = mean)) +
        #geom_vline(aes(xintercept = xintercept), color = "#A7004E", size = 2) +
  geom_segment(aes(x = mean, xend = mean, y = 0, yend = y), linetype = "dashed", color = "#01A75A", size = 2, alpha = 0.7) +
  scale_x_continuous(expand = c(0.05, 0.1, 0.05, 0.05), limits = c(0.5, 5.5),
                     breaks = seq(1, 5, by = 1)) +
  scale_y_continuous(expand = c(0.02, 0, 0, 0.05)) +
  theme_classic() +
  theme(axis.line.x = element_line(size = 2, color = "#222D32"),
        axis.line.y = element_blank(),
        axis.text.x = element_text(size = 26, margin = margin(10, 0, 0, 0, "pt"), face = "bold", color = "#222D32"),
        axis.text.y = element_blank(),
        axis.title.x = element_text(size = 30, face = "bold", color = "#222D32",
                                    hjust = -0.0, vjust = 5.8
                                    ),
        axis.title.y = element_blank(),
        axis.ticks.length.x = grid::unit(10, "pt"),
        axis.ticks.x = element_line(size = 2),
        axis.ticks.y = element_blank(),
        plot.margin = margin(10, 40, 10, 40, "pt"),
        plot.title = element_text(size = 40, face = "bold.italic", color = "#222D32"),
        panel.background = element_rect(fill = "#ECF0F5"),
        plot.background = element_rect(fill = "#ECF0F5")
        ) +
  geom_text(aes(x = xintercept+0.1, y = y+0.12, label = paste0("Ihr Ergebnis: ", xintercept)),
            size = 12, color = "#A7004E", ) +
  geom_text(aes(x = mean, y = y+0.05, label = "Mittelwert der Vergleichsgruppe"),
            size = 12, color = "#01A75A", ) +
  annotate("segment", x = xintercept, xend = xintercept, y = 0, yend = y+0.08,
           color = "#A7004E", size = 3, alpha = 0.8) +
  xlab("Score") +
  ggtitle("Emotionalität")



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
  geom_point(aes(x = xintercept, y = 0.15), color = "#A7004E", size = 10) +
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



# ToothGrowth
# head(ToothGrowth)
#
# ggplot(ToothGrowth, aes(x=dose, y=len)) +
#   geom_boxplot() +
#   coord_flip()
#
# names=c(rep("A", 20) , rep("B", 8) , rep("C", 30), rep("D", 80))
# value=c( sample(2:5, 20 , replace=T) , sample(4:10, 8 , replace=T), sample(1:7, 30 , replace=T), sample(3:8, 80 , replace=T) )
# data=data.frame(names,value)
#
# ggplot(data, aes(x=names, y=value, fill=names)) +
#   geom_boxplot(alpha=0.7) +
#   stat_summary(fun.y=mean, geom="point", shape=20, size=14, color="red", fill="red") +
#   theme(legend.position="none") +
#   scale_fill_brewer(palette="Set1")
#
# data_box
# y_box <- c(1:5)
# x_box <- rep("A", 5)
# data_box <- data.frame(x_box, y_box)
#
# ggplot(data_box, aes(x = x_box, y = y_box)) +
#   geom_boxplot() +
#   coord_flip()





data_na <- data.frame(col1 = c(1, 5, NA, 4), col2 = c(NA, 1, 2, 3))

is.na(data_na)
any(is.na(data_na))
which(is.na(data_na$col1))


if (any(is.na(data_na$col2))) {
  print("Damn, it's NA")
  
}
library(ggplot2)
plot(cars)
p <- ggplot(cars, aes(x = speed, y = dist, color = dist)) + geom_point() 
p
text1

#### Plot to include in FinaMetrica Questionnaire ####

library(ggfortify)
ggdistribution(dnorm, seq(-3, 3, 0.1), mean = 0, sd = 1, fill = "blue") +
  theme_classic()

# ggplot(data = data.frame(x = c(0, 100)), aes(x)) +
#   stat_function(fun = dnorm,  args = list(mean = 50, sd = 8), size = 2.5, color = "#01A75A") +
  
  
  ggdistribution(dnorm, seq(0, 100, 0.2), mean = 50, sd = 7.5, fill = "#75BDD2", alpha = 1, colour = "#007E99") +
  scale_x_continuous(expand = c(0, 0), 
                     limits = c(0, 100),
                     breaks = seq(0, 100, by = 10)
                     ) +
  scale_y_continuous(expand = c(0, 0, 0, 0.005)) +
  theme_classic() +
  theme(axis.line.x = element_line(size = 1.5, color = "#222D32"),
        axis.line.y = element_line(size = 1.5, color = "#222D32"),
        axis.text.x = element_text(size = 26, margin = margin(10, 0, 0, 0, "pt"), face = "bold", color = "#222D32"),
        axis.text.y = element_blank(),
        axis.title.x = element_text(size = 26, margin = margin(10, 0, 0, 0, "pt"), face = "bold", color = "#222D32"),
        axis.title.y = element_text(size = 26, margin = margin(10, 0, 0, 0, "pt"), face = "bold", color = "#222D32",  vjust = 1, hjust = 1),
        axis.ticks.length.x = grid::unit(10, "pt"),
        axis.ticks.x = element_line(size = 1.5),
        axis.ticks.y = element_blank(),
        plot.caption = element_text(size = 32, margin = margin(-30, 0, 0, 10, "pt"), face = "bold", color = "#007E99", vjust = 0),
        plot.margin = margin(10, 40, 10, 40, "pt"),
        plot.title = element_text(size = 40, face = "bold.italic", color = "#222D32"),
        panel.background = element_rect(fill = "white"),
        plot.background = element_rect(fill = "white")
  ) + 
    xlab("Ergebnis") + 
    ylab("Häufigkeit") + 
    labs(caption = "Risikoscheu                                                                                            Risikobereit")
  

