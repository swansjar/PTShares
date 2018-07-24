library(tidyverse)
library(tidyr)
library(reshape2)
library(scales)
library(ggthemes)

#Read in multiple_years
ptshares <- read.csv(file.choose(), header = TRUE)
longptshares <- ptshares %>% gather(variable, value, Residential.homestead:Commercial.industrial)


#######################################
p <- longptshares %>% filter(Year %in% c("2007", "2008", "2009", "2010", "2011", "2012", "2013", "2014", "2015", "2016", "2017")) %>%
  ggplot() +
  geom_bar(aes(x = Year, y = value, fill = variable), stat = "identity")
p

p2 <- longptshares %>%
  ggplot() +
  geom_bar(aes(x = Year, y = value, fill = variable), stat = "identity")
p2
#######################################
p3 <- longptshares %>%
  ggplot() +
  geom_bar(aes(x = Year, y = value, fill = variable), position = "fill", stat = "identity")
p3

p4 <- longptshares %>%
  ggplot() +
  geom_bar(aes(x = Year, y = value, fill = variable), position = "fill", stat = "identity") +
  labs(y = NULL, title = "Statewide Shares of Net Tax by Property Type", subtitle = "1991-2017") +
  scale_y_continuous(labels = percent_format()) +
  scale_x_continuous(breaks = seq(min(longptshares$Year), max(longptshares$Year), by = 2))
p4
p4 + scale_fill_brewer(palette = "YlGnBu")

p4 + theme_economist()
p4 + theme_fivethirtyeight()
p4 + theme_wsj()
p4 + theme_tufte()

p4 + scale_fill_brewer(palette = "Blues") + theme_tufte()
p4 + scale_fill_brewer(palette = "Set1") + theme_tufte()



