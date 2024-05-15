library(ggplot2)
library(dplyr)

amazon_all <- read.csv("/Users/annielu/Desktop/info201 hw/exploratory-analysis-lu-annie/amazon_all.csv")

amazon_all <- select(amazon_all, stars, price)

amazon_all <- amazon_all %>%
  mutate(bins = cut(stars, breaks = seq(1, 6, by = 1), labels = c("1-1.9", "2-2.9", "3-3.9", "4-4.9", "5"))) %>%
  group_by(bins) %>%
  summarize(price = mean(price))


# Create the histogram
ggplot(amazon_all, aes(x = bins, y = price)) +
  geom_histogram(stat = "identity") +
  labs(title = "Average Price Distribution by Star Ratings",
       x = "Star Ratings",
       y = "Price") +
  scale_x_discrete(labels = c("1-1.9", "2-2.9", "3-3.9", "4-4.9", "5"))