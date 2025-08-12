#' This is an example R Script. 
#' 
#' This is a block of comments. It is ALWAYS a great idea to use a lot of 
#'  comments in your code.  The hash-tag + single quote on the left 
#'  will perpetuate itself as you type and add new lines.
#
#  The hash-tag without the single quote will not auto-add a new one
#   for each line, and you have to do it yourself.
#

rm( list=ls() )

# Load in the tidyverse library
library( tidyverse )


# Here is a data set that exists on an external web server.
url <- "https://docs.google.com/spreadsheets/d/1Mk1YGH9LqjF7drJE-td1G_JkdADOU0eMlrP01WFBT8s/pub?gid=0&single=true&output=csv"


# Go look up the function read_csv() (important, the underline version, not the dot version).
#  and load these data in and assign them to a local variable.

read_csv( url ) -> df


# Make a summary of the data and look at the variables.
summary(df)

#' Questions: Answer these questions below using R code to show the proper answer.
#'  There will be additional questions, each with a sequential number, throughout
#'  the rest of this document.
#' 
#' 1. How many variables are there in the dataset?

ncol( df )
length( names( df ))


#' 2. What are the names of the variables in the data.frame?

ls()


#' 3. What data types are represented in the raw dataset?


#' 4. How many rows and columns are in this dataset?

dim( df )
nrow(df)
ncol(df)

#' Processing Date/Time
#' 
#' To process date and time functions, we need to bring in another library.
#' 
#' If you do not have this one installed, please install it.
library( lubridate )


#' The current date and time data is stored in the column `DateTime`
#' 
#' 6. Show the first entry in the data set for DateTime
df$DateTime[1]


#' The text format of date+time is locale specific (the US is the only one that
#'  has the month before the day, etc.).   We want to convert this column of data
#'  which is currently "character" into real dates and times.  For this, 
#'  go look up the function `mdy_hms()` (Month - Day - Year + Hour + Minute + Second)
#'  
#'  7. Make a new variable that is a real Date from the DateTime column.
date <- mdy_hms( df$DateTime, tz = "EST")

#' 8. Make two new variables derived from the raw data.  One that has air temperature
#'    in °C and another that has rain in cm.  Name them appropriately.

air <- (df$AirTempF - 32) * 5/9 
water <- df$Rain_in * 2.25 




#' 9. Create a new data.frame object that has the date, air temperature, and rain in 
#'    as columns.

data <- data.frame( date, air, water)
summary( data )

rm( df )



#' 10. Save this data.frame object to the local drive using the `write_csv()` function.

write_csv(data, file="myData.csv")



read_csv( url ) -> df 


df |>    # load the file
  select( DateTime, Rain_in )  |>  # select date and rain columns
  mutate( Date = mdy_hms( DateTime ) )  |>  # make real date
  mutate( Weekday = wday( Date, 
                          label = TRUE,
                          abbr = FALSE ) ) |> # make weekday 
  mutate( Rain = 2.25 * Rain_in ) |> # convert to cm 
  select( -DateTime, -Date, -Rain_in ) |> # remove stuff I don't need
  group_by( Weekday ) |> # group by weekday
  summarise( Rain = sum( Rain ) )  # summarize by total rain 































