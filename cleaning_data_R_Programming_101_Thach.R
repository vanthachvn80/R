
#########CLEANING DATA #######
#https://www.youtube.com/watch?v=sV5lwAJ7vnQ
#many thanks to Greg Martin

# What is clean data?
# Variable types?
# Select and filter
# Find and deal with missing data
# Find and deal with duplicates
# Recording values

install.packages("tidyverse")

library(tidyverse)
data()
View(starwars)

# Variable types
glimpse(starwars)
class(starwars$gender)
unique(starwars$gender)

starwars$gender <- as.factor(starwars$gender)
class(starwars$gender)

levels(starwars$gender)

starwars$gender <- factor((starwars$gender),
                            levels=c("masculine", 
                                     "ferminine"))
levels(starwars$gender)

# Select variables

names(starwars)

starwars %>% 
  select(name, height, ends_with("color")) %>% 
  names()

# Filter observations

unique(starwars$hair_color)

select(name, height, ends_with("color")) %>% 
  filter(hair_color %in% c("blond", "brown") & height < 180)

# Missing data

mean(starwars$height, na.rm = TRUE)

starwars %>% 
  select(name, gender, hair_color, height)

starwars %>% 
  select(name, gender, hair_color, height) %>% 
  na.omit()

starwars %>% 
  select(name, gender, hair_color, height) %>% 
  filter(!complete.cases(.))

starwars %>% 
  select(name, gender, hair_color, height) %>% 
  filter(!complete.cases(.)) %>% 
  drop_na(height) %>% 
  View()

starwars %>% 
  select(name, gender, hair_color, height) %>% 
  filter(!complete.cases(.)) %>% 
  mutate(hair_color = replace_na(hair_color, "none"))

# Duplicates

Names <- c("Peter", "John", "Andrew", "Peter")
Age <- c(22, 33, 44, 22)

friends <- data.frame(Names, Age)

###duplicated(friends)

friends[!duplicated(friends), ]

friends %>% distinct() %>% 
  View()

# Recording variables
starwars %>% select(name, gender)
  
starwars %>% 
  select(name, gender) %>% 
  mutate(gender_coded = recode(gender,
                         "masculine" = 1,
                         "ferminine" = 2)) %>% 
  View()








  