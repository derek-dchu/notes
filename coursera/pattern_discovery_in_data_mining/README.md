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
