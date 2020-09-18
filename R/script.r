library(tidyverse)

#Import data
Space_Corrected <- read_csv("../data/Space_Corrected.csv")

#Summarise data
summary(Space_Corrected)

#Plot number of launches per company, 10 companies with more launches.
most_launches <- Space_Corrected %>% count(Company_Name, sort = TRUE) %>% filter(n>=114) %>% arrange(desc(n))
  
p1 <- ggplot(most_launches, aes(x = reorder(Company_Name, -n), y=n))+
    geom_col()+
    coord_flip()
p1 + labs(x = "Company", y = "Number of launches")


#Pie chart status rocket
ggplot(Space_Corrected, aes(x = factor(1), fill = Status_Rocket)) +
  geom_bar(width = 1) +
  coord_polar(theta = "y", start = 0)

#Pie chart status mission
ggplot(Space_Corrected, aes(x = factor(1), fill = Status_Mission)) +
  geom_bar(width = 1) +
  scale_fill_brewer(palette="Blues")+
  coord_polar(theta = "y", start = 0)