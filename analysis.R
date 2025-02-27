library(tidyverse)
# install.packages("janitor")
library(janitor)
library(broom)

# load data

data <- read_csv("data/titanic.csv")

data

# clean data 
# Converts column names to lowercase.
# Replaces spaces and other special characters with underscores (_).
# Removes leading/trailing spaces from column names.
# Converts non-standard characters to simpler ones (e.g., accented letters are replaced with plain letters).
data <- janitor::clean_names(data)

data

# eda

ggplot(data = data, aes(x = pclass)) +
  geom_bar()

ggplot(data, aes(x = survived)) +
  geom_bar()


# model

model <- glm(survived ~ as.factor(pclass) + sex + age + fare, data = data, family = "binomial")

summary(model)

# results

coef <- broom::tidy(model)

# process results

coef <- coef |>
  dplyr::mutate(or = exp(estimate))

coef

# plot results


ggplot(coef |> dplyr::filter(term != "(Intercept)"), aes(x = term, y = or)) +
  geom_point() +
  coord_flip() +
  geom_hline(yintercept = 1)
