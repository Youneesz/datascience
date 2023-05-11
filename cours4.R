#Netoyage des données

#Sous-ensembles

#Par indexation
library(questionr)
d <- hdv2003
dh <- d[d$sexe == "Homme",]
df <- d[d$sexe == "Femme",]
table(d$sexe)
View(df)
View(dh)

dh.25 <- d[d$sexe == "Homme" & d$age<=25,] #Pour séparation colonne avec ,
dim(dh.25)

View(dh.25)
  #Le problème de l'indexation est que cette méthodes enregistre les valeurs NA

summary(d$trav.satisf)
d.satisf <- d[d$trav.satisf == "Satisfaction",]
dim(d.satisf)
summary(d.satisf$trav.satisf) #Les valeurs NA sont pris en compte, donc on doit ajouter une autre condition

d.satisf <- d[d$trav.satisf == "Satisfaction" & !is.na(d$trav.satisf),] #is.na(champs) vérifie si la valeurs et NA
dim(d.satisf)
summary(d.satisf$trav.satisf)

#Par fonction subset
  #cette fonction permet d'obtenir des résultats non null directement
d.satisf <- subset(d, trav.satisf == "Satisfaction")
dim(d.satisf)

  #on utilise select pour selection des colonnes specifics
d2 <- subset(d, select = c(sexe, sport))
dim(d2)

d2 <- subset(d, age>25, select = -c(id, age, cinema))
dim(d2)


#Par extension DPLYR
#Même chose pour cette méthode, les valeurs NaN ne sont pas prise en compte
library(dplyr)
tbl <- as_tibble(hdv2003)
hommes_jeunes <- tbl %>% filter(sexe == "Homme", age < 30)
dim(hommes_jeunes)

#Formats de données textuelles
d <- tibble(
  nom = c("Mr Félicien Machin", "Mme Raymonde Bidule", "M. Martial Truc", "Mme Huguette Chose"),
  adresse = c("3 rue des Fleurs", "47 ave de la libération", "12 rue du 17 octobre 1961", "221 avenue de la libération"),
  ville = c("Nouméa", "Marseille", "Vénissieux", "Marseille")
)

View(d)
  #Concaténation de deux champs
conc <- paste(d$adresse, d$ville)
conc_avec_sep <- paste(d$adresse, d$ville, sep=" - ")
conc_avec_sep

  #Manipulation des lettres majuscules et min
library(stringr)
str_to_lower(conc_avec_sep)
str_to_upper(conc_avec_sep)
str_to_title(conc_avec_sep)

  #Découper une chaine de caractère
str_split(d$nom, " ")

str_split(d$nom, " ", simplify=TRUE) #Découper en matrice 

str_sub(d$ville, 1, 3) #Avoir des sous chaines de caractères

str_detect(d$adresse, "libération") #Chercher les chaine de caractères qui contiennent

str_count(d$ville, "s") #le nbre d'occurences d'un caractère

str_subset(d$adresse, "libération") #Que les chaines de caracères contenant libération

str_extract(d$adresse, "libération") #Extraire la valeur libération

str_replace(d$nom, "Mr", "M.") #remplace une valeur par une autre

str_replace_all(d$adresse, c("avenue" = "Avenue", "ave" = "Avenue", "rue" = "Rue"))

prenom <- "Fred"
age <- 18
anniversaire <- as.Date("2004-05-06")
str_glue("Je m'appelle {prenom}, j'ai {age}, je suis né en {format(anniversaire, '%A %d %B %Y')} ") #insérer des variables dans une chaine de caractères















