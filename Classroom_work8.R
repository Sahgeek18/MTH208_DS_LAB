getwd()
setwd("C:/MHT208_SAHIL/Worksheet8")


library(tidyverse)
library(rvest)
library(dplyr)

cricket_html <- read_html("https://www.relianceiccrankings.com/ranking/womenodi/batting/")

cricket_table <- html_table(cricket_html)
batting <- cricket_table[[1]]

colnames(batting)[4] <- "Country"
colnames(batting)[1] <- "Ranking"

dim(batting)

filter(batting, career == 807 )

country <- cricket_html %>%
  html_elements("tr img") %>%
  html_attr("alt")
country
length(country)

batting$Country <- country
batting


## Qn 6.
## a

ind_rank <- bat_df[bat_df$Country == "IND", ]$Ranking
ind_rank



## c)

bat_df <- batting[, 1:4]
ind <- group_by(bat_df, Country)
ind
ranks <- summarise(ind, 
                   rank = mean(Ranking)) %>%
  arrange(!desc(rank))

ranks


#### Starwars dataset
star <- starwars
dim(star)

View(star)
str(star)

star

## applying all the given functions
star %>% filter(hair_color == "blond")

star[star$skin_color == "light", ]
star[star$hair_color == "blond", ]

## Arrange

star %>% arrange(eye_color)

star %>% arrange(-desc(mass))


### Slice

star %>% slice(1:20)

star <- star[star$hair_color != "NA", ]
star

star$hair_color == "NA"

star[!is.na(star$height) & !is.na(star$mass), ]



## select -- to get columns
star %>% select(skin_color, hair_color, eye_color)
star %>% select(ends_with("color"))


### mutate
star %>% mutate(height_m = height/100) %>%
  select(starts_with("height_m"))



#### group by
a1 <- group_by(star, species, sex)
a2 <- select(a1, height, mass)
a3 <- summarise(a2, 
                avg_height = mean(height, na.rm = TRUE),
                avg_mass = mean(mass, na.rm = TRUE))


a3

# to check the number of subgroups
summarise(a2, count = n())

## we got to know Gungan males are 3 in count

#### Q4, 5
car <- mtcars
View(car)
dim(car)
str(car)
rownames(car) ## remeber this, sometimes it could happen

# car <- car %>%
#   mutate(Index == row_number())

new_df <- group_by(car, cyl)

avg <- summarise(new_df, avg_disp = mean(disp),
          avg_hp = mean(hp))
avg


## Qn 6. ^^^ Already done










