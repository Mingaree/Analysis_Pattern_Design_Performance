# Pattern Design Department Performance - New Style vs. Carry Over Analysis
### Project Background
This production analysis is specifically focused on the Pattern Design department within an apparel manufacturing operation, with particular emphasis on how Merchandiser (MER) information timing impacts pattern development. Tracks the critical relationship between merchandiser specification delivery and pattern development timelines, highlighting how delays in receiving complete style specifications from merchandisers significantly impact the pattern team's ability to complete their work on schedule.  

The Pattern Design department relies on timely and accurate information from merchandisers to create patterns that meet design intent, accommodate specific material properties, and align with manufacturing requirements. This dashboard was developed to provide visibility into this interdepartmental dependency, identify where merchandiser delays are creating downstream pattern delays, and help quantify the impact on production timelines.   

Indicating this is an active monitoring tool used by pattern managers, production planners, and merchandising teams to improve cross-functional coordination.  

The interactive Power BI dashboard can be accessed [here.](https://app.powerbi.com/view?r=eyJrIjoiNGJlMGFiNWYtNDVkNC00NTM4LTk4NDQtOWRkM2RkNjMwYWRjIiwidCI6ImNjYzg4OGY1LTJiM2EtNDgwMi05Y2E2LTEzOGVmZmVjYTlkOCIsImMiOjEwfQ%3D%3D)  

![image](https://github.com/user-attachments/assets/46c3f404-0ac4-4feb-883e-2650226841e2)
![image](https://github.com/user-attachments/assets/4e566b4f-cf06-4441-853c-e9b37f866b78)  

The SQL queries utilized to clean , organize, and prepare data for the dashboard can be found ![here.](./SQL%20queries%20prepare%20data.sql)

# Data Overview
Database structure consists of pattern development metrics for apparel styles, order quantities and merchandiser release timing metrics divided into two main categories: New Styles and Carry Over styles. The data includes:  

 • Pattern status counts and associated order quantities across New Styles and Carry Over styles   
 • Pattern performance metrics with on-time/delay analysis  
 • Pattern development timeline metrics  
 • Detailed style-level data showing the relationship between merchandiser release dates and pattern status  
  • Merchandiser release timing metrics and their correlation to pattern completion  

# Key Findings

#### • Merchandiser-Pattern Relationship:

 • New Styles: Average merchandiser released PT day is 5.46 days (likely indicating 5.46 days late)  
 • Carry Over: Average merchandiser released PT day is -14.49 days (indicating release approximately 2 weeks early)  


#### • Pattern Completion Impact:

 • New Styles with late merchandiser information show only 23.62% on-time pattern completion  
 • Carry Over styles with early merchandiser information achieve 79.56% on-time pattern completion  


#### • Merchandiser Delay Cascade Effect:

 • 188 New Style patterns (35.21%) are stuck in "Pending MER" status, directly attributable to delayed merchandiser information  
 • Only 1 Carry Over style (0.23%) is pending merchandiser updates, demonstrating the critical difference in information flow  


#### • Production Volume Risk:

 • 3,075,890 ordered units for New Styles are affected by pattern delays stemming from late merchandiser information  
 • Pattern delays are causing significant portions of production (37.52% of New Style volume) to fall behind schedule  

# Insights & Recommendations
### Insights:

1. Merchandiser-Pattern Dependency: The data clearly demonstrates that merchandiser information timing is the primary driver of pattern development delays, with early information enabling significantly higher on-time performance.   
2. Information Flow Bottleneck: The 188 New Style patterns stuck in "Pending MER" status represent a direct workflow blockage caused by upstream information delays rather than pattern department capacity issues.    
3. Process Disparity: The stark difference between New Style and Carry Over merchandiser timing (-14.49 days vs. 5.46 days) highlights an opportunity to align processes across both categories.  
4. Predictive Indicator: Merchandiser information release timing serves as a reliable early warning indicator for pattern completion risk, with delays strongly correlating to pattern delays.  
5. Resource Inefficiency: Late merchandiser information creates inefficient use of pattern design resources, as work must be rushed, rescheduled, or redone to accommodate last-minute style specifications.  

### Recommendations:

1. Merchandiser Process Acceleration: Implement an expedited specification release process for New Styles, aiming to match the -14.49 day early release timing achieved for Carry Over styles.  
2. Cross-Functional Timeline Alignment: Restructure the production calendar to ensure merchandiser information is complete before pattern development is scheduled to begin, building in appropriate buffer time.   
3. Preliminary Pattern Development: Explore a two-phase pattern approach for New Styles where initial patterns begin with preliminary merchandiser specifications, followed by refinement once final details are available.   
4. Merchandiser-Pattern Handoff Protocol: Establish clear minimum requirements for style specifications that must be available before a style enters the pattern queue, preventing incomplete information from entering the workflow.  
5. Prioritization Framework: Develop a risk-based prioritization system for merchandiser releases, ensuring high-volume styles and those with complex pattern requirements receive earlier specification completion.  
6. Cross-Departmental Performance Metrics: Implement shared KPIs between Merchandising and Pattern Design teams to promote collaborative problem-solving and mutual accountability.  
7. Early Warning Escalation System: Create automated alerts when merchandiser releases fall behind schedule, triggering immediate cross-functional resolution before pattern timelines are impacted.  
