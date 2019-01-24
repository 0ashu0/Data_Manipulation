##########################################################

setwd("C:/Users/Ashutosh/Desktop/R_Work")
.libPaths('C:/Users/Ashutosh/Documents/R/R_packages')
install.packages('tidyverse')

##########################################################

library(dplyr)

if( file.exists('data/msleep_ggplot2.csv')){
  print("file is present")
}else{
  print("file is not present")
}


msleep <- read.csv('data/msleep_ggplot2.csv')
head(msleep)

#select()		  - select columns
#filter()		  - filter rows
#arrange()		- re-order or arrange rows
#mutate()		  - create new columns
#summarise()	- summarise values
#group_by()		- allows for group operations in the “split-apply-combine” concept


#### selecting columns using select()

sleepData <- select(msleep, name, sleep_total)


# select all columns except specific columns

head(select(msleep, c(-name, -genus)))
head(select(msleep, -name, -genus))


# select range of columns

head(select(msleep, vore:sleep_rem))


# select columns that start with certain string

head(select(msleep, starts_with("sl")))


# work on 
#ends_with() 	- Select columns that end with a character string
#contains() 	- Select columns that contain a character string
#matches() 		- Select columns that match a regular expression
#one_of() 		- Select columns names that are from a group of names


#### selecting rows using filter()

filter(msleep, sleep_total >= 16)
filter(msleep, sleep_total >= 16, bodywt >= 1)

# filtering for specific item

filter(msleep, order %in% c("Carnivora","Rodentia"))


###### Pipe Operator: %>%

# function 1 %>% function 2 %>% function 3..
# function 1 goes to function 2 goes to function 3..

head(select(msleep, name, order))
msleep %>% select(name, order) %>% head


#### arrange or re-order using arrange()

msleep %>% arrange(order) %>% head



msleep %>%
  select(name, order, sleep_total) %>%
  arrange(name, order, sleep_total) %>%
  head

#or#

head(arrange(select(msleep, name, order, sleep_total), name, order, sleep_total))     



msleep %>% 
  select(name, order, sleep_total) %>%
  arrange(sleep_total, name, order) %>%
  filter(sleep_total >= 16)



msleep %>%
  select(name, order, sleep_total) %>%
  arrange(desc(sleep_total), name, order) %>%
  filter(sleep_total >= 16)



#### create new column using mutate()

msleep %>%
  mutate(rem_proportion = sleep_rem / sleep_total) %>%
  head

msleep %>% head

http://genomicsclass.github.io/book/pages/dplyr_tutorial.html