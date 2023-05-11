
#création des vecteurs numériques
1:6
c(1, 4, 2)
rep(c(1,3), each=3)


#création des vecteurs caracteres
c("bonjour", "hello", "hallo")
rep(c("test", "testing", "tests"), times=2)
rep(c("tr", "fg", "df"), each=2)

#concatenation des caracteres
nom <- paste(rep("te1", 10), 1:10 ,sep='.')
#vecteur plusieurs vals à un vecteur une seul valeur
paste(c("x", "y"), 1:5, sep=":", collapse = ":")

#cutting string
substr("freerider", 5, 9)


#vecteurs logiques
#vecteurs binaires, vrai ou faux...

#Exemple
1<4

#LES FACTEURS
#manipulation de données qualitatives 
#creation factor ou as.factor
#as... SIGNIFIE LA CONVERSION 
y <- c("M", "F", "F", "M", "F")
yf <- factor(y)
yf #shows levels, the data that a variable can take
    #Levels : F M 

#Factor attributes 
attributes(yf) #gives the levels and class of the factor
levels(yf) #get levels of factor
nlevels(yf) #get the number of levels of the factor

#Rename attributes or levels 
levels(yf) <- c("M1", "F1")
levels(yf)
yf

#conversion vector to factor
vec <- c("T1", "T2", "T3", "T1", "T1")
vec

fac <- as.factor(vec)
fac

#Ordered factors 
niveau <- ordered(c("Debutant", "Debutant", "Expert", "Champion", "Expert", "Debutant"))
levels <- (c("Debutant", "Expert", "Champion"))
niveau

#Les matrices
#->MONOTYPE
#->objet repéré par ligne colonne
#->longueur = length et mode = mode des éléments de la matrice

#Création des matrices
matx <- matrix(c(1:6), nrow = 2, ncol = 3, byrow = TRUE)
matx

maty <- matrix(1:2, ncol=1)
maty

matz <- matrix(3:1, nrow=3)
matz
dim(matz)
mode(matz)
length(matz)

#LISTES
#ensemble ORDONNE qui n'ont pas le meme mode ou longueur
#length, mode et names (prendre une valeur specifique de la liste)
#plus générales et plus utilisées que vec et fac

#création avec fonction list
maListe <- list(c(paste(c("A", "B", "C", "D", "E"), matrix(1:4, 2, 2), sep = ":")))
length(maListe)
names(maListe) <- c(paste("vec", 1:5, sep = ":"))
names(maListe)

maListe$vec
maListe$mat

listtt <- list("test", 12)
names(listtt) <- c("val1", "val2")
names(listtt)
#DATAFRAMES
#Les plus utilisés
#composantes meme longueur mais mode different

#Création

#->data.frame concat des vecteurs de meme tailles et des modes diffs
#->read.table importer un tableau d'un fichier externe
#->as.data.frame conversion d'un objet de deux dimensions a un dataframe

#Valeur manquante = NA

#Extensions 

#TIDYVERSE (Tidy + verse)

#->visualisation
#->manipulation des tableaux données
#->import/export
#->manipulation des variables..

#installation 
install.packages("tidyverse")

#tidyverse et faite pour le netoyage des données 
#Principes :

#->variable = col
#->observation = ligne
#->type observation = table différente

#format tibbles = dataframes modernes
#->pas de noms de lignes
#->autorise les noms invalid de colonnes
#->s'affiche intelligemment: seuls les premières lignes
#->avertissement si colonne n'existe pas


#Inspection visuelle des données
#view...
#str
#summary


#Extension DPLYR

#glimpse: visualiser rapidement de manière condensée (in library dplyr)
glimpse(hdv2003)
#look_for(): lister les differentes variables (in library labelled)
look_for(hdv2003)
look_for(hdv2003, "trav")

#describe(): decrire les variables du tableau de données (in library questionr)
library(questionr)
describe(hdv2003)

#library data.table pour les grandes nombres de données
library(data.table)

#Fonctions des data.table setDT et setDF pour modifications directement de l'objet 
#en mémoire pour utiliser moins de ressources système et plus rapid

#setDT converti un tableau en data.table
#setDF opposé a setDT

































