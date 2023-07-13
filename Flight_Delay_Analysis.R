
## Loading the Dataset

```{r}

library(tidyverse)

flights_df <- readRDS(url('https://gmubusinessanalytics.netlify.app/data/dulles_flights.rds'))

```


### Raw Data

```{r}

flights_df

```


```{r}

## Filtering the Data

arrival_delay_df <- flights_df %>% filter( arrival_delay >= 15)
arrival_delay_df

```

## Question 1

**Question**:
Which Destination Airport has the most arrival delay for flights from Dulles Airport?

**Answer**:
The destination airports which has the most arrival delay for flights from Dulles Airport are found to be Los Angeles and San Francisco. Los Angeles had a maximum of around 730 flights that got delayed with an average arrival delay of 54.97 minutes. San Francisco has the second highest 709 number of  flights which got delayed with average arrival delay of 62.72 minutes. Denver Airport has next highest of 449 flights getting delayed with 64.46 minutes of average arrival delay which is less as compared to the other two airports.

To add additional R code chunks for your work, select `Insert` then `R` from the top of this notebook file.

```{r}

flights <- arrival_delay_df %>% group_by(dest_airport_name) %>% 
                  summarise(n_arrival_delay = n(), avg_arrival_delay = mean(arrival_delay))

flights %>% arrange(desc(n_arrival_delay))
```

## Question 2

**Question**:
Which Airline had the most Arrival Delays?

**Answer**:
United Airlines is found to have the highest that is around 3115 number of flights causing arrival delays. It has an average arrival delay of 69.64 minutes. The second maximum arrival delays are caused by American Airlines which is 538 flights respectively with mean arrival delay of 74.13 minutes. It is quite less as compared to the number of flights getting delayed by United Airlines but the average arrival delay is found to be more.

```{r}
flights <- arrival_delay_df %>% group_by(airline) %>% 
                  summarise(n_arrival_delay = n(),
                            avg_arrival_delay = mean(arrival_delay))

flights %>% arrange(desc(n_arrival_delay))

```

## Question 3

**Question**:
Are certain months of the year problematic?

**Answer**:
It is observed that June and July are the most problematic months of the year. Because July month is found to have the highest number of flights experiencing arrival delays. It had nearly 748 flights witnessing arrival delay of an average of 84.187 minutes. June month has the second-highest number of flights experiencing arrival delays. About 682 flights caused arrival delay of average 88.37 minutes.June month has more average arrival delay as compared to July.
```{r}
flights <- arrival_delay_df %>% group_by(month) %>% 
                  summarise(n_flights = n(),
                  avg_arrival_delay = mean(arrival_delay))

flights %>% arrange(desc(n_flights))

ggplot(arrival_delay_df, aes(x = month, y = arrival_delay)) +
        geom_boxplot() +  theme(axis.text.x = element_text(angle = 90))
```

## Question 4

**Question**:
Does the flight distance affect the arrival delay?

**Answer**:
The average arrival delays are found to be between 0 and 250 minutes and the majority of the flights have a distance of less than 2500km. But there is no significant relation between the distance and arrival delay.

```{r}

library(ggplot2)
ggplot(arrival_delay_df, aes(x = arrival_delay, y = distance)) +
    geom_point()

```

## Question 5

**Question**:
Which Day of the week has the most arrival delay?

**Answer**:
Thursday has experienced the most number of arrival delays with a count of 893 arrival delays. After Thursday other two days that experienced more amount of delay are Monday and Friday. On Saturday it has the least number of arrival delays but the average delay that takes place is the highest than the other days.

```{r}

flights <- arrival_delay_df %>% group_by(weekday) %>% 
                  summarise(n_arrival_delay = n(),
                            avg_arrival_delay = mean(arrival_delay))

flights %>% arrange(desc(n_arrival_delay))

ggplot(flights, aes(x = weekday, y = n_arrival_delay)) + geom_col() +
  geom_bar(stat="identity", fill=" purple ") +
  geom_text(aes(label= n_arrival_delay), vjust=1.4, color="black", size=3.8)

```

## Question 6

**Question**:
Which Airport Region had the most number of arrival delays from Dulles Airport?

**Answer**:
The Destination airports in the West Region experience the maximum number of flights with a count of 2420 flights getting delayed at arrival. Also, South Region is the second maximum with 1104 flights getting delayed at arrival. The south region has more average arrival delay as compared to West region. 

```{r}

flights <- arrival_delay_df %>% group_by(dest_airport_region) %>% 
                  summarise(n_arrival_delay = n(),
                            avg_arrival_delay = mean(arrival_delay))

flights %>% arrange(desc(n_arrival_delay))

ggplot(flights, aes(x = dest_airport_region, y = n_arrival_delay)) + geom_col() + geom_bar(stat="identity", fill="lightblue") +
  geom_text(aes(label= n_arrival_delay), vjust=1.4, color="black", size=3.8)

```

## Question 7

**Question**:
Is arrival delay affected by airlines' departure delay?

**Answer**:
Yes, from the analysis below we can observe that arrival delay is directly proportional to departure delay because when departure delay increases arrival delay too increases.

```{r}

ggplot(arrival_delay_df, aes(x = dep_delay, y = arrival_delay)) + geom_line() + expand_limits( y = 0)

```

## Question 8

**Question**:

What is the distribution of departure times for the flights?

**Answer**:
From the following analysis, it can be inferred that a maximum of 7500 flights at Dulles Airport are scheduled to depart between 17:00 to 18:00. So these might lead to traffic at runways causing departure delays. 

```{r}

ggplot(flights_df, aes( x = dep_time)) +
  geom_histogram( bins = 20, fill = "orange")

```

      
## Executive Summary


1. Introduction:

The business problem is to evaluate the flight data of all domestic outbound flights from Dulles Airport and make recommendations on flight operations and strategies for minimizing flight delays.

The goal of my analysis is to discover which variables drive the differences between flights that are early/on time vs flights that are delayed.

2. Highlights and Key findings:

From the analysis, it is seen that most of the flights at Dulles Airport are scheduled to depart between 17:00 to 18:00. So this might be the reason causing a traffic jam at runways leading to the departure delays. Also, it is found that Los Angeles and San Francisco are the two destination airports that have the highest number of flights witnessing arrival delays. In terms of airlines, it is inferred that United Airlines is the highest among all other airlines in causing arrival delays. Analysis based on the regions concluded that the airports in the West region are prone to more arrival delays, followed by the South region.

It is also seen that the most problematic months of the year were found to be June and July, where July month has caused the most arrival flight delays whereas June month is found to be the second-highest to witness arrival delays. Summer Vacation may seem to be the influencing factor for causing delays in June and July. Moreover, most arrival flight delay takes place on Thursday and Monday. This might be because of the weekend as a lot of passengers might be traveling for the weekend and returning from the weekend and due to the air traffic, there might be a lot of arrival delays.

Also, it is seen that distance has nothing to contribute to the delays caused by the flights. We can also observe that arrival delay is directly proportional to departure delay so when departure delay increases arrival delay too increases.

3. Recommendations:

I recommend the company evenly schedule the departure of flights throughout the day rather than scheduling more flights at a specific time. I feel this is a good recommendation because it will reduce the traffic jam on runways which would further decrease the departure delays. This can be seen in the data analysis performed for Question 8 where the distribution of departure time of the flights is analyzed.

I recommend the company improve the functionality and services provided by United Airlines. I feel this is a good recommendation because this would reduce the arrival delays caused by United Airlines and it would increase customer satisfaction. This can be seen in the data analysis performed for Question 2 where airlines and average arrival delay is analyzed.

I recommend the company improve the operations and maintenance at Los Angeles and San Francisco airports. I feel this is a good recommendation because this would reduce the arrival delays of the flights from Dulles Airport as these airports have the highest number of flights experiencing delays. This recommendation is suggested from the analysis done in question 1.












