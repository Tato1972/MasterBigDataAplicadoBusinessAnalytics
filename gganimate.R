library(ggplot2)
library(gganimate)
library(av)
library(gifski)
library(gapminder)
library(dplyr)

theme_set(theme_bw())

## 1) transition_time
head(gapminder)

p <- ggplot(data = gapminder,
            aes(x = gdpPercap, y = lifeExp, size = pop, colour = continent)) + 
  geom_point(show.legend = FALSE, alpha = 0.7) +
  labs(x = "GDP per capita", y = "Life Expectancy")

p

p + transition_time(year) +
  labs(title = "year: {frame_time}")

p + facet_wrap(~continent) +
  transition_time(year) +
  labs(title = "year: {frame_time}")

p + transition_time(year) +
  labs(title = "year: {frame_time}") +
  view_follow(fixed_y = TRUE)

p + transition_time(year) +
  labs(title = "year: {frame_time}") +
  shadow_wake(wake_length = 0.1, alpha = FALSE)


## 2) transition_reveal

head(airquality)

p <- ggplot(data = airquality,
            aes(x = Day, y = Temp, group = Month, color = factor(Month))) +
  geom_line() +
  labs(x = "Dia del mes", y = "Temperatura") +
  theme(legend.position = "top")

p

p + transition_reveal(Day) +
  labs(title = "Dia: {frame_along}")

p + geom_point() +
  transition_reveal(Day)
  

## 3) transition_state

airquality
mean.temp <- airquality %>%
  group_by(Month) %>%
  summarise(Temp = mean(Temp))

mean.temp

p <- ggplot(data = mean.temp,
            aes(x = Month, y = Temp, fill = Temp)) +
  geom_col()

p

p + transition_states(Month, wrap = FALSE) +
  shadow_mark() +
  labs(title = "mes: {closest_state}")

?mtcars

p <- ggplot(data = mtcars,
            aes(x = factor(cyl), y = mpg, fill = cyl)) +
  geom_boxplot()

p

animacion <- p + transition_states(am) +
  labs(title = "Transmision: {closest_state}")

#anim_save("Directorio/Carpeta/boxplot.gif, animacion")


