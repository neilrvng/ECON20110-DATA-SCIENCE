# Introduction to data science with applications in R and git
# University of Manchester 
# Tutorial led by Tom Franklin, 06/02/2019

####
# Tutorial 1 Code ----
# 1. Install and load libraries
# 2. Load data 
# 3. Data manipulation with dplyr
# 4. Data summarisation 
# 5. Graphics with ggplot2 

####
# 1. Install and load libraries ----

# Installing R packages
install.packages("tidyverse")

# Loading R packages
library("tidyverse")

# Tasks: 
# How would I install the skimr package? 
# How would I load the skimr package? 
# Do the same for following packages:
# `skimr`, `RColorBrewer` and `ggthemes` 

####
# 2. Load data ----
raw_data <- readr::read_csv("data/passenger_data.csv")

# This is equivilant but we don't use this! 
readr::read_csv("data/passenger_data.csv") -> raw_data 

# Quick glance at the data
# Installing R packages
install.packages("skimr")
library("skimr")
skimr::skim(raw_data)

####
# 3. Data manipulation with dplyr ----

# In words, can you explain what %>% stands for?   Answer is "Then"


# Selecting columns 

selected_data_1 <- raw_data %>%
  dplyr::select(Age,Sex) %>%
  dplyr::filter(Age > 1) 

# Task:

# i. Select Age and Sex columns only 
selected_data_1 <- raw_data %>%
  dplyr::select(Age,Sex) %>%
  filter(Age > 1)

# ii. Select all data apart from the Survived column
selected_data_2 <- raw_data %>%
  dplyr::select(-Survived)

# iii. Select the first three variables using numeric 
selected_data_2 <- raw_data %>%
  dplyr::select(1:3)

# Filtering data

# i. Filter data to keep only those where Pclass (passenger class) is equal to 1
selected_data_2 <- raw_data %>%
  dplyr::filter(Pclass==1)

# 11. Filter the data to keep only data where there's first 
#     class passengers and passengers are aged over 50
selected_data_2 <- raw_data %>%
  dplyr::filter(Pclass==1 & Age>50)

# iii. Filter data to keep only 2nd and 3rd Class passengers 
selected_data_2 <- raw_data %>%
  dplyr::filter(Pclass==2 | Pclass==3)  # | means "OR"

selected_data_2 %>%
  dplyr::distinct(Pclass==2)

# iv. Filter data for only those who Embarked n the journey from Cherbourg
selected_data_2 <- raw_data %>%
  dplyr::filter(Embarked=="C")

selected_data_3 <- raw_data %>%
  dplyr::filter(Pclass==1) %>%
  dplyr::select(Age,Name,Pclass)

# Renaming data

# i. Rename the Sex column to be Gender, 

# tip: rename(new_column_name = old_column_name)
renamed_data_1 <- raw_data %>%
  dplyr::rename(Room=Cabin)


# Arranging data

# i. Arrange the dataframe from low to high 
young_to_old <- raw_data %>%
  arrange((Age))

# ii. Arrange Fare data from high to low
low_to_high <- raw_data %>%
  arrange(desc(Fare))


# Make new variablea (mutate)

# i. Create a new variable called fare_in_dollars, multiplying the fare by a conversion rate of 1.37

# ii. Create an estimate of a passengers birth year by using their Age information!
date_birth <- raw_data%>%
  dplyr::mutate(date_birth = round(1912-Age))%>%
  arrange(date_birth)

# iii. Create a flag to indicate those who have an above average income (£29.70)
raw_data %>%
  dplyr::summarise(average_age = mean(Age, na.rm = TRUE))

raw_data %>%
  dplyr::group_by(Sex) %>%
  dplyr::summarise(average_age = mean(Age, na.rm = TRUE))

raw_data %>%
  dplyr::group_by(Sex) %>%
  dplyr::summarise(average_fare = mean(Fare, na.rm = TRUE))

raw_data %>%
  dplyr::group_by(Sex,Pclass) %>%
  dplyr::summarise(average_age = mean(Age, na.rm = TRUE))

# Summary statistics - refer to the booklet for tasks! 

data_with_flag <- raw_data %>%
  dplyr::mutate(above_average_age = ifelse(Age > 29.7 , 1 , 0))

# Recoding data 

# i. Recode the integer values of passenger classes to be "1st Class", "2nd Class" etc...

# Distinct data

# i. Get a distinct list of the Cabin names on the titanic 

# Advanced exercises 


####
# 4. Data summarisation (using base R syntax)

# Summary stats of passenger Sex
table(raw_data$Sex)

# Cross tabulation of passenger Sex and whether they Survived or not

# Proportion tables...

# Column sum table 

# Row sum table 

# 3 way cross tab breakdown by Passenger class, Sex and Survival status 

####
# 5. Graphics with ggplot2 ----

# Make your first ggplot2 bar chart! 
ggplot() 

# Make a filled bar chart 

# Make a ggplot2 with a theme

# Make a scatterplot

# Make an interactive scatterplot 
# - Note that you'll need the `ploty` package to do this!
