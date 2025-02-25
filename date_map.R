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

#Exercise 2: Complex Date Arithmetic
#Question 2: Given the following dates, compute the difference in months and weeks between each consecutive pair.

sample_dates <- ymd(c("2018-03-15", "2020-07-20", "2023-01-10", "2025-09-05"))

#Calculate the difference in months between each consecutive pair of dates
months_difference <- time_length(interval(sample_dates[-length(sample_dates)], sample_dates[-1]), "months")

#Compute the total week difference.
week_difference <- time_length(interval(sample_dates[-length(sample_dates)], sample_dates[-1]), "weeks")

#Create a data frame to display the results.
Difference_in_months_and_weeks <- data.frame(
  Start_Date = sample_dates[-length(sample_dates)],
  End_Date = sample_dates[-1],
  Month_Difference = round(months_difference),
  Week_Difference = round(week_difference)
)
Difference_in_months_and_weeks