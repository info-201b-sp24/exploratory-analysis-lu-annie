library(ggplot2)
library(dplyr)

amazon_all <- read.csv("/Users/annielu/Desktop/info201 hw/exploratory-analysis-lu-annie/amazon_all.csv")

category_price_summaries <- amazon_all %>%
  group_by(category_name) %>%
  summarize(total_price = sum(price)) %>%
  arrange(desc(total_price)) %>%
  slice_head(n = 5)

ggplot(category_price_summaries, aes(x = category_name, y = total_price)) +
  geom_bar(stat = "identity") +
  labs(title = "Total Price by Category",
       x = "Category Name",
       y = "Total Price")