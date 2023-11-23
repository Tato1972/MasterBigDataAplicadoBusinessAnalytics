#install.packages("dplyr")
#install.packages("ggplot2")
library(dplyr)
library(magrittr)
library(ggplot2)

data("diamonds", package = "ggplot2")
diamonds
?diamonds
diamonds %>% View
diamonds %>% group_by(cut) %>% summarise(conteo = n())

#tally. Equivalente al summarize
diamonds %>% group_by(cut) %>% tally()

diamonds %>%
  group_by(color) %>%
  tally() %>%
  arrange(desc(n))

#Precio promedio de los diamantes
diamonds %>%
  group_by(cut) %>%
  summarise(promedio = mean(price)) %>%
  arrange(desc(promedio))

diamonds %>%
  group_by(cut) %>%
  summarise(n = n()/nrow(.)) %>%
  select(n) %>%
  sum()

diamonds %>% group_by(cut, clarity) %>% tally()


#mean
diamonds %>%
  group_by(cut) %>%
  summarise(promedio = mean(price))

#varianza
diamonds %>%
  group_by(cut) %>%
  summarise(varianza = var(price))

#sd desviacion standard
diamonds %>%
  group_by(cut) %>%
  summarise(sd = sd(price))

#mediana
diamonds %>%
  group_by(cut) %>%
  summarise(mediana = median(price))

#min / max
diamonds %>%
  group_by(cut) %>%
  summarise(min_price = min(price),
            max_price = max(price))
diamonds %>%
  group_by(price > 5000) %>%
  tally()



