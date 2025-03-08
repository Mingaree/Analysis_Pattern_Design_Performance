# Pattern Design Department Performance - New Style vs. Carry Over Analysis
### Project Background
This production analysis is specifically focused on the Pattern Design department within an apparel manufacturing operation. The project tracks and analyzes the pattern development process, which is a critical early stage in the production pipeline that significantly impacts downstream efficiency. Distinguishes between new product patterns that must be created from scratch and existing "carry over" patterns that require minimal or no modification.  

The Pattern Design department serves as a crucial link between initial style design and material resource planning (MER), directly influencing production timelines and quality outcomes. This dashboard was developed to provide visibility into pattern development status, identify bottlenecks, track on-time performance, and help manage the complex timelines associated with pattern creation across multiple style categories and production locations.  

Suggesting this is an active monitoring tool that supports real-time decision making specifically for the Pattern Design team and its stakeholders. The system appears to be used by pattern managers, production planners, and development leads to coordinate pattern development and ensure smooth handoffs to subsequent production stages.  

The interactive Power BI dashboard can be accessed [here.](https://app.powerbi.com/view?r=eyJrIjoiNGJlMGFiNWYtNDVkNC00NTM4LTk4NDQtOWRkM2RkNjMwYWRjIiwidCI6ImNjYzg4OGY1LTJiM2EtNDgwMi05Y2E2LTEzOGVmZmVjYTlkOCIsImMiOjEwfQ%3D%3D)  

![image](https://github.com/user-attachments/assets/46c3f404-0ac4-4feb-883e-2650226841e2)
![image](https://github.com/user-attachments/assets/4e566b4f-cf06-4441-853c-e9b37f866b78)  

The SQL queries utilized to clean , organize, and prepare data for the dashboard can be found ![here.](./SQL%20queries%20prepare%20data.sql)

# Data Overview
database structure consists of pattern development metrics for apparel styles, order quantities divided into two main categories: New Styles and Carry Over styles. The data includes:

 • Pattern status counts and associated order quantities
 • Pattern performance metrics with on-time/delay analysis
 • Pattern development timeline metrics
 • Detailed style-level data with pattern-related information, priority codes, and key milestone dates

# Key Findings

1. Pattern Workload Distribution:

New Styles: 534 patterns with 3,075,890 ordered units
Carry Over: 430 patterns with 6,619,360 ordered units


2. Pattern Completion Status:

 • New Styles: 61.80% of patterns (330) are finished, while 35.21% (188) are pending MER approval and 16 are still in development
 • Carry Over: 90.70% of patterns (390) require no updates, demonstrating efficient resource allocation


3. Pattern Timeliness Performance:

 • New Styles: Only 23.62% of patterns are finished on-time, with 37.52% finished with delays
 • Carry Over: Much better performance with 79.56% of patterns finished on-time


4. Pattern Development Metrics:

 • New Style patterns have an average delay of 55.56 days compared to 45.92 days for Carry Over patterns
 • Pattern handoff times (shown in "FINISHED DAY") average 19.07 days for New Styles vs. just 4.14 days for Carry Over


5. Pattern Categories:

 • Patterns are developed for various programs including BRANDED, TRAINING/LIFESTYLE, MEN BAS, WOMEN TRAINING, and TEAM APPAREL
 • Multiple production techniques are employed based on manufacturer capabilities (ADD, ARM, WAWA, JOY, PAREWA)
