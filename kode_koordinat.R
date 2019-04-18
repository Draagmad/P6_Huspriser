library(dawa)
HOME <- read.csv("Redigeret-Dataudtraek 2004-2016.csv", sep = ";", stringsAsFactors=FALSE,
                 encoding = "latin1")

koordinater <- read.csv("koordinater.csv")

nyHOME=HOME
nyHOME$id=0
nyHOME$xkoor=0
nyHOME$ykoor=0


for (i in 159230:length(koordinater$id)) {
  ad <- HOME$FuldAdresse[i]
  post <- HOME$Postnr[i]
  by <- HOME$Bynavn[i]
  tempadr <- cbind(ad,post,by)
  adr <- toString(tempadr)
  v <- datavask(adr,"adresser")
  adrid <- v$resultater[[1]]$adresse$id
  h <- adresser(id=adrid, struktur="mini",srid=25832)
    if(is.null(h[1][[1]])==TRUE){next}
  koordinater$id[i] <- adrid
  koordinater$xkoor[i] <- h[[1]]$x
  koordinater$ykoor[i] <- h[[1]]$y
}

#koordinater <- subset(koordinater, select = -c(X.2,X.1,X))


write.csv(koordinater, file = "koordinater.csv", row.names = FALSE)

HOME$id=koordinater$id
HOME$xkoor=koordinater$xkoor
HOME$ykoor=koordinater$ykoor


Aalborg <- subset(HOME, Kommune=="Aalborg")

Aalborg <- subset(Aalborg, xkoor!=0)

write.csv(Aalborg, file = "Aalborg.csv", row.names = FALSE)

