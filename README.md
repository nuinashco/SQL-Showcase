# SQL Challenge: Event-Based Sessionization and Streak Detection

## Overview

This repository contains a SQL challenge focused on sessionization and detecting streaks of events (e.g., consecutive purchases) using window functions. The dataset represents user activity on an online platform, and the task is to identify sessions and calculate the longest streak of consecutive `purchase` events within each session.

## Problem Statement

Given a dataset of user events, we want to:
1. Identify user sessions: A session is a sequence of events where the time between consecutive events does not exceed 30 minutes.
2. For each session, calculate the longest streak of consecutive `purchase` events.

## Dataset

The dataset consists of the following columns:
- `user_id`: Unique identifier for the user.
- `event_time`: Timestamp of the user’s activity.
- `event_type`: Type of event (e.g., `login`, `purchase`, `logout`).

### Example Data

| user_id | event_time          | event_type |
|---------|---------------------|------------|
| 1       | 2024-10-01 10:00:00 | login      |
| 1       | 2024-10-01 10:05:00 | purchase   |
| 1       | 2024-10-01 10:20:00 | purchase   |
| 1       | 2024-10-01 10:50:00 | purchase   |
| 1       | 2024-10-01 11:05:00 | logout     |
| 2       | 2024-10-02 09:00:00 | login      |
| 2       | 2024-10-02 09:25:00 | purchase   |
| 2       | 2024-10-02 09:50:00 | logout     |
| 2       | 2024-10-02 10:30:00 | login      |
| 2       | 2024-10-02 11:00:00 | logout     |

The full data for testing is available in `sql/create_table.sql` or `data/sample_data.csv`.