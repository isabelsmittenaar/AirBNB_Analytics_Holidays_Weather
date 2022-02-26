#Packages
library(dplyr)
library(tidyverse)
library(readr)

# Read csv.gz from url
Grabremote <- function(file_url) {
  print("Now downloading...")
  con <- gzcon(url(file_url))
  txt <- readLines(con)
  print("Done!")
  return(read.csv(textConnection(txt)))
}

#loading amsterdam
print("Amsterdam")
amsterdam<-Grabremote("http://data.insideairbnb.com/the-netherlands/north-holland/amsterdam/2021-03-04/data/calendar.csv.gz") 
amsterdam<-amsterdam %>% 
  group_by(date) %>% 
  mutate(avg_price = mean(parse_number(price), na.rm=TRUE)) %>% 
  distinct(date, avg_price, .keep_all = T) %>% 
  mutate(city = "amsterdam") %>% 
  select(city, date, avg_price) %>% 
  mutate(date = as.Date(date))
europe<-rbind(amsterdam)
rm(amsterdam)
print("Amsterdam downloaded and cleaned")

#loading Athens
print("Athens")
athens<-Grabremote("http://data.insideairbnb.com/greece/attica/athens/2021-03-20/data/calendar.csv.gz") 
athens<-athens %>% 
  group_by(date) %>% 
  mutate(avg_price = mean(parse_number(price), na.rm=TRUE)) %>% 
  distinct(date, avg_price, .keep_all = T) %>% 
  mutate(city = "athens") %>% 
  select(city, date, avg_price) %>% 
  mutate(date = as.Date(date))
europe<-rbind(europe, athens)
rm(athens)
print("Athens downloaded and cleaned")

#loading Riga
print("Riga")
riga<-Grabremote("http://data.insideairbnb.com/latvia/riga/riga/2021-03-29/data/calendar.csv.gz") 
riga<-riga %>% 
  group_by(date) %>% 
  mutate(avg_price = mean(parse_number(price), na.rm=TRUE)) %>% 
  distinct(date, avg_price, .keep_all = T) %>% 
  mutate(city = "riga") %>% 
  select(city, date, avg_price) %>% 
  mutate(date = as.Date(date))
europe<-rbind(europe, riga)
rm(riga)
print("Riga downloaded and cleaned")