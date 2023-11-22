#importar la base de datos
FG <- read.csv("/Users/martinlopezscala/FG2000_2017.csv", sep=";")

#Clase de objeto
class(FG)

#Dimension de la base
dim(FG)

#Nombre de las variables
names(FG)

#Filtro booleano de registros completos
registro_completo <- complete.cases(FG)

#Clase de registro_completo
class(registro_completo)

#Tabla de registro_completo
table(registro_completo)

##Algunas consultas
#10 primeras companias
FG[1:10,]

#Otra manera
head(x = FG, n = 10)

#Companias con datos no completos
FG[!registro_completo, ]

#Companias mas valiosas: valor de mercado mayor a 369B
FG[FG$Value > 369, ]

#Companias mas valiosas y estan en el top 5
FG[(FG$Value > 369) & (FG$Rank <=5), ]

#Companias mas valiosas o estan en el top 5
FG[(FG$Value > 369) | (FG$Rank <=5), ]

#Companias mas valiosas y son de eeuu
FG[(FG$Value > 369) & (FG$Country == "United States"), ]

#Companias mas valiosas y no son de eeuu
FG[(FG$Value > 369) & (FG$Country != "United States"), ]

# Companias colombianas
FG_colombia <- FG[FG$Country == "Colombia", ]
FG_colombia

# Companias argentinas
FG_argentina <- FG[FG$Country == "Argentina", ]
FG_argentina

#Orgnizar companias argentinas por valor
FG_argentina[order(FG_argentina$Value, decreasing = TRUE), ]

View(FG)
