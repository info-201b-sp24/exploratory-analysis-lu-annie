library(ggplot2)
library(dplyr)

amazon_all <- read.csv("/Users/annielu/Desktop/info201 hw/exploratory-analysis-lu-annie/amazon_all.csv")
amazon_all <- select(amazon_all, stars, price)

ggplot(amazon_all, aes(x = stars, y = price)) +
  geom_point() +
  labs(title = "Ratings v. Price for Amazon Products",
       x = "Stars",
       y = "Price")