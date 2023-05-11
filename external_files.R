#Lire un fichier excel
library(readxl)
Liste_étudiants_LP_IASciD <- read_excel("C:/Users/ghsts/Downloads/Liste étudiants LP IASciD.xlsx")
View(Liste_étudiants_LP_IASciD)


#Fichier dbf
library(foreign)
donnees <- read.dbf('C:/Users/ghsts/Downloads/FD_POSTAN_2018.dbf')


#connection to database
library(DBI)
library(RSQLite)

#connection
con <- DBI::dbConnect(RSQLite::SQLite(), dbname="bdd.sqlite")
data("mtcars")
mtcars$name <- rownames(mtcars)
#importing mtcars data to mtcars R table
dbWriteTable(con, "mtcars", mtcars)
dbDisconnect(con)

con <- DBI::dbConnect(RSQLite::SQLite(), dbname="bdd.sqlite")
#List the tables our database
dbListTables(con)
#List the fields of our table mtcars
dbListFields(con, "mtcars")
#Putting the data from our database to a Dataset 
cars <- dbReadTable(con, "mtcars")
#query select to view the cars who have above 4 cyl
dbGetQuery(con, "SELECT * FROM mtcars WHERE cyl = 4")
dbDisconnect(con)


#Import from json file
#install rjson
install.packages("rjson")
library(rjson)

#loading data from a json file using fromJSON function
result <- fromJSON(file="C:\\Users\\ghsts\\Downloads\\jsonR.json")
print(result)

#Writing in a json file using toJSON() and write() functions
library("rjson")
list1 <- vector(mode="list", length=2)
list1[[1]] <- c("sunflower", "guava", "hibiscus")
list1[[2]] <- c("flower", "fruit", "flower")
jsonData <- toJSON(list1)
write(jsonData, "result.json")
result <- fromJSON(file = "result.json")
print(result)

#Convert JSON data to a dataframe
result <- fromJSON(file="C:\\Users\\ghsts\\Downloads\\jsonR.json")
json_data_frame <- as.data.frame(result)
print(json_data_frame)

install.packages("RJSONIO")
library(RJSONIO)

Raw <- fromJSON("https://data.ny.gov/api/views/9a8c-vfzj/rows.json?accessType=DOWNLOAD")
food_market <- Raw[['data']]
Names <- sapply(food_market, function(x) x[[14]])
head(Names)

#Local file 
#reading
library(tidyverse)
url <- "https://data.cityofnewyork.us/api/views/ia2d-e54m/rows.csv"
df <- read_csv(url)
head(df)


#XML
install.packages("XML")
library(XML)
library("methods")
xmlresult <- xmlParse(file = "C:\\Users\\ghsts\\Downloads\\input.xml")
print(result)

#checking how many nodes are there in an XML file
rootnode <- xmlRoot(result)
rootsize <- xmlSize(rootnode)
print(rootsize)

#print specific node
print(rootnode[1])


#Data using an API
library(jsonlite)
url_urssaf_fr <- "https://open.urssaf.fr/api/records/1.0/search/?dataset=effectifs-salaries-et-masse-salariale-du-secteur-prive-par-region-x-na38&q=&rows=10000&facet=grand_secteur_d_activite&facet=secteur_na28i&facet="
reponse_urssaf_fr <- fromJSON(url_urssaf_fr)
urssaf_fr <- reponse_urssaf_fr$records$fields
library(data.table)
data.table(urssaf_fr)



