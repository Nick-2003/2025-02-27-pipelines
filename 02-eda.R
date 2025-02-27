library(readr)
library(ggplot2)

data <- readr::read_csv("data/titanic_clean.csv")

# eda
ggplot(data = data, aes(x = pclass, fill = as.factor(survived))) +
  geom_bar() + 
  ggtitle("otitanic")
ggsave("output/titanic1.png")

ggplot(data, aes(x = survived)) +
  geom_bar()
ggsave("output/titanic2.png")

print("Script 2 complete")