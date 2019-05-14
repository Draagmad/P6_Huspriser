filename <- "Redigeret-Dataudtraek 2004-2016.csv"

HOME <- read.csv("Redigeret-Dataudtraek 2004-2016.csv", sep = ";", stringsAsFactors=FALSE,
                 encoding = "latin1")

install.packages("devtools")

install.packages("dawa")

devtools::install_github("mikkelkrogsholm/dawa")

?dawa

# HOME$Studiebolig <- NULL
HOME <- subset(HOME, Kontantpris > 19000)

HOME$Liggetid <- as.Date(as.character(HOME$Salgsdato), format="%d-%m-%Y") -
  as.Date(as.character(HOME$Formidlingsaftaledato), format="%d-%m-%Y")
HOME$Salgsaar <- as.numeric(format(as.Date(as.character(HOME$Salgsdato), format="%d-%m-%Y"),"%Y"))

#navne <- names(HOME)

HOME$AfstandTilCity <- NULL
HOME$BebyggetAreal <- NULL
HOME$Bynavn <- NULL
HOME$EjdVurdering <- NULL
HOME$Elevator <- NULL
HOME$Energimaerke <- NULL
HOME$Foraeldrekoeb <- NULL
HOME$Formidlingsaftaledato <- NULL
HOME$Gaardmiljoe <- NULL
HOME$Grundvaerdi <- NULL
# HOME$Kommune <- NULL
# HOME$KommuneID <- NULL
HOME$MaeglersVaerdiansaettelse <- NULL
HOME$NytTag <- NULL
HOME$Region <- NULL
HOME$Tilbygning <- NULL
HOME$Udbudspris <- NULL
HOME$Vaskemaskine <- NULL
HOME$Vurderingsaar <- NULL

#Det med mursten droppes
#HOME$Mursten <- ifelse(grepl("Mursten", HOME$Ydervaegge), TRUE, FALSE)
#HOME <- subset(HOME, Mursten == TRUE)
#HOME <- subset(HOME, Mursten == TRUE)
HOME$Ydervaegge <- NULL

# Droppes i anden omgang:
HOME$HvilkenEtage <- NULL
HOME$Studiebolig <- NULL

#AntalToi1 <- ifelse(grepl("1", HOME$Toilet),1,0)
#AntalToi2 <- ifelse(grepl("2", HOME$Toilet),2,0)
#AntalToi3 <- ifelse(grepl("3", HOME$Toilet),3,0)
#AntalToi4 <- ifelse(grepl("4", HOME$Toilet),4,0)
#AntalToi5 <- ifelse(grepl("5", HOME$Toilet),5,0)
#AntalToi6 <- ifelse(grepl("6", HOME$Toilet),6,0)
#AntalToi7 <- ifelse(grepl("7", HOME$Toilet),7,0)
#AntalToi8 <- ifelse(grepl("8", HOME$Toilet),8,0)
#AntalToi9 <- ifelse(grepl("9", HOME$Toilet),9,0)
#AntalToi10 <- ifelse(grepl("10", HOME$Toilet),10,0)
#AntalToi11 <- ifelse(grepl("11", HOME$Toilet),11,0)
#v1 <- as.matrix(AntalToi1)
#v2 <- as.matrix(AntalToi2)
#v3 <- as.matrix(AntalToi3)
#v4 <- as.matrix(AntalToi4)
#v5 <- as.matrix(AntalToi5)
#v6 <- as.matrix(AntalToi6)
#v7 <- as.matrix(AntalToi7)
#v8 <- as.matrix(AntalToi8)
#v9 <- as.matrix(AntalToi9)
#v10 <- as.matrix(AntalToi10)
#v11 <- as.matrix(AntalToi11)
#v_alle <- cbind(v1,v2,v3,v4,v5,v6,v7,v8,v9,v10,v11)

#sum(v7)/7
#sum(v8)/8
#sum(v9)/9
#sum(v10)/10
#sum(v11)/11
#HOME$AntalToi <- v1+v2+v3+v4+v5+v6+v7+v8+v9+v10+v11
#rm(AntalToi1,AntalToi2,AntalToi3,AntalToi4,AntalToi5,AntalToi6,AntalToi7,AntalToi8,AntalToi9,AntalToi10,AntalToi11)
#rm(v1,v2,v3,v4,v5,v6,v7,v8,v9,v10,v11)
#test <- cbind(as.matrix(HOME$AntalToiletter),as.matrix(HOME$AntalToi))
#test <- subset(HOME, AntalToi > 0)
#hist(test$AntalToi)
#View(test$AntalToi)
#View(HOME$AntalToi)

HOME$MangeToil <- ifelse((HOME$AntalToiletter>2),1,0)
HOME$Toilet <- NULL
HOME$Bad <- NULL
  
HOME$TaetVedVand <- ifelse((HOME$TaetVedVand == "jaj"),"ja",HOME$TaetVedVand)
HOME$TaetVedVand <- ifelse((HOME$TaetVedVand == "Ja"),"ja",HOME$TaetVedVand)
HOME$TaetVedVand <- ifelse((HOME$TaetVedVand == "Nej"),"nej",HOME$TaetVedVand)
#table(HOME$TaetVedVand)
HOME$TaetVedVand <- ifelse((HOME$TaetVedVand == "1"),"ja",HOME$TaetVedVand)
HOME$TaetVedVand <- ifelse((HOME$TaetVedVand == "150"),"ja",HOME$TaetVedVand)
HOME$TaetVedVand <- ifelse((HOME$TaetVedVand == "2"),"ja",HOME$TaetVedVand)
HOME$TaetVedVand <- ifelse((HOME$TaetVedVand == "20 meter"),"ja",HOME$TaetVedVand)
HOME$TaetVedVand <- ifelse((HOME$TaetVedVand == "75"),"ja",HOME$TaetVedVand)
HOME$TaetVedVand <- ifelse((HOME$TaetVedVand == "300"),"nej",HOME$TaetVedVand)
HOME$TaetVedVand <- ifelse((HOME$TaetVedVand == "500"),"nej",HOME$TaetVedVand)
HOME$TaetVedVand <- ifelse((HOME$TaetVedVand == "1500"),"nej",HOME$TaetVedVand)
HOME$TaetVand <- NA
HOME$TaetVand <- ifelse((HOME$TaetVedVand == "ja"),1,HOME$TaetVand)
HOME$TaetVand <- ifelse((HOME$TaetVedVand == "nej"),0,HOME$TaetVand)
#View(as.matrix(HOME$TaetVedVand))
HOME$TaetVedVand <- HOME$TaetVand
HOME$TaetVand <- NULL

HOME$Opfoerelsesaar <- ifelse((HOME$Opfoerelsesaar < 1800),NA,HOME$Opfoerelsesaar)
HOME$Opfoerelsesaar <- ifelse((HOME$Opfoerelsesaar > 2017),NA,HOME$Opfoerelsesaar)

HOME$Ombygningsaar <- ifelse((HOME$Ombygningsaar < 1800),NA,HOME$Ombygningsaar)
HOME$Ombygningsaar <- ifelse((HOME$Ombygningsaar > 2016),NA,HOME$Ombygningsaar)

#table(as.numeric(HOME$NytKokken))
#mean(HOME$NytKokken)
#View(as.matrix(as.numeric(HOME$NytKokken)))
#View(as.matrix(HOME$NytKokken))

NytKokken <- NA
NytKokken <- ifelse((as.numeric(HOME$NytKokken) > 2005),1,NytKokken)
NytKokken <- ifelse((as.numeric(HOME$NytKokken) > 2017),NA,NytKokken)
NytKokken <- ifelse((as.numeric(HOME$NytKokken) < 2006),0,NytKokken)
NytKokken <- ifelse((as.numeric(HOME$NytKokken) == 1),1,NytKokken)
NytKokken <- ifelse((HOME$NytKokken == "HTH 2006"),1,NytKokken)
NytKokken <- ifelse((HOME$NytKokken == "Ja"),1,NytKokken)
NytKokken <- ifelse((HOME$NytKokken == "Nej"),0,NytKokken)
#View(as.matrix(NytKokken))
#table(NytKokken)
HOME$NytKokken <- NytKokken
rm(NytKokken)

NytBadevaerelse <- NA
NytBadevaerelse <- ifelse((as.numeric(HOME$NytBadevaerelse) > 2005),1,NytBadevaerelse)
NytBadevaerelse <- ifelse((as.numeric(HOME$NytBadevaerelse) > 2017),NA,NytBadevaerelse)
NytBadevaerelse <- ifelse((as.numeric(HOME$NytBadevaerelse) < 2006),0,NytBadevaerelse)
NytBadevaerelse <- ifelse((as.numeric(HOME$NytBadevaerelse) == 1),1,NytBadevaerelse)
NytBadevaerelse <- ifelse((HOME$NytBadevaerelse == "Ja"),1,NytBadevaerelse)
NytBadevaerelse <- ifelse((HOME$NytBadevaerelse == "JA"),1,NytBadevaerelse)
NytBadevaerelse <- ifelse((HOME$NytBadevaerelse == "Nej"),0,NytBadevaerelse)
HOME$NytBadevaerelse <- NytBadevaerelse
rm(NytBadevaerelse)
#table(NytBadevaerelse)

NyeVinduer <- NA
NyeVinduer <- ifelse((as.numeric(HOME$NyeVinduer) > 2005),1,NyeVinduer)
NyeVinduer <- ifelse((as.numeric(HOME$NyeVinduer) > 2017),NA,NyeVinduer)
NyeVinduer <- ifelse((as.numeric(HOME$NyeVinduer) < 2006),0,NyeVinduer)
NyeVinduer <- ifelse((as.numeric(HOME$NyeVinduer) == 1),1,NyeVinduer)
NyeVinduer <- ifelse((HOME$NyeVinduer == "ja"),1,NyeVinduer)
NyeVinduer <- ifelse((HOME$NyeVinduer == "Ja"),1,NyeVinduer)
NyeVinduer <- ifelse((HOME$NyeVinduer == "Nej"),0,NyeVinduer)
HOME$NyeVinduer <- NyeVinduer
rm(NyeVinduer)
#table(NyeVinduer)

HOME$SalgsMaaned <- as.numeric(format(as.Date(as.character(HOME$Salgsdato), format="%d-%m-%Y"),"%m"))
HOME$Kvartal1 <- ifelse(((HOME$SalgsMaaned==1) | (HOME$SalgsMaaned==2) | (HOME$SalgsMaaned==3)),1,0)
HOME$Kvartal2 <- ifelse(((HOME$SalgsMaaned==4) | (HOME$SalgsMaaned==5) | (HOME$SalgsMaaned==6)),1,0)
HOME$Kvartal3 <- ifelse(((HOME$SalgsMaaned==7) | (HOME$SalgsMaaned==8) | (HOME$SalgsMaaned==9)),1,0)
HOME$Kvartal4 <- ifelse(((HOME$SalgsMaaned==10) | (HOME$SalgsMaaned==11) | (HOME$SalgsMaaned==12)),1,0)
HOME$SalgsMaaned <- NULL

KaelderAreal <- HOME$Kaelderareal
#View(as.matrix(KaelderAreal))
#table(KaelderAreal)
#hist(KaelderAreal)
Kaelder <- NA
Kaelder <- ifelse((KaelderAreal > 0),1,Kaelder)
Kaelder <- ifelse((KaelderAreal == 0),0,Kaelder)
#View(as.matrix(cbind(KaelderAreal,Kaelder)))
HOME$Kaelder <- Kaelder
HOME$KaelderAreal <- NULL
rm(KaelderAreal,Kaelder)

Storgrund <- NA
Storgrund <- ifelse((HOME$Grundareal > 1500),1,Storgrund)
Storgrund <- ifelse((HOME$Grundareal <= 1500),0,Storgrund)
#View(as.matrix(cbind(HOME$Grundareal,Storgrund)))
HOME$Storgrund <- Storgrund
#HOME$Grundareal <- NULL
rm(Storgrund)

GarageCarport <- NA
GarageCarport <- ifelse((HOME$GarageCarport > 0),1,GarageCarport)
GarageCarport <- ifelse((HOME$GarageCarport == 0),0,GarageCarport)
#View(as.matrix(cbind(HOME$GarageCarport,GarageCarport)))
HOME$GarageCarport <- GarageCarport
rm(GarageCarport)

#table(HOME$EjdType)
#table(HOME$EjTypeNr)

#HOMEtst <- subset(HOME, EjdType != "Andel-/Aktiebolig")
#HOMEtst <- subset(HOME, EjdType != "Helaarsgrund")

HOME <- subset(HOME, (EjdType == "Ejerlejlighed") | (EjdType == "Raekkehus") | (EjdType == "Villa, 1 fam.") | (EjdType == "Villa, 2 fam."))
HOME$EjTypeNr <- NULL

Ombygn <- HOME$Ombygningsaar
Ombygn <- ifelse(is.na(Ombygn),HOME$Opfoerelsesaar,Ombygn)  
HOME$Alder <- HOME$Salgsaar - Ombygn
rm(Ombygn)  
#View(as.matrix(cbind(HOME$Opfoerelsesaar,HOME$Ombygningsaar,HOME$Salgsaar,HOME$Alder)))

#table(HOME$Altan)
Altan <- NA
Altan <- ifelse((HOME$Altan == "Ja"),1,Altan)
Altan <- ifelse((HOME$Altan == "1"),1,Altan)
Altan <- ifelse((HOME$Altan == "2"),1,Altan)
Altan <- ifelse((HOME$Altan == "Nej"),0,Altan)
Altan <- ifelse((HOME$Altan == "0"),0,Altan)
HOME$Altan <- Altan
rm(Altan)
#table(Altan)

#table(HOME$AfstandDagligvarer)
HOME$AfstandDagligvarer <- NULL

#table(HOME$AfstandOffentligTransport)
HOME$AfstandOffentligTransport <- NULL
#table(HOME$AfstandSkole)
HOME$AfstandSkole <- NULL

#table(HOME$AntalPlan)
AntalPlan <- NA
AntalPlan <- ifelse((as.numeric(HOME$AntalPlan) > 1000),NA,as.numeric(HOME$AntalPlan))
HOME$AntalPlan <- AntalPlan
rm(AntalPlan)
#table(HOME$AntalPlan)

Hoejhus <- NA
Hoejhus <- ifelse((HOME$AntalPlan > 14),1,Hoejhus)
Hoejhus <- ifelse((HOME$AntalPlan < 15),0,Hoejhus)
#View(as.matrix(cbind(HOME$Hoejhus,Hoejhus)))
HOME$Hoejhus <- Hoejhus
rm(Hoejhus)

AntalSovevaerelser <- HOME$AntalSovevaerelser
AntalSovevaerelser <-  ifelse(as.integer(AntalSovevaerelser) < 16,as.integer(AntalSovevaerelser),NA)
AntalSovevaerelser <-  ifelse(as.integer(AntalSovevaerelser) > -1,as.integer(AntalSovevaerelser),NA)
AntalSovevaerelser <-  ifelse(as.integer(AntalSovevaerelser) == 0,NA,as.integer(AntalSovevaerelser))
AntalSv <- as.numeric(AntalSovevaerelser)
#table(AntalSv)
#View(as.matrix(AntalSv))
HOME$AntalSovevaerelser <- AntalSv
#table(HOME$AntalSovevaerelser)
rm(AntalSovevaerelser,AntalSv)

HOME$OmbygningSket <- ifelse(is.na(HOME$Ombygningsaar),0,1)
#View(cbind(OmbygningSket,HOME$Ombygningsaar))
HOME$Ombygningsaar <- NULL

navne <- names(HOME)

#Aalborg$Formidlingsaftaledato <- NULL
#Aalborg$Salgsdato <- NULL
#Aalborg$Foraeldrekoeb <- NULL
#Aalborg$MaeglersVaerdiansaettelse <- NULL
#Aalborg$Kaelderareal <- NULL
#Aalborg$Ombygningsaar <- NULL


# fama$DSV <- as.numeric(paste(sub(",",".",fama$DSV)))

# rm(list=ls())
kommuner <- c("Odense", "Esbjerg", "Kolding", "Skanderborg", "Randers", "Vejle",
              "Helsingoer", "Soenderborg", "Fredericia")

for(i in seq_along(kommuner)){
  datanavn <- paste0("HOME_", kommuner[i])
  assign(datanavn, HOME[HOME$Kommune==kommuner[i],])
  save(list = datanavn, file = paste0(datanavn, ".Rdata"))
}

# HOME_Aalborg <- subset(HOME,(Postnr == 9000) & (EjdType == "Ejerlejlighed"))
# HOME1 <- subset(HOME,Postnr > 9000)
# HOME2 <- subset(HOME,(Postnr > 7999) & (Postnr < 8350))
# HOME3 <- subset(HOME,(Postnr > 4999) & (Postnr < 5599))
# 
# attach(HOME1)
# hist(log(Kontantpris))


#save(HOME1,file="HOME1.Rdata")
#save(HOME2,file="HOME2.Rdata")
#save(HOME3,file="HOME3.Rdata")
