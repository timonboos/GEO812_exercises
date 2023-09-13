# Session 1: Data exploration

y <- 20
x <- seq(1, 10)
seq(from = 1, to = 10) 
seq(1, 10) 
library(tidyverse)

library(carData) 
titanic_survival <- as_tibble(TitanicSurvival)
msleep

filter(titanic_survival, age > 25)
filter(titanic_survival, age == 25)
filter(titanic_survival, age <= 25)

filter(msleep, vore == "carni" | vore == "omni")
filter(msleep, vore == "carni" &  sleep_total > 11)
filter(msleep, !is.na(sleep_total))
select(titanic_survival, survived, age)

arrange(titanic_survival, age)
arrange(titanic_survival, desc(age))

mutate(msleep, rem_ratio = sleep_rem / sleep_total)

summarise(titanic_survival, mean_age = mean(age, na.rm = TRUE))

group_by(titanic_survival, passengerClass) %>%
  summarise(mean_age = mean(age, na.rm = TRUE))

mean(x)
median(x)
sd(x)
IQR(x)
mad(x)
min(x)
quantile(x, 0.95)
max(x)
first(x)
nth(x, 2)
last(x)
n_distinct(x)
sum(x>10)

titanic_survival <- mutate(titanic_survival, id = row_number())
a <- select(titanic_survival, age, sex, id)
b <- select(titanic_survival, survived, passengerClass, id)
left_join(a, b, by = "id")

group_by(msleep, order) %>%
  summarise(mean_sleep = mean(sleep_total, na.rm = TRUE),
            mean_bodywt = mean(bodywt, na.rm = TRUE)) %>%
  ggplot() + 
  geom_point(mapping = aes(x = mean_sleep, y = mean_bodywt))

ggplot(data = msleep) + 
  geom_point(mapping = aes(x = sleep_total, y = sleep_rem))

ggplot(data = msleep) + 
  geom_point(mapping = aes(sleep_total, sleep_rem, color = vore))

ggplot(data = msleep) + 
  geom_point(mapping = aes(sleep_total, sleep_rem, size = bodywt))

ggplot(data = titanic_survival) +
  geom_bar(aes(x = passengerClass))

ggplot(data = titanic_survival) + 
  geom_bar(mapping = aes(passengerClass, fill = passengerClass))

ggplot(data = titanic_survival) + 
  geom_bar(mapping = aes(passengerClass, fill = survived))

