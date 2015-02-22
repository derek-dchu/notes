## Data Mining
Knowledge discovery from data (KDD) 

### KDD process
1. Data preprocessing  
  * Input: raw data

    * Data cleaning
    * Data integration
    * Data normalization
    * Feature selection
    * Dimension reduction

2. Store data
  * Input: integrated & preprocessed data

    * Database
    * Data warehouse
    * Data repository

3. Data Mining  
  * Input: selected integrated & preprocessed data
  * Output: patterns

    * Multi-dimensional data summary
    * Pattern discovery
    * Association & correlation
    * Classification
    * Clustering
    * Outlier analysis

4. Pattern Evaluation  
  * Input: patterns which could be redundant, no meaningful
  * Output: Patterns Information Knowledge

    * Pattern evaluation
    * Pattern selection
    * Pattern interpretation
    * Pattern visualization
    * backward process to redo the data mining  


## Pattern Discovery
### Patterns
A set of items, subsequences, or substructures occur frequently together (or strongly correlated) in a data set. It represent *intrinsic* and *important properties* of data set.

### Frequent Patterns
If patterns are distinguished by frequency. We call a pattern is frequent pattern if a has support larger than `minsup`.

* (absolute) Support: Frequency or the number of occurrences of a pattern.
* (relative) Support: Probability.

* minsup: a minimum support threshold that .determines whether a pattern is frequent or not.
* Association rule: X -> Y (s, c)
  * s: Support, the probability that the pattern contains X and Y.
  * c: Confidence, the conditional probability that a pattern containing X also contains Y. `c = sup(X U Y) / sup(X)`

#### Association rule mining
Find all of the rules, X -> Y, with minimum support and confidence.

#### Closed pattern
A pattern X is closed if X is frequent, and there exists NO super-pattern Y with the same support as X.

* lossless compression of frequent pattern.

#### Max pattern
A pattern x is max if X is frequent, and there exists NO super-pattern Y.

* do not care the real support of the sub-patterns of a max-pattern.

***note: max pattern can be obtained by removing all patterns that have a super pattern in the closed frequent pattern set.***

### Downward closure (also called "Apriori")
Any subset of a frequent items must be frequent.

* If any subset of an patterns S is infrequent, then there is no chance for S to be frequent.

#### Apriori: A Candidate Generation & Test Approach


## Pattern Evaluation
Problem with support framework: support measures is objective, the generated patterns/rules may not be interesting.

### Interestingness Measures
| Measure | Range | Null-invariance |  
|---------|-------|-----------------|  
| Chi-square | [0, +∞) | No |  
| Lift | [0, +∞) | No |  
| All confidence | [0, 1] | Yes |  
| Jaccard | [0, 1] | Yes |  
| Cosine | [0, 1] | Yes |  
| Kulczynski | [0, 1] | Yes |  
| Max confidence | [0, 1] | Yes |  

#### Lift
`lift(B, C) = c(B -> C) / s(C) = s(B U C) / (s(B) x s(C))`, s: relative support.

Lift(B, C) may tell how B and C are correlated:
1. = 1: B and C are independent
2. > 1: positively correlated
3. < 1: negatively correlated

#### Chi-square
`Chi-square = sum((Observed - Expected) / Expected)`, for all combination of observations.

Chi-square = 0: independent
Chi-square > 0: correlated, positive: Observed > Expected or negative: Observed < Expected.

#### Null-invariance
Value does not change with the # of null-transactions.

* List and Chi-square are not null-invariance which is not to evaluate data that contain too many or too few null transactions.
* under measure that is not null-invariance:
  1. too few null transactions, we always get the result that two variables are independent.
  2. too many null transactions, we always get a strong positive correlation.


## Mining Diverse Patterns
