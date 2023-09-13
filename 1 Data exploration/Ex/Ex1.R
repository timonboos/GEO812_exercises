library(gapminder)
library(dplyr)
library(ggplot2)
## Exercise 1
df<-gapminder

#1.2
most_recent_year <- max(df$year)
df_most_recent_year <- filter(df, year==most_recent_year)

#1.3
df_most_recent_year_life_exp <- arrange(df_most_recent_year, desc(lifeExp))
print(df_most_recent_year_life_exp, n=5)
head(df_most_recent_year_life_exp$country, n=5)

#1.4
df_most_recent_year_GDP_abs %>%
  mutate(GDP_abs = gdpPercap * pop) %>%
  group_by(continent) %>%
  summarise(GDP_cont = sum(GDP_abs))

#1.5 + 1.6
ggplot(df_most_recent_year_life_exp)+
  geom_point(mapping = aes(x = lifeExp , y = gdpPercap , color = continent)) +
  scale_y_log10()



