# Time Series Analysis of Financial Data in R

This project explores financial time series analysis using R. It is designed as a learning project for aspiring quantitative developers and data analysts.

---

## 📈 Project Features

- ✅ Historical stock price collection using `quantmod`
- ✅ Visualization and trend analysis with `ggplot2` and `tidyverse`
- ✅ Stationarity testing with `tseries`
- ✅ ARIMA time series forecasting using `forecast`

---

## 📁 Project Structure

R_financial_time_series_analysis/
├── scripts/                  # R scripts by stage (data collection, EDA, modeling, etc.)
│   ├── 01-data-collection.R
│   └── 02-exploratory-analysis.R
├── data/                    # Folder for raw or sample data
├── .gitignore
├── README.md
└── LICENSE                  # Open-source license

---

## ⚙️ How to Run

```bash
# Clone the repo
git clone git@github.com:yourusername/financial-time-series-analysis.git
cd financial-time-series-analysis
```


In RStudio or the R console:

install.packages(c("quantmod", "forecast", "tseries", "ggplot2", "tidyverse", "arrow"))

source("scripts/01-data-collection.R")
source("scripts/02-exploratory-analysis.R")


## 📄 License

This project is licensed under the MIT License. See the `LICENSE` file for more details.

## 👤 Author

**Moran Abbas**  
Aspiring Quantitative Developer  
[GitHub Profile](https://github.com/Hillskiller)