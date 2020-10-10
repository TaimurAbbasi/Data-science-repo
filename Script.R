options(digits = 3)

library(tidyverse)
library(titanic)

titanic <- titanic_train %>% 
  select(Survived, Pclass, Sex, Age, SibSp, Parch, Fare)%>%
  filter(!is.na(Age) & Fare!=0)%>%
  mutate(Survived = factor(Survived),
         Pclass = factor(Pclass),
         Sex = factor(Sex))
head(titanic)
titanic %>% ggplot(aes(Age,..count..,fill=Survived)) +geom_density(position = "stack")+ facet_grid(Sex ~ Pclass)