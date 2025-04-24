# Time Series Analysis in R
# 1. Load packages ----
library(quantmod)
library(tidyverse)
library(arrow)

# 2. Fetching historical price data ----

#Setting up the variables for pulling data
starting_date <- "2020-01-01"
end_data <- Sys.Date() - 1 # Not including today's date, as its data is still printing
stock_source <- "yahoo" # Using Yahoo_finance as the source for stock data
symbol <- "AAPL"

# Fetching data using quantmod::getSymbols function
apple_data <- getSymbols(symbol, src = stock_source,
                         from = starting_date, to = end_data, 
                         auto.assign = FALSE)

# Making a tibble version for an easier use
apple_tbl <- as_tibble(apple_data, rownames = "date") %>%
  rename_with(~ tolower(gsub("^.*\\.", "", .x))) %>%  # Remove "AAPL." prefix
  rename(
    Date = date,
    Open = open,
    High = high,
    Low = low,
    Close = close,
    Volume = volume,
    Adjusted = adjusted
  )

#Making sure the Date is in Date format
apple_tbl$Date <- as.Date(apple_tbl$Date)

# Printing recent rows with Date & Price as columns
head(cbind(Date = index(apple_tbl), Price = coredata(apple_tbl$Close)))

# Checking for the amount of NULL values
sum(is.na(apple_tbl$Close))

# Checking the dimensions of the dataframe
dim(apple_tbl)

# Checking the range of date in the data
range(apple_tbl$Date)

# Checking which classes are inside the data
class(apple_tbl)

# Printing a summary of the data
summary(apple_tbl)

# Defining the path to save the Parquet file
output_path <- file.path("data", paste0(symbol, "_stock_data.parquet"))

# Save the data as a Parquet file (Parquet is a good format to save financial data)
write_parquet(apple_tbl, output_path)

cat("Done!")
