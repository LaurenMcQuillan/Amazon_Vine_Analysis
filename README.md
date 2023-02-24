# Amazon Vine Analysis

## Overview

The purpose of this analysis is to evaluate reviews written by Amazon Vine program members to determine if there is any bias toward five star reviews within the program. Amazon Vine is a program in which members are sent a product from a company that sells on Amazon and they are then required to write a review of the product. Companies that sell on Amazon pay a fee to Amazon for this service, with the benefit of obtaining reviews for their products. For this analysis, one dataset of pet product reviews was selected, then ETL was performed using PySpark. A connection was made to an AWS RDS instance, and the data was loaded into PgAdmin to perform additional analysis on the data to determine the ratio of five star reviews compared to total number of reviews.

## Results

![Results](https://user-images.githubusercontent.com/115508658/221310970-3f6c0aaa-d85a-4a9b-967b-ba66a69af93f.png)

After filtering the initial dataset to only include rows where the total votes were greater than or equal to 20, and where the helpful votes divided by total votes was greater than or equal to 50%, there were:

* 37,840 total pet product reviews from non-Vine members and 170 total pet product reviews from Vine members
  * Only .45% of the total reviews were made by Vine members
* 20,612 five-star reviews from non-Vine members and 65 five-star reviews from Vine members
* 54.47% of the reviews left by non-Vine members and 38.24% of the reviews left by Vine members were five-star reviews

## Summary

Within the pet products dataset, there does not appear to be any positivity bias for the reviews written by Vine members, with non-Vine members leaving five-star reviews 54.47% of the time, and Vine members leaving five-star reviews only 38.24% of the time. This could suggest that Vine members are more critical of the products that they receive, and non-Vine members more frequently leave positive reviews simply because they enjoy the product and not because they are obligated to leave a review. The difference in five-star review percentages between non-Vine and Vine members could be skewed due to the small dataset of Vine members. It could be helpful to include all data and not filter out rows where total votes were less than 20 and where helpful votes divided by total votes was less than 50%.  This could also be alleviated by using a larger dataset of all reviews, and not only considering one specific product type.
