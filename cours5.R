library("tidyverse")

d <- tibble(
  nom = c("M. rené Bézigue", "Mme Paulette fouchin", "Mme yvonne
duluc", "M. Jean-Yves Pernoud"),
  naissance = c("18/04/1937 Vesoul", "En 1947 à Grenoble (38)", "Le
5 mars 1931 à Bar-le-Duc", "Marseille, juin 1938"),
  profession = c("Ouvrier agric", "ouvrière qualifiée",
                 "Institutrice", "Exploitant agric")
)

str_to_title(d$nom)


d$profession <- str_replace_all(data$profession, "agri", "agricole")
d$profession

str_detect(d$profession, "Ouvrier")

d$sexe <- case_when(
  str_detect(d$nom, '(M\\.)') ~ 'H',
  TRUE ~ 'F',
)

View(d)

d$annee <- str_extract(d$naissance, pattern = "\\d\\d\\d\\d")

adresses <- c("criquette.rockwell@gmail.com","brett.montg_omery@yahoo.fr","madge_laposte.net")

str_detect(adresses, pattern = '^[a-zA-Z0-9*].+@[:alpha:]+.[a-z.$]')

telephones <- c("02/23/23/35/45", "02.23.23.35.45", "02 23 23 35 45")

str_replace(telephones, pattern="[\\/| ]", "-")
  
str_replace_all(telephones, pattern="[\\/| ]", "-")





#ex1
gel <- function(temperature) {
  if (temperature < 0) {
    message("ça gèle.")
  }
  else {
    message("ça gèle pas.")
  }
}

gel(4)

#ex2
meteo <- function(temperature){
  if (temperature < 0) {
    message('ça caille.')
  }
  else if (temperature >= 0 & temperature < 15) {
    message('fais pas chaud')
  }
}

meteo(-3)

#ex3
moyenne_arrondie <- function(x, dec = NULL) {
  moy = mean(x)
  if (!is.null(dec)) {
    moy <- round(moy, dec)
    }
  return(moy)
}

moyenne_arrondie(c(3, 22, 7, 4, 3, 5), 2)  

#ex4
etendue <- function(x) {
  if (is.numeric(x)) {
    diff <- max(x) - min(x)
    return(diff) 
  }
  else {
    message('The vector is not numeric')
    diff <- NA
    return(diff)
  }
}

etendue(c("32", "dfd", 12, 65))
  








