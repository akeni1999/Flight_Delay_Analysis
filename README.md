# Flight_Delay_Analysis

### Situation

The goal of the project was to evaluate the flight data of all domestic outbound flights from Dulles International Airport and make recommendations on flight operations and strategies for minimizing flight delays.

### Task

My goal for my analysis was to discover which variables would drive the differences between flights that were early on time vs flights that were delayed. 

### Action

- I have analyzed and constructed essential patterns and trends in flight delays ~35,000 flights from Dulles International Airport across cities and states.
- Performed the analysis in R using the tidyverse packages and assessed the data to the initial hypothesis using Tidyr and Ggplot.

### Result

- Key Findings:
    - From the analysis, it is seen that most of the flights at Dulles Airport are scheduled to depart between 17:00 to 18:00. So this might be the reason causing a traffic jam at runways leading to the departure delays. Also, it is found that Los Angeles and San Francisco are the two destination airports that have the highest number of flights witnessing arrival delays. In terms of airlines, it is inferred that United Airlines is the highest among all other airlines in causing arrival delays. Analysis based on the regions concluded that the airports in the West region are prone to more arrival delays, followed by the South region.
    - It is also seen that the most problematic months of the year were found to be June and July, where July month has caused the most arrival flight delays whereas June month is found to be the second-highest to witness arrival delays. Summer Vacation may seem to be the influencing factor for causing delays in June and July. Moreover, most arrival flight delay takes place on Thursday and Monday. This might be because of the weekend as a lot of passengers might be traveling for the weekend and returning from the weekend and due to the air traffic, there might be a lot of arrival delays.
    - Also, it is seen that distance has nothing to contribute to the delays caused by the flights. We can also observe that arrival delay is directly proportional to departure delay so when departure delay increases arrival delay too increases.
    
- Recommendations:
    - I recommend the company evenly schedule the departure of flights throughout the day rather than scheduling more flights at a specific time. I feel this is a good recommendation because it will reduce the traffic jam on runways which would further decrease the departure delays. This can be seen in the data analysis performed for Question 8 where the distribution of departure time of the flights is analyzed.
    - I recommend the company improve the functionality and services provided by United Airlines. I feel this is a good recommendation because this would reduce the arrival delays caused by United Airlines and it would increase customer satisfaction. This can be seen in the data analysis performed for Question 2 where airlines and average arrival delay is analyzed.
    - I recommend the company improve the operations and maintenance at Los Angeles and San Francisco airports. I feel this is a good recommendation because this would reduce the arrival delays of the flights from Dulles Airport as these airports have the highest number of flights experiencing delays.
