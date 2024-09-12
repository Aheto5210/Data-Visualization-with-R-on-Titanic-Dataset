# Data visualization with ggplot2

install.packages("ggplot2")
library(tidyverse)
library(ggplot2)
library(dplyr)


#loading the Titanic Dataset
datan <- read.csv("Data Visualization with R/Titanic-Dataset.csv", stringsAsFactors = FALSE)

# number of NA values in the dataset
sum(is.na(datan))

#set up factors
datan$Pclass <- as.factor(datan$Pclass)
datan$Survived <- as.factor(datan$Survived)
datan$Sex <- as.factor(datan$Sex)
datan$Embarked <- as.factor(datan$Embarked) 

# Question 1 - What was the survival rate?

# Visualization of survival
ggplot(datan, aes(x = Survived))+
  geom_bar()

# Percentage of survival
prop.table(table(datan$Survived)) # 61% died & 38% survived

# add some customizations for labels and themes
ggplot(datan, aes(x = Survived))+
  geom_bar()+ theme_bw() + labs(y = "Passenger count", title = "Titanic Survival Rate")

# Question 2 - What was the survival rate by gender?
ggplot(datan, aes(x = Sex, fill = Survived))+ 
  geom_bar()+ theme_bw() + labs(y = "Passenger count", title = "Titanic Survival Rate by gender")

# Question 3 - What was the survival rate by class of ticket?
ggplot(datan, aes(x = Pclass, fill = Survived))+
  geom_bar()+ theme_bw() + labs(y = "Passenger count", title = "Titanic Survival Rate by class Ticket")

# Question 4 -  what was the survival rate by class of ticket and gender
ggplot(datan, aes(x = Sex, fill = Survived))+ 
  geom_bar()+ facet_wrap(~ Pclass)+ theme_bw() + labs(y = "Passenger count", title = "Titanic Survival Rate by class ticket and gender")

# Question 5 -What is the distribution of passenger's ages?
ggplot(datan, aes(x = Age,))+ geom_histogram(binwidth = 5)+ theme_bw() + 
  labs(y = "Passenger count", x = "Age (binwidth = 5) ", title = "Age Distribution")

# Question 6 -  what was the survival rate based on age, sex and Pclass?
ggplot(datan, aes(x = Age, fill = Survived))+ geom_histogram(binwidth = 5)+ theme_bw() + 
  labs(y = "Passenger count", x = "Age (binwidth = 5) ", title = "Titanic Survival Rate")

ggplot(datan, aes(x = Survived, y = Age))+
  geom_boxplot()+ theme_bw() + labs(y = "Age", title = "Titanic Survival Rate", x = "Survived")


ggplot(datan, aes(x = Age, fill = Survived))+ geom_density(alpha = 0.5)+ 
  facet_wrap(Sex ~ Pclass) + theme_bw() + 
  labs(y = "Survived", x = "Age ", title = "Titanic Survival Rate by Age, Pclass and Sex")




