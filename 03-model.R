library(readr)
library(ggplot2)

data <- readr::read_csv("data/titanic_clean.csv")

# model

model <- glm(
  survived ~ as.factor(pclass) + sex + age + fare, 
  data = data, family = "binomial"
)

summary(model)

write_rds(model, "output/model.RDS") # Save any arbitrary R object into a file; don't need to rerun model stuff again unless you want additional steps

print("Script 3 complete")