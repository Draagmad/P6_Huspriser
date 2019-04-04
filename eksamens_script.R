load("HOME_Esbjerg.Rdata")

## First model

mod_one <- lm(Kontantpris ~ Boligareal*Boligtilstand, data = HOME_Esbjerg)
summary(mod_one)

## Second model

mod_two <- lm(log(Kontantpris) ~ Boligareal*Boligtilstand, data = HOME_Esbjerg)
summary(mod_two)

## Third model
mod4_F = lm ( log ( Kontantpris ) ~ Boligtilstand + Boligareal + EjdType + Alder
              + Salgsaar + OmbygningSket + Kaelderareal + I ( sqrt ( Boligareal ) ) 
              + I ( Kaelderareal^2) + I ( Alder^2) , data = HOME_Esbjerg)
summary(mod4_F)
