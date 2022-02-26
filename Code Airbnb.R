#Packages
library(dplyr)
library(tidyverse)

# Read csv.gz from url
Grabremote <- function(file_url) {
  print("Now downloading.")
  con <- gzcon(url(file_url))
  txt <- readLines(con)
  print("Done!")
  return(read.csv(textConnection(txt)))
}

#Load data
amsterdam<-Grabremote("http://data.insideairbnb.com/the-netherlands/north-holland/amsterdam/2021-03-04/data/calendar.csv.gz") 
paris<-Grabremote("http://data.insideairbnb.com/france/ile-de-france/paris/2021-03-04/data/calendar.csv.gz") 
london<-Grabremote("http://data.insideairbnb.com/united-kingdom/england/london/2021-03-05/data/calendar.csv.gz") 
dublin<-Grabremote("http://data.insideairbnb.com/ireland/leinster/dublin/2021-03-07/data/calendar.csv.gz") 
madrid<-Grabremote("http://data.insideairbnb.com/spain/comunidad-de-madrid/madrid/2021-03-07/data/calendar.csv.gz") 
rome<-Grabremote("http://data.insideairbnb.com/italy/lazio/rome/2021-03-07/data/calendar.csv.gz") 
vienna<-Grabremote("http://data.insideairbnb.com/austria/vienna/vienna/2021-03-07/data/calendar.csv.gz") 
lisbon<-Grabremote("http://data.insideairbnb.com/portugal/lisbon/lisbon/2021-03-08/data/calendar.csv.gz") 
berlin<-Grabremote("http://data.insideairbnb.com/germany/be/berlin/2021-03-12/data/calendar.csv.gz") 
prague<-Grabremote("http://data.insideairbnb.com/czech-republic/prague/prague/2021-03-13/data/calendar.csv.gz") 
brussels<-Grabremote("http://data.insideairbnb.com/belgium/bru/brussels/2021-03-17/data/calendar.csv.gz") 
athens<-Grabremote("http://data.insideairbnb.com/greece/attica/athens/2021-03-20/data/calendar.csv.gz") 
antwerp<-Grabremote("http://data.insideairbnb.com/belgium/vlg/antwerp/2021-03-26/data/calendar.csv.gz") 
copenhagen<-Grabremote("http://data.insideairbnb.com/denmark/hovedstaden/copenhagen/2021-03-27/data/calendar.csv.gz") 
oslo<-Grabremote("http://data.insideairbnb.com/norway/oslo/oslo/2021-03-27/data/calendar.csv.gz") 
stockholm<-Grabremote("http://data.insideairbnb.com/sweden/stockholms-l%C3%A4n/stockholm/2021-03-27/data/calendar.csv.gz") 
riga<-Grabremote("http://data.insideairbnb.com/latvia/riga/riga/2021-03-29/data/calendar.csv.gz") 
print("downloading complete!")

#combine data to single dataset
print("start merging dataframes...")
combined_data <- rbind(amsterdam, paris, london, dublin, madrid, rome, vienna, lisbon, berlin, prague, brussels, athens, antwerp, copenhagen, oslo, stockholm, riga)
print("datamerger complete ")

#cleaning the data
as.Date(combined_data$date)

data_datum_price <- combined_data %>%
  group_by(id, date, price) 

View(data_datum_price)
