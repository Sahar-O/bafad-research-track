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
carrier_counts = (
    flights['carrier']
    .value_counts()
    .reset_index(name='n')
)
carrier_counts['prop'] = carrier_counts['n'] / carrier_counts['n'].sum()

print(carrier_counts)

# Part (b) — proportion arriving late (arr_delay > 0) per carrier
late_arrivals = (
    flights
    .assign(is_late=flights['arr_delay'] > 0)
    .groupby('carrier')['is_late']
    .mean()
    .reset_index(name='late_rate')
    .sort_values(by='late_rate', ascending=False)
)

print(late_arrivals)


# ════════════════════════════════════════════════════════════════════════════
# QUESTION 3 — Histogram, Density, and Shape (15 pts)
# ════════════════════════════════════════════════════════════════════════════

# Part (a) — density histogram of dep_delay, filtered to [-60, 180] minutes
flights_filtered = flights[(flights['dep_delay'] >= -60) & (flights['dep_delay'] <= 180)]

fig, ax = plt.subplots(figsize=(8, 5))

# Plot density histogram and overlay KDE line
sns.histplot(
    data=flights_filtered,
    x='dep_delay',
    bins=40,
    stat='density',
    color=NAVY,
    edgecolor='white',
    alpha=0.85,
    kde=True,
    ax=ax
)

# Customize KDE line color
ax.lines[0].set_color(BLUE)
ax.lines[0].set_linewidth(2)

ax.set_title('Distribution of Departure Delays')
ax.set_xlabel('Departure Delay (minutes)')
ax.set_ylabel('Density')
plt.tight_layout()
plt.show()

# Part (b) — descriptive statistics
median_delay = flights_filtered['dep_delay'].median()
q75, q25 = flights_filtered['dep_delay'].quantile([0.75, 0.25])
iqr_delay = q75 - q25

summary_q3 = pd.DataFrame({
    'median_delay': [median_delay],
    'IQR_delay': [iqr_delay]
})

print(summary_q3)

# ════════════════════════════════════════════════════════════════════════════
# QUESTION 4 — Grouped Summaries by Origin Airport (15 pts)
# ════════════════════════════════════════════════════════════════════════════

# Part (a) — summary statistics for arr_delay by origin
def calc_iqr(x):
    return x.quantile(0.75) - x.quantile(0.25)

origin_summary = (
    flights
    .groupby('origin')['arr_delay']
    .agg(
        mean_arr='mean',
        median_arr='median',
        sd_arr='std',
        iqr_arr=calc_iqr
    )
    .reset_index()
)

print(origin_summary)

# Part (b): interpret the table — see task_b_starter.ipynb for Python version

Looking at the origin summaries, departure and arrival delay metrics stay fairly consistent across EWR, JFK, and LGA. All three airports share a median arrival delay close to 0 (or slightly negative), but their mean arrival delays are noticeably higher due to extreme positive delay outliers skewing the average. LGA tends to have a slightly lower standard deviation and IQR than EWR and JFK, suggesting its flight delays are marginally less variable overall.