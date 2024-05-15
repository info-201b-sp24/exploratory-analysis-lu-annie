library(dplyr)

amazon_all <- read.csv("/Users/annielu/Desktop/info201 hw/exploratory-analysis-lu-annie/amazon_all.csv")

summary_info <- list()

summary_info$num_observations <- nrow(amazon_all)

summary_info$max_price <- amazon_all %>%
  filter(price == max(price, na.rm = T)) %>%
  select(price)

summary_info$max_rating <- amazon_all %>%
  filter(stars == max(stars, na.rm = T)) %>%
  select(stars)

summary_info$most_bought_recently <- amazon_all %>%
  filter(boughtInLastMonth == max(boughtInLastMonth, na.rm = T)) %>%
  select(boughtInLastMonth)

summary_info$category_most_bestsellers  <- amazon_all %>%
  group_by(category_name) %>%
  filter(isBestSeller == "True") %>%
  summarize(count = n()) %>%
  arrange(desc(count)) %>%
  slice(1) %>%
  select(category_name, count)
