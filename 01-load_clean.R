library(tidyverse)
# install.packages("janitor")
library(janitor)

# load data

data <- read_csv("data/titanic.csv")

# clean data 
# Converts column names to lowercase.
# Replaces spaces and other special characters with underscores (_).
# Removes leading/trailing spaces from column names.
# Converts non-standard characters to simpler ones (e.g., accented letters are replaced with plain letters).
data <- janitor::clean_names(data)

data

write_csv(data, "data/titanic_clean.csv") # new .csv to work with

print("Script 1 complete")