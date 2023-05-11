
dataset <- table(c("Prénom", "Erika", "Célia", "Eric", "Eve", "Paul", "Jean", "Adan", "Louis", "Jules", "Léo"),
                 c("Sexe", "F","F","G","F", "G", "G","G","G","G","G"),
                 c("Poids", 16, 14, 13.5, 15.4, 16.5, 16, 17, 14.8, 17, 16.7),
                 c("Taille", 100, 97, 95.5, 101, 100, 98.5, 103, 98, 101.5, 100))

individus <- dataset$Prenom
poids <- dataset$Poids
taille <- dataset$Taille
sexe <- dataset$Sexe

moyenne_poids <- mean(poids)
moyenne_taille <- mean(taille)

IMC <- c(poids/(taille**2))

ensemble <- c(moyenne_poids, moyenne_taille, IMC)




summary(tp1$age)

max(tp1$age)

d1 <- tp1[tp1$sexe == "F" & tp1$age < 45, ]
summary(d1$age)
summary(d1$sexe)

tp1[tp1$age >= 45,]































