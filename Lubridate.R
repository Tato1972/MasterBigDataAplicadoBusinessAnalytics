library(lubridate)
library(tidyverse)

as_datetime(3600)
as_datetime(100000)

as_date(10)

date1 <- "2018-07-16"
date2 <- "2020-09-12"

class(date1)

#Numero de dias
date2 - date1

date1 <- as_date("2018-07-16")
date2 <- as_date("2020-09-12")

#Numero de dias
date2 - date1

class(date1)

year(date1)
month(date1)
day(date1)

semester(date1, with_year = TRUE)

quarter(date1)

wday(date1, label = TRUE)

today("America/Mexico_City")

now()

grep("Mexico", OlsonNames(), value = TRUE)

airquality2 <- airquality %>%
  mutate(fecha = paste(Day, Month, "2021", sep = "-"))

airquality2

glimpse(airquality2)

airquality2 %>% filter(fecha >= "2021-06-30") #No funciona como filtro por el campo fecha

airquality2 <- airquality2 %>%
  transform(fecha = dmy(fecha))

airquality2 %>% filter(fecha >= "2021-06-30")
