# atpg-scan-design
Test pattern generation and scan design exploration for ITC'99 benchmark circuit b14 using Synopsys Design Vision and TetraMax. Includes full scan and optimized partial scan implementations based on controllability and observability metrics (SCOAP).
# Partial Scan and Test Pattern Generation using TetraMax

This repository contains the project files for an ECE 553 course project at UW-Madison, focused on scan-based testing of the `b14` circuit from the ITC'99 benchmark suite. The project explores both **full scan** and **partial scan** methodologies using Synopsys **Design Vision** and **TetraMax** tools.

## Project Overview

We perform two key tasks:
1. **Full Scan Test Pattern Generation**
2. **Partial Scan Design Optimization**

The goal is to optimize test coverage while balancing area, pin count, and test pattern efficiency.

## Tools Used

- Synopsys Design Vision
- Synopsys TetraMax
- Excel (for SCOAP-based FF ranking and metric computation)

## Key Techniques

- **SCOAP-based FF Ranking**: Flip-flops were ranked using custom metrics based on controllability and observability scores.
- **Design Space Exploration**: Multiple iterations of partial scan FF selection were evaluated for maximizing a custom metric `M`, which considers test coverage, area, number of patterns, chain length, and additional pins.
- **ATPG Configuration**: TetraMax was configured to apply test compression, random pattern insertion, and advanced compaction techniques to optimize test sets.

## Result Summary

| Mode        | Test Coverage | Area       | #Patterns | M Metric |
|-------------|----------------|------------|-----------|----------|
| Full Scan   | 100%           | 14233.83   | 453       | ~105     |
| Partial Scan (Best) | 40.1%         | 13692.54   | 323       | **233.7** |

> Partial scan outperforms full scan in overall efficiency (`M` metric), demonstrating the trade-offs between area, test time, and coverage.


## Author

Kaushik Shroff  
Spring 2025  
University of Wisconsin–Madison  
ECE 553: Testing and Testable Design of Digital Systems
