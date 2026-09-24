---
document: IT and Data Systems Overview (Management-Prepared)
prepared_by: Harborline Systems - CTO Office
date: 2025-10-30
---

# IT and Data Systems Overview

**Architecture.** Harborline runs a monolithic Ruby on Rails application (first commit 2014) with
a PostgreSQL 12 primary. Three microservices were extracted in 2022 for forecasting, EDI, and
notifications. Hosting is single-region AWS us-east-1 with no active failover.

**Data.** There is no data warehouse. Customer analytics are served from a nightly read-replica
snapshot. Revenue reporting is prepared in spreadsheets by the finance team from a set of manual
SQL extracts maintained by one analyst.

**Known constraints.**
- PostgreSQL 12 is past end of standard support.
- Two engineers hold all production deployment access; one is the original architect.
- The demand forecasting model is a 2019 gradient-boosting model retrained manually, roughly twice
  a year. There is no feature store, model registry, or drift monitoring.
- Customer-facing SLAs commit to 99.5% availability. Measured availability in FY2025 was 99.2%.
- No SOC 2 Type II report. A Type I was issued in 2023.
- 41 open dependency vulnerabilities of high or critical severity as at the last scan (Sep-2025).

**Cloud spend.** $2.9M in FY2025, up from $1.7M in FY2023, with no tagging or cost allocation.

**Roadmap.** Management's plan assumes a $6M ARR European direct business by FY2028 served from the
existing single-region US deployment. No EU data residency capability exists today.
