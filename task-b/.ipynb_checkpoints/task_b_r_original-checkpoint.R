# STAT 270 — Assignment 1 (16-week section)
# Questions 2, 3, and 4  ·  nycflights13
# ─────────────────────────────────────────────────────────────────────────────
# This file contains the R source for the three questions you will translate
# into Python in task_b_starter.ipynb.
# Run this file in RStudio (or the R console) to verify your R understanding
# before writing the Python equivalent.
# ─────────────────────────────────────────────────────────────────────────────

library(ggplot2)
library(dplyr)
library(nycflights13)   # provides `flights` and `airports`

data(flights)
data(airports)


# ════════════════════════════════════════════════════════════════════════════
# QUESTION 2 — Frequency Tables and Proportions (10 pts)
# ════════════════════════════════════════════════════════════════════════════

# Part (a) — flights per carrier, sorted descending
carrier_counts <- flights |>
  count(carrier, sort = TRUE) |>
  mutate(prop = n / sum(n))

print(carrier_counts)

# Part (b) — proportion arriving late (arr_delay > 0) per carrier
late_arrivals <- flights |>
  group_by(carrier) |>
  summarise(late_rate = mean(arr_delay > 0, na.rm = TRUE)) |>
  arrange(desc(late_rate))

print(late_arrivals)


# ════════════════════════════════════════════════════════════════════════════
# QUESTION 3 — Histogram, Density, and Shape (15 pts)
# ════════════════════════════════════════════════════════════════════════════

# Part (a) — density histogram of dep_delay, filtered to [-60, 180] minutes
flights_filtered <- flights |>
  filter(dep_delay >= -60, dep_delay <= 180)

ggplot(flights_filtered, aes(x = dep_delay)) +
  geom_histogram(aes(y = after_stat(density)),
                 bins   = 40,
                 fill   = "#021B3A",
                 colour = "white",
                 alpha  = 0.85) +
  geom_density(colour = "#0EA5E9", linewidth = 1) +
  labs(
    title = "Distribution of Departure Delays",
    x     = "Departure Delay (minutes)",
    y     = "Density"
  ) +
  theme_bw()

# Part (b) — descriptive statistics
flights_filtered |>
  summarise(
    median_delay = median(dep_delay, na.rm = TRUE),
    IQR_delay    = IQR(dep_delay,    na.rm = TRUE)
  )


# ════════════════════════════════════════════════════════════════════════════
# QUESTION 4 — Grouped Summaries by Origin Airport (15 pts)
# ════════════════════════════════════════════════════════════════════════════

# Part (a) — summary statistics for arr_delay by origin
origin_summary <- flights |>
  group_by(origin) |>
  summarise(
    mean_arr   = mean(arr_delay,   na.rm = TRUE),
    median_arr = median(arr_delay, na.rm = TRUE),
    sd_arr     = sd(arr_delay,     na.rm = TRUE),
    iqr_arr    = IQR(arr_delay,    na.rm = TRUE)
  )

print(origin_summary)

# Part (b): interpret the table — see task_b_starter.ipynb for Python version
