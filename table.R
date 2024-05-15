library(dplyr)

amazon_all <- read.csv("/Users/annielu/Desktop/info201 hw/exploratory-analysis-lu-annie/amazon_all.csv")

amazon_all_table <- amazon_all %>%
  select(category_name, stars, reviews, price) %>%
  group_by(category_name) %>%
  summarize(
    average_stars = mean(stars),
    average_no_reviews = mean(reviews),
    average_price = mean(price)
  )

  
head(amazon_all_table)