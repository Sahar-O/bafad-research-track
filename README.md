# BAFAD Accelerated Research Track — Starter Repository

> **Fall 2026 · Department of Mathematics and Computer Science · Fayetteville State University**

Welcome! This repository contains the three selection tasks for the **BAFAD Accelerated Research Track** — an opportunity to join active AI research this semester.

---

## Before You Start

1. **Read** the concept document posted on Canvas (*Anomaly Detection in Tactical Sensor Streams*).
2. **Pass the Canvas quiz** (4 out of 5 questions) — completing it unlocks this repository link.
3. **Fork this repository** (button at the top-right on GitHub). All your work goes in *your fork*.

---

## Repository Structure

```
bafad-research-track/
├── README.md               ← you are here
├── environment.yml         ← conda environment
├── data/
│   ├── smap_sample.csv     ← 500-row SMAP telemetry sample
│   ├── flights.csv         ← nycflights13 flights (subset)
│   └── airports.csv        ← nycflights13 airports
├── task-a/
│   └── task_a_starter.ipynb   ← SMAP exploratory data analysis
├── task-b/
│   ├── task_b_r_original.R    ← R source (Q2, Q3, Q4 from STAT 270 Assignment 1)
│   └── task_b_starter.ipynb   ← Python translation notebook (complete this)
└── task-c/
    └── reflection.md          ← research reflection (complete this)
```

---

## Setup

```bash
# 1. Clone YOUR fork (replace [YourUsername] with your GitHub username)
git clone https://github.com/[YourUsername]/bafad-research-track.git
cd bafad-research-track

# 2. Create the conda environment
conda env create -f environment.yml
conda activate bafad-research

# 3. Launch JupyterLab
jupyter lab
```

---

## The Three Tasks

| Task | File | What you do | Points |
|------|------|-------------|--------|
| **A** | `task-a/task_a_starter.ipynb` | Explore SMAP telemetry: summary stats, time-series plot, heatmap, histograms | 20 |
| **B** | `task-b/task_b_starter.ipynb` | Translate R code (Q2 + Q3 + Q4 from Assignment 1) into Python | 30 |
| **C** | `task-c/reflection.md` | Written reflection connecting the work to the BAFAD research question | 10 |

Tasks A and B are scored. Task C is pass/fail (see rubric on Canvas).

---

## Submission

1. Complete all three tasks in your fork.
2. Commit and push: `git add . && git commit -m "Complete Tasks A, B, C" && git push`
3. Paste your **fork URL** (e.g., `https://github.com/[YourUsername]/bafad-research-track`) into the Canvas assignment called *BAFAD Research Track — Task Submission*.

**Deadline:** [Application/Signup Deadline Date]

---

## Questions?

Stop by **SCITEC 408** or email **vmilanov@uncfsu.edu**.

> *BAFAD Research Project · Department of Mathematics and Computer Science · Fayetteville State University*
