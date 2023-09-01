#TRABAJO FINAL MASTER  2-Carga de los datos y análisis descriptivo

#Preparo sesion de trabajo
sessionInfo()
getwd()
ls()
#Cargo librerias a utilizar durante la tarea
library(knitr)
library(ggplot2)
library(xtable)
library(corrplot)
library(reshape)
library(dplyr) 

#Cargo archivo que contiene descripciones para las columnas en los diversos archivos de datos.
#Al trabajo se adjunta planilla excel que contiene este detalle.

#HomeCredit_description =read.table("../Downloads/HomeCredit_description.csv", row.names=NULL, sep=",", header=TRUE)
#kable(head(HomeCredit_description[,1:5]))
#tail(HomeCredit_description)
#nrow(HomeCredit_description)
#ncol(HomeCredit_description)
#str(HomeCredit_description)
#summary(HomeCredit_description)
#View(HomeCredit_description)

#Carga datos/análisis/limpieza NA/ gráficos de variables categóricas y calculo de correlación variables numéricas del file application_train:
#El file contiene los datos principales de capacitación y pruebas con información sobre cada solicitud de 
#préstamo en Home Credit. Cada préstamo tiene su propia fila y se identifica mediante la función SK_ID_CURR. 
#Los datos de la solicitud de capacitación vienen con el OBJETIVO que indica 0: el préstamo se pagó o 1: el préstamo no se pagó.

application_train =read.table("../Downloads/application_train.csv", row.names=NULL, sep=",", header=TRUE)
kable(head(application_train[,1:5]))
nrow(application_train)
ncol(application_train)
summary(application_train)
str(application_train)
application_trainsinNA = na.omit(application_train)
names(application_trainsinNA) 
nrow(application_trainsinNA)
ncol(application_trainsinNA)
summary(application_trainsinNA)
str(application_trainsinNA)
View(application_trainsinNA)
table(application_trainsinNA$TARGET) 

boxplot(application_trainsinNA$DAYS_EMPLOYED) 

hist(application_train$TARGET, main = "Fig 1.1: Histograma objetivo, plot 1", cex.main=0.8)
hist(application_train$DAYS_BIRTH/365*-1, main = "Fig 1.2: Histograma Edad, plot 2", cex.main=0.8)
hist(application_train$DAYS_EMPLOYED, main = "Fig 1.3: Histograma Antiguedad empleo, plot 3", cex.main=0.8)#Hay valores extremos
hist(application_trainsinNA$TARGET, main = "Fig 1.1: Histograma objetivo, plot 1", cex.main=0.8)
hist(application_trainsinNA$DAYS_BIRTH/365*-1, main = "Fig 1.2: Histograma Edad, plot 2", cex.main=0.8)
hist(application_trainsinNA$DAYS_EMPLOYED, main = "Fig 1.3: Histograma Antiguedad empleo, plot 3", cex.main=0.8)#Hay valores extremos
hist(application_trainsinNA$CNT_CHILDREN, main = "Fig 1.4: Histograma Hijos, plot 4", cex.main=0.8)
hist(application_trainsinNA$AMT_INCOME_TOTAL, main = "Fig 1.5: Histograma AMT_INCOME_TOTAL, plot 5", cex.main=0.8)
hist(application_trainsinNA$AMT_CREDIT, main = "Fig 1.6: Histograma AMT_CREDIT, plot 6", cex.main=0.8)
hist(application_train$AMT_ANNUITY, main = "Fig 1.7: Histograma AMT_ANNUITY, plot 7", cex.main=0.8)
hist(application_trainsinNA$AMT_GOODS_PRICE, main = "Fig 1.8: Histograma AMT_GOODS_PRICE, plot 8", cex.main=0.8)
hist(application_trainsinNA$REGION_POPULATION_RELATIVE, main = "Fig 1.9: Histograma REGION_POPULATION_RELATIVE, plot 9", cex.main=0.8)
hist(application_trainsinNA$DAYS_REGISTRATION, main = "Fig 1.10: Histograma DAYS_REGISTRATION, plot 10", cex.main=0.8)
hist(application_trainsinNA$DAYS_ID_PUBLISH, main = "Fig 1.11: Histograma DAYS_ID_PUBLISH, plot 11", cex.main=0.8)
hist(application_trainsinNA$OWN_CAR_AGE, main = "Fig 1.12: Histograma OWN_CAR_AGE, plot 12", cex.main=0.8)
hist(application_trainsinNA$CNT_FAM_MEMBERS, main = "Fig 1.13: Histograma CNT_FAM_MEMBERS, plot 13", cex.main=0.8)
hist(application_trainsinNA$EXT_SOURCE_1, main = "Fig 1.14: Histograma EXT_SOURCE_1, plot 14", cex.main=0.8)
hist(application_trainsinNA$EXT_SOURCE_2, main = "Fig 1.15: Histograma EXT_SOURCE_2, plot 15", cex.main=0.8)
hist(application_trainsinNA$EXT_SOURCE_3, main = "Fig 1.16: Histograma EXT_SOURCE_3, plot 16", cex.main=0.8)
hist(application_trainsinNA$YEARS_BUILD_AVG, main = "Fig 1.17: Histograma YEARS_BUILD_AVG, plot 1", cex.main=0.8)
hist(application_trainsinNA$AMT_REQ_CREDIT_BUREAU_HOUR, main = "Fig 1.18: Histograma AMT_REQ_CREDIT_BUREAU_HOUR, plot 18", cex.main=0.8)
hist(application_trainsinNA$AMT_REQ_CREDIT_BUREAU_DAY, main = "Fig 1.19: Histograma AMT_REQ_CREDIT_BUREAU_DAY, plot 19", cex.main=0.8)
hist(application_trainsinNA$AMT_REQ_CREDIT_BUREAU_WEEK, main = "Fig 1.20: Histograma AMT_REQ_CREDIT_BUREAU_WEEK, plot 20", cex.main=0.8)
hist(application_trainsinNA$AMT_REQ_CREDIT_BUREAU_MON, main = "Fig 1.21: Histograma AMT_REQ_CREDIT_BUREAU_MON, plot 21", cex.main=0.8)
hist(application_trainsinNA$AMT_REQ_CREDIT_BUREAU_QRT, main = "Fig 1.22: Histograma AMT_REQ_CREDIT_BUREAU_QRT, plot 22", cex.main=0.8)
hist(application_trainsinNA$AMT_REQ_CREDIT_BUREAU_YEAR, main = "Fig 1.23: Histograma AMT_REQ_CREDIT_BUREAU_YEAR, plot 23", cex.main=0.8)

qplot(factor(application_trainsinNA$NAME_CONTRACT_TYPE), main = "Fig 1.24: Diagrama de barras tipo contrato") 
qplot(factor(application_trainsinNA$CODE_GENDER), main = "Fig 1.25: Diagrama de barras genero") 
qplot(factor(application_trainsinNA$FLAG_OWN_CAR), main = "Fig 1.26: Diagrama de barras tienen auto")
qplot(factor(application_trainsinNA$FLAG_OWN_REALTY), main = "Fig 1.27: Diagrama de barras tienen inmueble")
qplot(factor(application_trainsinNA$NAME_TYPE_SUITE), main = "Fig 1.28: Diagrama de barras Acompañantes")
qplot(factor(application_trainsinNA$NAME_INCOME_TYPE), main = "Fig 1.29: Diagrama de barras Tipo de ingreso")
qplot(factor(application_trainsinNA$NAME_EDUCATION_TYPE), main = "Fig 1.30: Diagrama de barras Tipo de educación")
qplot(factor(application_trainsinNA$NAME_FAMILY_STATUS), main = "Fig 1.31: Diagrama de barras Estatus Familiar")
qplot(factor(application_trainsinNA$NAME_HOUSING_TYPE), main = "Fig 1.32: Diagrama de barras Tipos Inmueble")
qplot(factor(application_trainsinNA$OCCUPATION_TYPE), main = "Fig 1.33: Diagrama de barras Ocupación")
qplot(factor(application_trainsinNA$WEEKDAY_APPR_PROCESS_START), main = "Fig 1.34: Diagrama de barras Dias de la semana/Inicio")
qplot(factor(application_trainsinNA$ORGANIZATION_TYPE), main = "Fig 1.35: Diagrama de barras Tipo organización donde trabaja")
qplot(factor(application_trainsinNA$FONDKAPREMONT_MODE), main = "Fig 1.36: Diagrama de barras Info normalizada")
qplot(factor(application_trainsinNA$HOUSETYPE_MODE), main = "Fig 1.37: Diagrama de barras Info Tipo Vivienda")
qplot(factor(application_trainsinNA$WALLSMATERIAL_MODE), main = "Fig 1.38: Diagrama de barras Materiales construccion")
qplot(factor(application_trainsinNA$EMERGENCYSTATE_MODE), main = "Fig 1.39: Diagrama de barras Estado")

DAYS_BIRTH= application_trainsinNA$DAYS_BIRTH/365*-1

#Matriz correlaciones fichero train
application_trainsinNACor <- cor(application_trainsinNA[,
c("TARGET","AMT_INCOME_TOTAL","AMT_CREDIT","AMT_ANNUITY","AMT_GOODS_PRICE","DAYS_BIRTH","EXT_SOURCE_1","EXT_SOURCE_2",
  "EXT_SOURCE_3","DAYS_EMPLOYED","DAYS_REGISTRATION","DAYS_ID_PUBLISH","OWN_CAR_AGE","HOUR_APPR_PROCESS_START",
  "DAYS_LAST_PHONE_CHANGE")
])
col <- colorRampPalette(c("#BB4444", "#EE9988", "#FFFFFF", "#77AADD", "#4477AA")) 
corrplot(application_trainsinNACor, method = "shade", tl.col = "black",
         tl.srt = 10, col = col(40), addCoef.col="black", order="AOE",
         mar = c(1,1,1,1), line= -1, is.corr=FALSE,
         main = "Fig 1.40: Predictors application_train correlation matrix")

#if (!file.exists("../Downloads/output"))
#               {dir.create("../Downloads/output")                  
#               } 
#tmpTrainsinNA <- application_trainsinNA[,-1] 
#write.table(tmpTrainsinNA,file="../Downloads/output/application_trainsinNAMod.csv", sep=",") 
#tmpTrainsinNARead <- read.table("../Downloads/output/application_trainsinNAMod.csv", sep=",", header=TRUE)
#head(tmpTrainsinNARead)[,1:5] 

#Carga datos/análisis/limpieza NA/ gráficos de variables categóricas y calculo de correlación variables numéricas del file application_test:
#El file contiene los datos principales de capacitación y pruebas con información sobre cada solicitud de préstamo en Home Credit. 
#Cada préstamo tiene su propia fila y se identifica mediante la función SK_ID_CURR. 

applicationTest =read.table("../Downloads/application_test.csv", row.names=NULL, sep=",", header=TRUE)
kable(head(applicationTest[,1:5]))
nrow(applicationTest)
ncol(applicationTest)
summary(applicationTest)
str(applicationTest)
applicationTestsinNA = na.omit(applicationTest)
names(applicationTestsinNA)
nrow(applicationTestsinNA)
ncol(applicationTestsinNA)
summary(applicationTestsinNA)
str(applicationTestsinNA)
View(applicationTestsinNA)
qplot(factor(applicationTestsinNA$NAME_CONTRACT_TYPE), main = "Fig 2.1: Diagrama de barras tipo contrato") 
qplot(factor(applicationTestsinNA$CODE_GENDER), main = "Fig 2.2: Diagrama de barras genero") 
qplot(factor(applicationTestsinNA$FLAG_OWN_CAR), main = "Fig 2.3: Diagrama de barras tienen auto")
qplot(factor(applicationTestsinNA$FLAG_OWN_REALTY), main = "Fig 2.4: Diagrama de barras tienen inmueble")
qplot(factor(applicationTestsinNA$NAME_TYPE_SUITE), main = "Fig 2.5: Diagrama de barras Acompañantes")
qplot(factor(applicationTestsinNA$NAME_INCOME_TYPE), main = "Fig 2.6: Diagrama de barras Tipo de ingreso")
qplot(factor(applicationTestsinNA$NAME_EDUCATION_TYPE), main = "Fig 2.7: Diagrama de barras Tipo de educación")
qplot(factor(applicationTestsinNA$NAME_FAMILY_STATUS), main = "Fig 2.8: Diagrama de barras Estatus Familiar")
qplot(factor(applicationTestsinNA$NAME_HOUSING_TYPE), main = "Fig 2.9: Diagrama de barras Tipos Inmueble")
qplot(factor(applicationTestsinNA$OCCUPATION_TYPE), main = "Fig 2.10: Diagrama de barras Ocupación")
qplot(factor(applicationTestsinNA$WEEKDAY_APPR_PROCESS_START), main = "Fig 2.11: Diagrama de barras Dias de la semana/Inicio")
qplot(factor(applicationTestsinNA$ORGANIZATION_TYPE), main = "Fig 2.12: Diagrama de barras Tipo organización donde trabaja")
qplot(factor(applicationTestsinNA$FONDKAPREMONT_MODE), main = "Fig 2.13: Diagrama de barras Info normalizada")
qplot(factor(applicationTestsinNA$HOUSETYPE_MODE), main = "Fig 2.14: Diagrama de barras Info Tipo Vivienda")
qplot(factor(applicationTestsinNA$WALLSMATERIAL_MODE), main = "Fig 2.15: Diagrama de barras Materiales construccion")
qplot(factor(applicationTestsinNA$EMERGENCYSTATE_MODE), main = "Fig 2.16: Diagrama de barras Estado")

#Matriz correlaciones fichero test
applicationTestsinNACor <- cor(applicationTestsinNA[,
c("AMT_INCOME_TOTAL","AMT_CREDIT","AMT_ANNUITY","AMT_GOODS_PRICE","DAYS_BIRTH",
"DAYS_EMPLOYED","DAYS_REGISTRATION","DAYS_ID_PUBLISH","OWN_CAR_AGE","HOUR_APPR_PROCESS_START","DAYS_LAST_PHONE_CHANGE")
])
col <- colorRampPalette(c("#BB4444", "#EE9988", "#FFFFFF", "#77AADD", "#4477AA")) 
corrplot(applicationTestsinNACor, method = "shade", tl.col = "black",
         tl.srt = 40, col = col(10), addCoef.col="black", order="AOE",
         mar = c(1,0,0,1), line=-2, is.corr=FALSE,
         main = "Fig 2.17: Predictors application Test correlation matrix")
#if (!file.exists("../Downloads/output"))
#               {dir.create("../Downloads/output")                  
#               } 
#tmpapplicationTestsinNA <- applicationTestsinNA[,-1] 
#write.table(tmpapplicationTestsinNA,file="../Downloads/output/applicationTestsinNAMod.csv", sep=",") 
#tmpapplicationTestsinNARead <- read.table("../Downloads/output/applicationTestsinNAMod.csv", sep=",", header=TRUE)
#head(tmpapplicationTestsinNARead)[,1:5] 

#Carga datos/análisis/limpieza NA/ gráficos de variables categóricas y calculo de correlación variables numéricas del file Oficina (bureau):
#El file contiene los datos sobre créditos anteriores del cliente de otras instituciones financieras.
#Cada crédito anterior tiene su propia fila en la oficina. Un préstamo en los datos de la aplicación
#puede tener múltiples créditos anteriores.

bureau =read.table("../Downloads/bureau.csv", row.names=NULL, sep=",", header=TRUE)
kable(head(bureau[,1:5]))
nrow(bureau)
ncol(bureau)
summary(bureau)
str(bureau)
View(bureau)
bureausinNA = na.omit(bureau)
names(bureausinNA)
nrow(bureausinNA)
ncol(bureausinNA)
summary(bureausinNA)
str(bureausinNA)
View(bureausinNA)
qplot(factor(bureausinNA$CREDIT_ACTIVE), main = "Fig 3.1: Diagrama de barras Info Creditos Activos")
qplot(factor(bureausinNA$CREDIT_CURRENCY), main = "Fig 3.2: Diagrama de barras Moneda")
qplot(factor(bureausinNA$CREDIT_TYPE), main = "Fig 3.3: Diagrama de barras Tipo de Crédito")

#Matriz correlaciones fichero bureau 
bureausinNACor <- cor(bureausinNA[,
c("DAYS_CREDIT","DAYS_CREDIT_ENDDATE","DAYS_ENDDATE_FACT","AMT_CREDIT_MAX_OVERDUE",
"AMT_CREDIT_SUM","AMT_CREDIT_SUM_DEBT","AMT_CREDIT_SUM_LIMIT",
"DAYS_CREDIT_UPDATE","AMT_ANNUITY")
])
col <- colorRampPalette(c("#BB4444", "#EE9988", "#FFFFFF", "#77AADD", "#4477AA")) 
corrplot(bureausinNACor, method = "shade", tl.col = "black",
         tl.srt = 40, col = col(20), addCoef.col="black", order="AOE",
         mar = c(1,0,0,1), line=-2, is.corr=FALSE,
         main = "Fig 3.4: Predictors bureau correlation matrix")

#if (!file.exists("../Downloads/output"))
#               {dir.create("../Downloads/output")                  
#               } 
#tmpbureausinNA <- bureausinNA[,-1] 
#write.table(tmpbureausinNA,file="../Downloads/output/bureausinNAMod.csv", sep=",") 
#tmpbureausinNARead <- read.table("../Downloads/output/bureausinNAMod.csv", sep=",", header=TRUE)
#head(tmpbureausinNARead)[,1:5]

#Carga datos/análisis/limpieza NA/ gráficos de variables categóricas y calculo de correlación variables numéricas del file bureau_balance:
#El file contiene los datos mensuales sobre los créditos anteriores en bureau.
#Cada fila es un mes de un crédito anterior, y un solo crédito anterior puede tener varias filas,
#una para cada mes de la duración del crédito.

bureau_balance =read.table("../Downloads/bureau_balance.csv", row.names=NULL, sep=",", header=TRUE)
kable(head(bureau_balance[,1:3]))
nrow(bureau_balance)
ncol(bureau_balance)
summary(bureau_balance)
str(bureau_balance)
View(bureau_balance)
bureau_balancesinNA = na.omit(bureau_balance)
names(bureau_balancesinNA)
nrow(bureau_balancesinNA)
ncol(bureau_balancesinNA)
summary(bureau_balancesinNA)
str(bureau_balancesinNA)
View(bureau_balancesinNA)
qplot(factor(bureau_balancesinNA$STATUS), main = "Fig 4.1: Diagrama de barras Estado de Crédito")

#if (!file.exists("../Downloads/output"))
#               {dir.create("../Downloads/output")                  
#               } 
#tmpbureau_balancesinNA <- bureau_balancesinNA [,-1] 
#write.table(tmpbureau_balancesinNA,file="../Downloads/output/bureau_balancesinNAMod.csv", sep=",") 
#tmpbureau_balancesinNARead <- read.table("../Downloads/output/bureau_balancesinNAMod.csv", sep=",", header=TRUE)
#head(tmpbureau_balancesinNARead)[,1:2]


#Carga datos/análisis/limpieza NA/ gráficos de variables categóricas y calculo de correlación variables numéricas del file anterior_aplicación:
#El file contiene solicitudes anteriores para préstamos en Home Credit de clientes que tienen préstamos en los datos de la aplicación.
#Cada préstamo actual en los datos de la aplicación puede tener múltiples préstamos anteriores.
#Cada aplicación anterior tiene una fila y se identifica mediante la función SK_ID_PREV.

previous_application =read.table("../Downloads/previous_application.csv", row.names=NULL, sep=",", header=TRUE)
kable(head(previous_application[,1:5]))
nrow(previous_application)
ncol(previous_application)
summary(previous_application)
str(previous_application)
View(previous_application)
previous_applicationsinNA = na.omit(previous_application)
names(previous_applicationsinNA)
nrow(previous_applicationsinNA)
ncol(previous_applicationsinNA)
summary(previous_applicationsinNA)
str(previous_applicationsinNA)
View(previous_applicationsinNA)
qplot(factor(previous_applicationsinNA$NAME_CONTRACT_TYPE), main = "Fig 5.1: Diagrama de barras tipo contrato") 
qplot(factor(previous_applicationsinNA$WEEKDAY_APPR_PROCESS_START), main = "Fig 5.2: Diagrama Dias de la Semana/ Inicio") 
qplot(factor(previous_applicationsinNA$FLAG_LAST_APPL_PER_CONTRACT), main = "Fig 5.3: Diagrama de barras Ultima Solicitud")
qplot(factor(previous_applicationsinNA$NAME_CASH_LOAN_PURPOSE), main = "Fig 5.4: Diagrama de barras proposito del credito")
qplot(factor(previous_applicationsinNA$NAME_CONTRACT_STATUS), main = "Fig 5.5: Diagrama de barras estado del crédito")
qplot(factor(previous_applicationsinNA$NAME_PAYMENT_TYPE), main = "Fig 5.6: Diagrama de barras Tipo de pago")
qplot(factor(previous_applicationsinNA$CODE_REJECT_REASON), main = "Fig 5.7: Diagrama de barras Tipo de rechazo")
qplot(factor(previous_applicationsinNA$NAME_TYPE_SUITE), main = "Fig 5.8: Diagrama de barras Acompañante")
qplot(factor(previous_applicationsinNA$NAME_CLIENT_TYPE), main = "Fig 5.9: Diagrama de barras Tipos de Cliente")
qplot(factor(previous_applicationsinNA$NAME_GOODS_CATEGORY), main = "Fig 5.10: Diagrama de barras Tipo de bienes")
qplot(factor(previous_applicationsinNA$NAME_PORTFOLIO), main = "Fig 5.11: Diagrama de barras Portafolio")
qplot(factor(previous_applicationsinNA$NAME_PRODUCT_TYPE), main = "Fig 5.12: Diagrama de barras Tipo Producto")
qplot(factor(previous_applicationsinNA$CHANNEL_TYPE), main = "Fig 5.13: Diagrama de barras Info Canal")
qplot(factor(previous_applicationsinNA$NAME_SELLER_INDUSTRY), main = "Fig 5.14: Diagrama de barras Info Industria")
qplot(factor(previous_applicationsinNA$NAME_YIELD_GROUP), main = "Fig 5.15: Diagrama de barras Info Tasa Agrupada")
qplot(factor(previous_applicationsinNA$PRODUCT_COMBINATION), main = "Fig 5.16: Diagrama de barras Combinación detallada")

#Matriz de correlacion fichero previous 
previous_applicationsinNACor <- cor(previous_applicationsinNA[,
c("AMT_ANNUITY","AMT_APPLICATION","AMT_CREDIT","AMT_DOWN_PAYMENT","AMT_GOODS_PRICE","DAYS_DECISION",
"DAYS_FIRST_DUE","DAYS_LAST_DUE_1ST_VERSION","DAYS_LAST_DUE","DAYS_TERMINATION")
])
col <- colorRampPalette(c("#BB4444", "#EE9988", "#FFFFFF", "#77AADD", "#4477AA")) 
corrplot(previous_applicationsinNACor, method = "shade", tl.col = "black",
         tl.srt = 40, col = col(10), addCoef.col="black", order="AOE",
         mar = c(1,0,0,1), line=-2, is.corr=FALSE,
         main = "Fig 5.17: Predictors previous_applications correlation matrix")

#if (!file.exists("../Downloads/output"))
#               {dir.create("../Downloads/output")                  
#               } 
#tmpprevious_applicationsinNA <- previous_applicationsinNA[,-1] 
#write.table(tmpprevious_applicationsinNA,file="../Downloads/output/previous_applicationsinNAMod.csv", sep=",") 
#tmpprevious_applicationsinNARead <- read.table("../Downloads/output/previous_applicationsinNAMod.csv", sep=",", header=TRUE)
#head(tmpprevious_applicationsinNARead)[,1:5]

#Carga datos/análisis/limpieza NA/ gráficos de variables categóricas y calculo de correlación variables numéricas del file POS_CASH_BALANCE:
#El file contiene los datos mensuales sobre puntos de venta anteriores o préstamos en efectivo que los clientes han tenido con Home Credit.
#Cada fila es un mes de un punto de venta anterior o préstamo en efectivo, y un solo préstamo anterior puede tener muchas filas.

POS_CASH_balance =read.table("../Downloads/POS_CASH_balance.csv", row.names=NULL, sep=",", header=TRUE)
kable(head(POS_CASH_balance[,1:5]))
nrow(POS_CASH_balance)
ncol(POS_CASH_balance)
summary(POS_CASH_balance)
str(POS_CASH_balance)
View(POS_CASH_balance)
POS_CASH_balancesinNA = na.omit(POS_CASH_balance)
names(POS_CASH_balancesinNA)
nrow(POS_CASH_balancesinNA)
ncol(POS_CASH_balancesinNA)
summary(POS_CASH_balancesinNA)
str(POS_CASH_balancesinNA)
View(POS_CASH_balancesinNA)
qplot(factor(POS_CASH_balancesinNA$NAME_CONTRACT_STATUS), main = "Fig 6.1: Diagrama de barras Estado contratos")

#Matriz de correlaciones fichero POS_CASH
POS_CASH_balancesinNACor <- cor(POS_CASH_balancesinNA[,
c("MONTHS_BALANCE","CNT_INSTALMENT","CNT_INSTALMENT_FUTURE","SK_DPD","SK_DPD_DEF")
])
col <- colorRampPalette(c("#BB4444", "#EE9988", "#FFFFFF", "#77AADD", "#4477AA")) 
corrplot(POS_CASH_balancesinNACor, method = "shade", tl.col = "black",
         tl.srt = 40, col = col(20), addCoef.col="black", order="AOE",
         mar = c(0.5,0.5,1,0), line=-2, is.corr=FALSE,
         main = "Fig 6.2: Predictors POS_CASH_balances correlation matrix")

#if (!file.exists("../Downloads/output"))
#               {dir.create("../Downloads/output")                  
#               } 
#tmpPOS_CASH_balancesinNA <- POS_CASH_balancesinNA[,-1] 
#write.table(tmpPOS_CASH_balancesinNA,file="../Downloads/output/POS_CASH_balancesinNAMod.csv", sep=",") 
#tmpPOS_CASH_balancesinNARead <- read.table("../Downloads/output/POS_CASH_balancesinNAMod.csv", sep=",", header=TRUE)
#head(tmpPOS_CASH_balancesinNARead)[,1:5] 

#Carga datos/análisis/limpieza NA/ gráficos de variables categóricas y calculo de correlación variables numéricas del file credit_card_balance:
#El file contiene los datos mensuales sobre tarjetas de crédito anteriores que los clientes han tenido con Home Credit.
#Cada fila es un mes de saldo de tarjeta de crédito, y una sola tarjeta de crédito puede tener muchas filas.

credit_card_balance =read.table("../Downloads/credit_card_balance.csv", row.names=NULL, sep=",", header=TRUE)
kable(head(credit_card_balance[,1:5]))
nrow(credit_card_balance)
ncol(credit_card_balance)
summary(credit_card_balance)
str(credit_card_balance)
View(credit_card_balance)
credit_card_balancesinNA = na.omit(credit_card_balance)
names(credit_card_balancesinNA)
nrow(credit_card_balancesinNA)
ncol(credit_card_balancesinNA)
summary(credit_card_balancesinNA)
str(credit_card_balancesinNA)
View(credit_card_balancesinNA)
qplot(factor(credit_card_balancesinNA$NAME_CONTRACT_STATUS), main = "Fig 7.1: Diagrama de barras Estado contratos")

#Matriz correlaciones fichero credit card balances
credit_card_balancesinNACor <- cor(credit_card_balancesinNA[,
c("MONTHS_BALANCE","AMT_BALANCE","AMT_CREDIT_LIMIT_ACTUAL","AMT_DRAWINGS_ATM_CURRENT","AMT_DRAWINGS_CURRENT",
"AMT_INST_MIN_REGULARITY","AMT_PAYMENT_CURRENT","AMT_PAYMENT_TOTAL_CURRENT","AMT_RECEIVABLE_PRINCIPAL",
"AMT_RECIVABLE","AMT_TOTAL_RECEIVABLE","CNT_INSTALMENT_MATURE_CUM")
])
col <- colorRampPalette(c("#BB4444", "#EE9988", "#FFFFFF", "#77AADD", "#4477AA")) 
corrplot(credit_card_balancesinNACor, method = "shade", tl.col = "black",
         tl.srt = 40, col = col(10), addCoef.col="black", order="AOE",
         mar = c(2,0,0,2), line=-1, is.corr=FALSE,
         main = "Fig 7.2: Predictors credit_card_balances correlation matrix")

#if (!file.exists("../Downloads/output"))
#               {dir.create("../Downloads/output")                  
#               } 
#tmpcredit_card_balancesinNA <- credit_card_balancesinNA[,-1] 
#write.table(tmpcredit_card_balancesinNA,file="../Downloads/output/credit_card_balancesinNAMod.csv", sep=",") 
#tmpcredit_card_balancesinNARead <- read.table("../Downloads/output/credit_card_balancesinNAMod.csv", sep=",", header=TRUE)
#head(tmpcredit_card_balancesinNARead)[,1:5]

#Carga datos/análisis/limpieza NA/ gráficos de variables categóricas y calculo de correlación variables numéricas del file cuotas_pagos:
#El file contiene el historial de pagos de préstamos anteriores en Home Credit. 
#Hay una fila por cada pago realizado y una fila por cada pago perdido

installments_payments =read.table("../Downloads/installments_payments.csv", row.names=NULL, sep=",", header=TRUE)
kable(head(installments_payments[,1:5]))
nrow(installments_payments)
ncol(installments_payments)
summary(installments_payments)
str(installments_payments)
View(installments_payments)
installments_paymentssinNA = na.omit(installments_payments)
names(installments_paymentssinNA)
nrow(installments_paymentssinNA)
ncol(installments_paymentssinNA)
summary(installments_paymentssinNA)
str(installments_paymentssinNA)
View(installments_paymentssinNA)

#Matriz de correlaciones fichero installments payments
installments_paymentssinNACor <- cor(installments_paymentssinNA[,
c("NUM_INSTALMENT_VERSION","NUM_INSTALMENT_NUMBER","DAYS_INSTALMENT","DAYS_ENTRY_PAYMENT","AMT_INSTALMENT",
"AMT_PAYMENT")
])
col <- colorRampPalette(c("#BB4444", "#EE9988", "#FFFFFF", "#77AADD", "#4477AA")) 
corrplot(installments_paymentssinNACor, method = "shade", tl.col = "black",
         tl.srt = 40, col = col(10), addCoef.col="black", order="AOE",
         mar = c(1,0,0,1), line=-2, is.corr=FALSE,
         main = "Fig 8.1: Predictors installments_payments correlation matrix")

#if (!file.exists("../Downloads/output"))
#               {dir.create("../Downloads/output")                  
#               } 
#tmpinstallments_paymentssinNA <- installments_paymentssinNA[,-1] 
#write.table(tmpinstallments_paymentssinNA,file="../Downloads/output/installments_paymentssinNAMod.csv", sep=",") 
#tmpinstallments_paymentssinNARead <- read.table("../Downloads/output/installments_paymentssinNAMod.csv", sep=",", header=TRUE)
#head(tmpinstallments_paymentssinNARead)[,1:5]




