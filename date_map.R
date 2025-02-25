library(lubridate)
library(purrr)

#Exercise 1: Advanced Date Manipulation with lubridate
#Question 1: Generate a sequence of dates from January 1, 2015 to December 31, 2025, spaced by every two months. Extract the year, quarter, and ISO week number for each date.

data_sequence <- seq(ymd("2015-1-1"), ymd("2025-12-31"), by = ("2 month"))
data_information <- data.frame(
  Date = data_sequence,
  
  # Extract the year from each date 
  Year = map_dbl(data_sequence, year),
  
  # Extract the quarter from each date
  Quarter = map_dbl(data_sequence, quarter),
  
  # Extract the ISO week number from each date
  ISOweek = map_dbl(data_sequence, isoweek)
)
data_information  

