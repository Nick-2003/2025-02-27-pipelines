library(readr)
library(ggplot2)
library(broom)

model <- read_rds("output/model.RDS")

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
ggsave("output/titanic3.png")

print("Script 4 complete")