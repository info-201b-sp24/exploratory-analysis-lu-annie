library(dplyr)

# read csv
amazon_all <- read.csv("/Users/annielu/Desktop/info201 hw/exploratory-analysis-lu-annie/amazon_all.csv")

# group table by category name and calculate average price, stars, and num reviews
amazon_all_table <- amazon_all %>%
  select(category_name, stars, reviews, price) %>%
  group_by(category_name) %>%
  summarize(
    average_stars = mean(stars),
    average_no_reviews = mean(reviews),
    average_price = mean(price)
  )

# displays short ver of table
head(amazon_all_table)