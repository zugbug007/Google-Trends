library(gtrendsR)
library(tidyverse)

res <- gtrends(c("national trust", "national trust membership", "national trust near me"), geo="GB")
plot(res)

iot <- res$interest_over_time
related_queries <- res$related_queries

iot2020 <- iot %>% 
  filter(date > as.Date("2020-01-01"))
iot2020 %>% 
  ggplot() + geom_line(aes(x = date,
                           y = hits,
                           color = keyword)) +
  theme_minimal() +
  labs(title = "NT Reopening 2020",
       subtitle = "Google Trends Report", caption = "9th June 2020")

