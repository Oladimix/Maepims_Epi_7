# loading the required dataset
library(tidyverse)
library(readxl)

# Loading the dataset
data <- read_excel("C:/Users/Agba Xchanger/Documents/Datasets/covid-19_dataset.xlsx")


# Removing the columns without values
data <- subset(data, select = -c(extreme_poverty, hospital_beds_per_thousand, population))

# Extracting the 2020 to 2022
data <- head(data, 1092)

# further removing the unwanted columns
data <- subset(data, select = -c(population_density, median_age, aged_65_older, aged_70_older, gdp_per_capita, 
                                 cardiovasc_death_rate, diabetes_prevalence, female_smokers, male_smokers,
                                 handwashing_facilities, life_expectancy, human_development_index))

attach(data)

# Boxplot of the total cases
boxplot(total_cases, col = "brown", main = "Boxplot of the total cases detected")

## checking the trend of the total cases using ggplot
plot(date, total_cases)
ggplot(data, aes(x = date, y = total_cases)) + geom_point() + labs(title = "Total Cases detected over time")

boxplot(new_cases_smoothed, col = "brown", main = "Boxplot of the New cases Smoothed")

ggplot(data, aes(x = date, y = new_cases_smoothed)) + geom_point() + labs(title = "New Cases detected per day")


#Boxplot for total death
boxplot(total_deaths, col = "Brown", main = "Boxplot of the total death recorded")

ggplot(data, aes(x = date, y = total_deaths)) + geom_point() + labs(title = "Total Death detected over time")

ggplot(data, aes(x = stringency_index, y = total_cases)) + geom_point() + labs(title = "Total Cases detected vs Stringency Index")
