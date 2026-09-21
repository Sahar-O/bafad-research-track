# Task C — Research Reflection

> **BAFAD Accelerated Research Track · Fall 2026**
> Complete **after** finishing Tasks A and B.

---

## Instructions

Write your responses directly in this file (replace the placeholder text).
Aim for **150–200 words total** across both questions.
Be specific — reference your actual experience with the data and code.

---

## Question 1 — Connecting the Work to Research

*After completing Tasks A and B, how does hands-on data exploration relate to the research problem described in **Anomaly Detection in Tactical Sensor Streams** (the document you read before the Canvas quiz)?*

Consider: What patterns did you observe in the SMAP data? How might those patterns complicate or inform the design of an autoencoder-based anomaly detector?

**Your response (75–100 words):**

Messing around with the SMAP data made it super clear how chaotic real-world sensor streams actually are. Back in Task A, I saw that anomalies weren't just quick, isolated glitches on a single channel—they were usually multi-channel shifts happening all at once. That kind of synchronized noise means a basic single-sensor threshold isn't going to cut it. It makes a strong case for an autoencoder, since it learns what "normal" looks like across every channel at the same time. The real headache will be setting the reconstruction error threshold just right, especially with how noisy the baseline data can be.
---

## Question 2 — Self-Assessment of Readiness

*What specific gaps in your current knowledge — Python skills, statistics concepts, or ML background — do you expect to encounter if you join the research group? What is your plan for addressing them?*

Be honest. There are no wrong answers — this helps us plan the onboarding schedule.

**Your response (75–100 words):**

I feel pretty good handling basic data wrangling in pandas, but deep learning frameworks like PyTorch are definitely a gap for me right now—especially when it comes to building autoencoder models from scratch. I also want to get more comfortable with linear algebra and time-series concepts. To bridge that, my plan is to work through a few PyTorch autoencoder guides and practice time-series preprocessing before the research work kicks into high gear.
---

*Submission: commit this file to your fork and include it in the GitHub repo URL you submit on Canvas.*
