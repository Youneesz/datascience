
library(dplyr)
install.packages("ggplot2")
library(ggplot2)

#syntaxe
#ggplot(data, aes(x, y)) + layers

load(url("http://egallic.fr/R/films.rda"))
head(films)

pays_liste <- c('United States of America', "New Zealand", "United Kingdom", "Spain")

films_reduit <- films %>% filter(country %in% pays_liste)

head(films_reduit)

ggplot(data=films, aes(x=estimated_budget, y=gross_revenue)) +
  geom_point(colour="dodger blue", alpha= .8)

ggplot(data=films, aes(x=estimated_budget, y=gross_revenue, col=country)) +
  geom_point()

ggplot(data=films, aes(x=estimated_budget, y=gross_revenue, col=country)) +
  geom_line()


df <- tibble(x= c(0, 0.2, 1, 0.75), y=c(0, 1, 1, 0.5))

ggplot() +
  geom_polygon(data=df, aes(x=x, y=y), fill="light green")

ggplot(data=films_reduit, 
       aes(x=country, y=runtime, fill=country)) +
  geom_boxplot()

ggplot(data=films_reduit, 
       aes(x=country, y=runtime, col=country)) +
  geom_jitter()

ggplot(data = films_reduit,
       aes(x = estimated_budget, y=gross_revenue))+
  geom_point() +
  geom_smooth()

ggplot(data=films_reduit, aes(x = runtime)) +
  geom_histogram(fill="dodger blue")

ggplot(data=films_reduit, aes(x=(estimated_budget/1000000)/runtime)) +
  geom_density(colour="black")

ggplot(data=films, aes(x=estimated_budget, y=gross_revenue)) +
  geom_point(colour="dodger blue", alpha= .8) +
  annotate("text", x=1e8, y=2e9, label="Du texte") +
  geom_vline(xintercept = seq(0, 3e8, by=1e8), size=1, col="dodger blue")

ggplot(data=films, aes(x=estimated_budget, y=gross_revenue)) +
  geom_point(colour="dodger blue", alpha= .8) +
  annotate("text", x=1e8, y=2e9, label="Du texte") +
  geom_hline(yintercept = seq(0, 2e9, by=1e9), col="gold", linetype='longdash')

ggplot(data=films, aes(x=estimated_budget, y=gross_revenue)) +
  geom_point(colour="dodger blue", alpha= .8) +
  annotate("text", x=1e8, y=2e9, label="Du texte") +
  geom_segment(aes(x = 0, xend=1e8, y=0, yend=1e9), col="black")

####

films_reduitold <- ifelse(films_reduit$year <= 2000, "ancien", "nouveau")
films_reduitold

p <- ggplot(data = films_reduit, 
            aes(x=estimated_budget,
                y=gross_revenue,
                colour=country,
                size=runtime)) +
  geom_point()

#p + facet_grid(films_reduitold ~ country)

#p + facet_grid(films_reduitold~country, margins = TRUE)

p + facet_wrap(facets=~country)


























  
  
