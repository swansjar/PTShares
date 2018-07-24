library(tidyverse)
library(tidyr)
library(reshape2)
library(scales)
library(ggthemes)


pt <- read_csv("C:\\Users\\HRDUser\\Documents\\PtsharesforR.csv")
ptlong <- pt %>% gather(variable, value, `Residential homestead`:`Commercial-industrial EMVP`)

###Vecotors###
#Net Tax:
nt <- c("Residential homestead", "Residential non-homestead", "Seasonal recreational",
        "Agricultural", "Apartment", "Public utility & personal", "Commercial-industrial", "TOTAL")
#Net Tax Proportion:
ntp <- c("Residential homestead NT", "Residential non-homestead NT", "Seasonal recreational NT",
         "Agricultural NT", "Apartment NT", "Public utility & personal NT", "Commercial-industrial NT") 
#Effective Tax Rate:
etr <- c("Residential homestead ETR", "Residential non-homestead ETR", "Seasonal recreational ETR",
         "Agricultural ETR", "Apartment ETR", "Public utility & personal ETR", "Commercial-industrial ETR") 
#Est Market Value Proportion:
emvp <- c("Residential homestead EMVP", "Residential non-homestead EMVP", "Seasonal recreational EMVP",
         "Agricultural EMVP", "Apartment EMVP", "Public utility & personal EMVP", "Commercial-industrial EMVP") 
#10 Year:
yr <- c("2008", "2009", "2010", "2011", "2012", "2013", "2014", "2015", "2016", "2017", "2018")



################################################
##Statewide Shares of Net Tax by Property Type##
################################################

p <- ptlong %>% filter(variable %in% nt) %>%
  ggplot() +
  geom_bar(aes(x = Year, y = value, fill = variable), stat = "identity")
p


p2 <- ptlong %>% filter(variable %in% nt, Year %in% yr) %>%
  ggplot() +
  geom_bar(aes(x = Year, y = value, fill = variable), stat = "identity")
p2







