library(ggplot2)
library(dplyr)
library(magrittr)

zinc <- c(3, 5.8, 5.6, 4.8, 5.1, 3.6, 5.5, 4.7, 5.7, 5, 5.9, 5.7, 4.4, 5.4, 4.2, 5.3)
length(zinc)

#Graficos sin ggplot. Son de libreria graphics que viene ya en R
hist(zinc)
boxplot(zinc)
plot(density(zinc), col = "blue")

#Con ggplot2

?mtcars

qplot(x = mpg, y = wt, data = mtcars, geom = "point")

qplot(x = mpg, y = wt, data = mtcars, geom = c("point", "smooth"))

qplot(x = mpg, y = wt, data = mtcars, geom = "point", colour = am)

mtcars <- mtcars %>% transform(cyl = as.factor(cyl))

glimpse(mtcars)

qplot(x = mpg, y = wt, data = mtcars, geom = "point", colour = cyl, shape = cyl)

wdata <- data.frame(genero = factor(rep(c("H", "M"), each = 200)),
                    peso = c(rnorm(200, 60), rnorm(200, 55)))

qplot(x = genero, y = peso, data = wdata, geom = "boxplot", fill = genero)

qplot(x = genero, y = peso, data = wdata, geom = "violin", fill = genero)

qplot(x = genero, y = peso, data = wdata, geom = "dotplot", stackdir = "center", binaxis = "y", dotsize = 0.5)

qplot(peso, data = wdata, geom = "histogram", fill = genero)

qplot(peso, data = wdata, geom = "density", color = genero, linetype = genero)

#ggplot

ggplot(data = mtcars, aes(x = wt, y = mpg)) + geom_point()

ggplot(data = mtcars, aes(x = wt, y = mpg)) + geom_point(size = 2, shape = 23)

ggplot(wdata, aes(x = peso)) + geom_density()

ggplot(wdata %>% filter(genero == "H"), aes(x = peso)) + geom_density()

ggplot(wdata, aes(x = peso)) + stat_density()

mtcars

my_pie <- mtcars %>%
  group_by(cyl) %>%
  summarise(n = n())

my_pie

ggplot(my_pie, aes(x = "", y = n, fill = cyl)) + 
  geom_bar(stat = "identity") +
  coord_polar("y", start = 0)


#geom_area()
#geom_density()
#geom_dotplot()
#geom_freqpoly()
#geom_histogram()
#stat_ecdf()
#stat_qq()

#En forma global para los graficos
#theme_set(theme_dark())

a <- ggplot(wdata, aes(x = peso))

a + geom_density()
a + geom_dotplot()
a + geom_histogram() + theme_dark()
a + stat_ecdf() + ggtitle("Distribucion acumulada") + xlab("Mi eje x") + ylab("Mi eje y")

wdata
ggplot(wdata %>% filter(genero == "M"), aes(sample = peso)) + stat_qq()


