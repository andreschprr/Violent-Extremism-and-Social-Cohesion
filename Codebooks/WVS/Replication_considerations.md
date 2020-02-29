# Replication considerations
## Datasets

* ACLED data exists from 1960 and is updated daily at a Worldwide level
* World Value Survey data exists since 1980 and is entering its 7th round. It exists at a Worldwide level and all regions are standardized if using the longitudinal data survey
* Afrobarometer only applies to African countries but there are Barometers for other geographical areas. Not all barometers ask the same questions in the same manner, so when replicating the analysis in another area, this is a major source of concern

## Cleaning datasets and uniting

* The dataset from Afrobarometer is not standardize so the ID for Countries, Regions, and Questions vary by year. An initial step is understanding the equivalences across Rounds. For example, Algeria can be ID 1 in Round 4 but be ID 31 in Round 5. Also the same question probably appears in different order so Question 5 in Round 2 may be Question 12 in Round 7.
* The process of merging the data across datasets involve naming conventions. Make sure that names of countries or regions (if used) are consistent across the 3 datasets 
