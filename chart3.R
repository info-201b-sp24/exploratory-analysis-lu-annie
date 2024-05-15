library(ggplot2)
library(dplyr)
library(stringr)

# read csv
amazon_all <- read.csv("/Users/annielu/Desktop/info201 hw/exploratory-analysis-lu-annie/amazon_all.csv")

# create group by and summarize all categories with average prices and only show top 5
category_price_summaries <- amazon_all %>%
  group_by(category_name) %>%
  summarize(avg_price = mean(price)) %>%
  arrange(desc(avg_price)) %>%
  slice_head(n = 5)

# wrap for x axis labels
category_price_summaries$category_name <- str_wrap(category_price_summaries$category_name, width = 10)

# plot bar chart with ggplot2
ggplot(category_price_summaries, aes(x = category_name, y = avg_price)) +
  geom_bar(stat = "identity") +
  labs(title = "Average Price by Category",
       x = "Category Name",
       y = "Average Price") +
  theme(axis.text.x = element_text(size = 8))