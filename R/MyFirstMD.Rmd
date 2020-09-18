---
title: "MyFirstMD"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```
# Data extraction, transformation and loading

## Packages loaded

```{r warning=FALSE}
r = getOption("repos")
r["CRAN"] = "http://cran.us.r-project.org"
options(repos = r)
#data loading
if (!require("readr")) {
  install.packages("readr", dependencies = TRUE)
  library(readr)
  citation("readr")
}
#data manipulation
if (!require("dplyr")) {
  install.packages("dplyr", dependencies = TRUE)
  library(dplyr)
  citation("dplyr")
}
#data visualisation
if (!require("ggplot2")) {
  install.packages("ggplot2", dependencies = TRUE)
  library(ggplot2)
  citation("ggplot2")
}
```
## Data loading
```{r}
Space_Corrected <- read_csv("../data/Space_Corrected.csv")
```


## Some plots
```{r, echo=FALSE}
most_launches <- Space_Corrected %>% count(Company_Name, sort = TRUE) %>% filter(n>=114) %>% arrange(desc(n))
  
p1 <- ggplot(most_launches, aes(x = reorder(Company_Name, -n), y=n))+
    geom_col()+
    coord_flip()
p1 + labs(x = "Company", y = "Number of launches")
```

```{r, echo=FALSE}
ggplot(Space_Corrected, aes(x = factor(1), fill = Status_Rocket)) +
  geom_bar(width = 1) +
  coord_polar(theta = "y", start = 0)
```

```{r, echo=FALSE}
ggplot(Space_Corrected, aes(x = factor(1), fill = Status_Mission)) +
  geom_bar(width = 1) +
  scale_fill_brewer(palette="Blues")+
  coord_polar(theta = "y", start = 0)
```


