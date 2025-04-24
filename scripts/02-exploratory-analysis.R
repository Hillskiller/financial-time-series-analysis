# Time Series Analysis in R
# 1. Load packages ----
library(quantmod)
library(forecast)
library(tseries)
library(ggplot2)
library(tidyverse)
library(arrow)

theme_set(theme_minimal())
# 2. Loading in the data and visualizing ----
# Setting up variables
symbol <- "AAPL"

# Loading in symbol data
symbol_path <- file.path("data", paste0(symbol, "_stock_data.parquet"))

apple_tbl <- read_parquet(symbol_path)

# Plotting the closes relative to date
ggplot(apple_tbl, aes(x = Date, y = Close)) +
  geom_line() +
  labs(x = "Date", y = "Close", title = paste0(symbol, " Stock Price Over Time"))

# Summary of the closes
summary(apple_tbl$Close)

# Printing the mean of the closes
mean(apple_tbl$Close)

# Printing the standard deviation of the closes
sd(apple_tbl$Close)

# Checking the amount of null values
sum(is.na(apple_tbl))

# Removing all null values if they exist & saving into a new clean dataframe
apple_tbl_clean <- na.omit(apple_tbl)

# Turning into a timeseries in order to run decompose
apple_ts <- ts(apple_tbl_clean$Close, frequency = 30)
plot(apple_ts)

# Checking yearly, seasonality, noise and trend
plot(decompose(apple_ts))

plot(stl(apple_ts, s.window = "periodic"))


adf_test <- adf.test(apple_ts) # Allows us to tell if the data is stationary or not
if(adf_test$p.value < 0.5) # If P value < 0.5 then stationary
{
  cat("Stationary!")
} else
{
  cat("Non Stationary!")
}