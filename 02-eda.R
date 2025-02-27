library(readr)
library(ggplot2)

data <- readr::read_csv("data/titanic_clean.csv")

# eda

ggplot(data = data, aes(x = pclass)) +
  geom_bar()

ggplot(data, aes(x = survived)) +
  geom_bar()