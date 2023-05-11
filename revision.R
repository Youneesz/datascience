#création des vecteurs

vec <- 1:6
vec
vec <- c(1:6)
vec
vec <- seq(1, 6)
vec
repp <- rep(1, 6)
repp
x <- c('Bonjour', 'hello')
x
t <- paste(x, c("testing test"), sep = "-")
t
t <- paste(x, rep('test', 10), collapse = " ")
t
substr(t, 3, 4)

#création des facteurs

y <- factor(c(4, 2, 4, 8, 6, 2))
y
levels(y)
attributes(y)
nlevels(y)
levels(y) <- c('two', 'four', 'six', 'eight')
y[1]

nv <- ordered(y)
nv

mat <- matrix(c(1:6), nrow=2, ncol=3)
mat

mlist <- list(c(1:6), mat)
mlist
mlist[[2]][1]
names(mlist) <- c('vec', "mat")
names(mlist)

x <- c(1:6)
y <- rep(c(1,0), each=3)
y

df <- data.frame(x, y)
df

library(labelled)
library(questionr)
library(tidyverse)
look_for(hdv2003)
describe(hdv2003)

library(dplyr)
class(x)


#sous-ensembles
library(questionr)
data("hdv2003")
d <- hdv2003

#par indexation
dh <- d[d$age >= 30,]
dh

#par subset fct
df <- subset(d, trav.satisf == 'Satisfaction')
df
summary(d$trav.satisf)
dim(df)

df <- subset(d, select = c(sexe, sport), trav.satisf == 'Satisfaction')
df

library(dplyr)
df2 <- df %>% filter(sexe == 'Homme', sport == 'Oui')
df2

library(stringr)
d <- tibble(
  prenom = c("Younes", "Abdessamad", "Amine"),
  ville = c('Meknes', 'fes', "rabat")
)

str_to_lower(d$prenom)
str_to_upper(d$prenom)
str_to_title(d$prenom)
str_split(d$prenom[1], "u")
str_split(d$prenom[1], 'u', simplify = TRUE)
str_sub(d$prenom[1], 1, 3)
str_detect(d$prenom, "e")
str_count(d$prenom, "e")
str_subset(d$prenom, "e")
str_extract(d$prenom, "e")
str_replace(d$prenom, "e", "E")
d$prenom <- str_replace_all(d$prenom, c("Y" = "y", "e" = "E"))
d$prenom
str_glue(
  "Je m'appelle {d$prenom[1]}. J'habite à {d$ville[1]}"
)


fct <- function(x) {
  val <- 2
  nv_val <- 3
  print(paste("Valeur : ", val))
  print(paste("Nv valeur : ", nv_val))
  x + val
}

fct(2)

#' @title testing function
#' @description this a testing function for profiles 
#' @param x vecteur 

library(profvis)
profvis({
  mean_2 <- function(x) {
  if (!is.null(dim(x))) {
    colMeans(x)
  }
  else {
    mean(x)
  }
}
})


mean_2(1:6)
traceback()

install.packages('bench')
library(bench)

mark(mean_2(1:100000))

Rprof(interval=0.001)
mean_2(1:1000000)
Rprof(NULL)

summaryRprof("Rprof.out")

install.packages("nycflights13")
library(nycflights13)
data(flights)
data(airports)
data(airlines)

slice(airports, 345)
slice(airports, 1:5)
slice_head(airlines, n = 3)
slice_tail(airlines, n= 3)
slice_max(flights, dep_delay)
slice_min(flights, dep_delay)

filter(flights, month == 1)
select(airports, lat, lon)
select(airports, -lat, -lon)
select(flights, starts_with("dep_"))
select(flights, year:day)

rename(airports, longitude=lon, latitude=lat)
tmp <- rename(
  flights, 
  "retard départ" = dep_delay,
  "retard arrivée" = arr_delay
)
tmp

arrange(flights, month, dep_delay)
arrange(flights, month, desc(dep_delay))
flights <- mutate(flights, duree_h = air_time/60)
select(flights, duree_h)

library(dplyr)
result <- flights %>% 
  filter(dest=='LAX') %>% 
  select(month, dep_delay, arr_delay) %>% 
  arrange(dep_delay) %>%
  group_by(month)
result

t1 <- tibble(
  name = c('Younes', 'salim', 'sudem'),
  skills = c('high', 'very low', 'low')
)

t2 <- tibble(
  game = c('League', 'Valorant', 'Valorant')
)

t3 <- bind_cols(t1, t2)
t3

tab <- tibble(
  skills = c('high', 'very low', 'medium', 'low'),
  info = c('test', 'testing', 'fffff', 'tttest')
)

tab2 <- inner_join(t3, tab)
tab2

tab2 <- full_join(t3, tab)
tab2

tab3 <- right_join(t3, tab)
tab3

tab4 <- left_join(t3, tab)
tab4

full_join #toutes les lignes de x et y
inner_join #les lignes présentes dans x et y
semi_join #les lignes présentes dans x et y mais sans colonnes de y
anti_join #les lignes présentes dans x et non pas dans y

#graphs
load(url('http://egallic.fr/R/films.rda'))
head(films)
View(films)

library(dplyr)
pays_liste <- c('United States of America', 'United Kingdom', 'Spain', 'France', 'United Kingdom')
film_data <- films %>% filter(country %in% pays_liste)
film_data

ggplot(data=films, aes(x = estimated_budget, y = gross_revenue)) +
  geom_point(colour = 'dodger blue', alpha = 0.8)

ggplot(data=film_data, aes(x = estimated_budget, y = gross_revenue, col = country)) +
  geom_point()

ggplot(data=film_data, aes(x = estimated_budget, y = gross_revenue, col = country)) +
  geom_line()

df <- tibble(x=c(0, 0.2, 1, 0.75), y=c(0, 1, 1, 0.5))

ggplot() +
  geom_polygon(data=df, aes(x=x, y=y), fill='red')

ggplot(data = film_data, aes(x=country, y=runtime, fill=country)) +
  geom_boxplot()

ggplot(data = film_data, aes(x = country, y = estimated_budget, col=country)) +
  geom_jitter() 

ggplot(data=film_data, aes(x = estimated_budget, y = gross_revenue)) +
  geom_point(colour = 'dodger blue', alpha = 0.8) +
  geom_smooth()

ggplot(data=film_data, aes(x=runtime)) +
  geom_histogram(fill="dodger blue")

ggplot(data = film_data, aes(x=(estimated_budget/1000000)/runtime)) +
  geom_density(colour='black') +
  geom_vline(xintercept = seq(0, 0.75, by=0.5), size=1, col="dodger blue") +
  geom_hline(yintercept = seq(0, 0.75, by=0.5), size=1, col="dodger blue", linetype="longdash") +
  geom_segment(aes(x=0, xend=2.0, y = 0, yend=0.75), col='blue') +
  geom_abline(intercept = 0, slope = 1)

film_data$old <- ifelse(film_data$year <= 2000 , "ancien", "nouveau")
View(film_data)

ggplot(data = film_data, aes(x = estimated_budget, y = gross_revenue, colour = country, size = runtime)) +
  geom_point() +
  facet_grid(old~country, margins=TRUE)

ggplot(data = film_data, aes(x = estimated_budget, y = gross_revenue, colour = country, size = runtime)) +
  geom_point() +
  facet_wrap(facets = ~ country + old)

ggplot(data = film_data, aes(x = estimated_budget, y = gross_revenue, colour = country, size = runtime)) +
  geom_point() + 
  facet_grid(old ~ country, margins="country")








