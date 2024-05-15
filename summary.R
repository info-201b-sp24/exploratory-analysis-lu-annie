library(dplyr)

# read csv
amazon_all <- read.csv("/Users/annielu/Desktop/info201 hw/exploratory-analysis-lu-annie/amazon_all.csv")

summary_info <- list()

# calculates num rows
summary_info$num_observations <- nrow(amazon_all)

# calculates max price
summary_info$max_price <- amazon_all %>%
  filter(price == max(price, na.rm = T)) %>%
  select(price)

# calculates max rating
summary_info$max_rating <- amazon_all %>%
  filter(stars == max(stars, na.rm = T)) %>%
  select(stars)

# calculated most purchased recently
summary_info$most_bought_recently <- amazon_all %>%
  filter(boughtInLastMonth == max(boughtInLastMonth, na.rm = T)) %>%
  select(boughtInLastMonth)

# calculates category with the most bestsellers
summary_info$category_most_bestsellers  <- amazon_all %>%
  group_by(category_name) %>%
  filter(isBestSeller == "True") %>%
  summarize(count = n()) %>%
  arrange(desc(count)) %>%
  slice(1) %>%
  select(category_name, count)
