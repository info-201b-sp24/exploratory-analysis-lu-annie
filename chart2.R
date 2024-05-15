library(ggplot2)
library(dplyr)

# read csv
amazon_all <- read.csv("/Users/annielu/Desktop/info201 hw/exploratory-analysis-lu-annie/amazon_all.csv")

# select only price and boughtInLastMonth columns
amazon_all_2 <- select(amazon_all, price, boughtInLastMonth)

# plot scatterplot with ggplot2 and set zoom
ggplot(amazon_all_2, aes(x = price, y = boughtInLastMonth)) +
  geom_point() +
  labs(title = "Price v. Purchases in Last Month",
       x = "Price",
       y = "Purchases In Last Month") +
  coord_cartesian(xlim = c(0, 2000), ylim = c(0, 11000))