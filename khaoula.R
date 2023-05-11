tab <- note_gras

library(dplyr)
library(ggplot2)
synthese = tab %>% group_by(gras, calories, proteines, sodium, fibres) %>% summarise(m=mean(note_attribuee, na.rm = T), sd=sd(note_attribuee, na.rm = T))

synthese$gras = factor(synthese$gras, labels=c("un peu","modérément","beaucoup"))

print(synthese)

graphe = ggplot(tab, aes(x=note_attribuee, fill=gras)) +
  geom_bar(stat="count", width=0.8, position= position_dodge2(preserve="single")) +
  facet_grid(. ~ calories) +
  geom_text(aes(label = after_stat(count)), width=1, stat = "count", vjust=+1, position = position_dodge(0.8), colour="white") +
  ylab("effectif") + theme_classic() +
  theme(legend.position="top")


options(repr.plot.width = 10, repr.plot.height = 10)
graphe


ggplot(synthese, aes(x = calories, y=m))

print(m)
