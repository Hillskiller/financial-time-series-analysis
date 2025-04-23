# Time Series Forecasting of Stock Prices in R
# 1. Load packages ----
library(quantmod)
library(forecast)
library(tseries)
library(ggplot2)
library(tidyverse)

# 2. Fetching historical price data ----

#Setting up the variables to pulling data

starting_date <- "2020-01-01"
end_data <- Sys.Date() - 1 # Not including today's date, as its data is still printing
stock_source <- "yahoo" # Using Yahoo_finance as the source for stock data
symbol <- "AAPL"

# Fetching data using getSymbols from quantmod
apple_data <- getSymbols(symbol, src = stock_source,
                         from = starting_date, to = end_data, 
                         auto.assign = FALSE)

# Making a dataframe only for the close column
apple_closes <- apple_data$AAPL.Close

# Making a tibble version for visualization
apple_tbl <- tibble(
  date = index(apple_closes),          # Dates
  close = coredata(apple_closes)       # Values
)


head(cbind(Date = index(apple_closes), Price = coredata(apple_closes)))

# Checking for the amount of NULL values
sum(is.na(apple_data$AAPL.Close))

# Checking the dimensions of the dataframe
dim(apple_closes)

# Checking the range 
range(index(apple_closes))

# Checking which classes are inside the data
class(apple_closes)

# Printing a summary of the data
summary(apple_closes)


