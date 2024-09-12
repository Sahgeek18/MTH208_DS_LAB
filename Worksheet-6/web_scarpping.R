######### These codes may not work since the source code has changed recently
# setting the path to my directory
setwd("C:/MHT208_SAHIL/Worksheet-6")


library(tidyverse)
library(rvest)

html <- read_html("https://www.iitk.ac.in/math/faculty")
class(html)

# it is an xml document which knows what html tags are and other terminologies


## extracting all tags with class = head3.
# The '.' indicates a class

name <- html_elements(html, ".head3")
name


# extracting all link tags from class head3
name <- html_elements(name, "a")
name

# extracting all the texts associated with the links
name <- html_text(name)
name


### A faster way

name1 <- html_elements(html, ".head3 a")
name <- html_text(name1)


### Clean and better way is to work with pipes

name2 <- html %>% html_elements(".head3 a") %>% html_text()


#### Extracting all the names of post docs

post_docs_html <- read_html("https://www.iitk.ac.in/math/visitors-post-doctoral-fellow")

names <- html_elements(post_docs_html, ".head2")
names

names <- html_text(names)
names

## Better way
post_doc_names <- post_docs_html %>% html_elements(".head2") %>% html_text()

# data.frame(table(post_doc_names))
df_names <- data.frame(post_doc_names)


df_names[3, ]



### Scrapping movie data

movie_html <- read_html("https://editorial.rottentomatoes.com/guide/best-netflix-movies-to-watch-right-now/")
class(movie_html)


# name3 <- html_elements(movie_html, ".article_movie_title")
# name3 <- html_text(name3)
# name3

## for rankings
rank <- movie_html %>% 
  html_elements(".countdown-index") %>%
  html_text()
# rank

ranking <- substring(rank , first = 2)
ranking


## for year

year <- movie_html %>%
  html_elements(".subtle.start-year") %>%
  html_text()


year
year <- as.numeric(substring(year, first = 2, last = 5))

## using lists for certain tasks
foo <- "100%90%why?"
dum <- strsplit(foo, "%")

### 
foo <- c(foo, "30%40%why?")
dum



### directors

dir <- movie_html %>%
  html_elements(".info.director") %>%
#   html_text()
# dir
  
# can't use bcz we have mutliple directors
  
  









