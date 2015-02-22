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
`Chi-square = ∑((Observed - Expected) / Expected)`, for all combination of observations.

Chi-square = 0: independent
Chi-square > 0: correlated, positive: Observed > Expected or negative: Observed < Expected.

#### Null-invariance
Value does not change with the # of null-transactions.

* List and Chi-square are not null-invariance which is not to evaluate data that contain too many or too few null transactions.
* under measure that is not null-invariance:
  1. too few null transactions, we always get the result that two variables are independent.
  2. too many null transactions, we always get a strong positive correlation.

#### Imbalance Ratio
IR: measure the imbalance of two itemsets A and B in rule implications.

`IR(A, B) = |s(A) - s(B)| / (s(A) + s(B) - s(A U B))` 


## Mining Diverse Patterns
### Multiple-level Associations
* Customized Min-Supports

### Multiple-Dimension

### Quantitative Associations
Methods:
1. Static discretization based on predefine concept hierarchies.
2. Dynamic discretization based on data distribution.
3. Clustering: Distance-based association.
4. Deviation analysis.

### Negative Correlations
#### Rare patterns
Very low support but interesting.

#### Negative patterns
Negatively correlated: Unlikely to happen together.

#### Support-based definition
If itemsets A and B are both frequent but rarely occur together, which is `sup(A U B) << sup(A) x sup(B)`, then A and B are negatively correlated.

* It is not null-invariance.

#### Kulczynski measure-based definition
If itemsets A and B are frequent but `(P(A|B) + P(B|A)) / 2 < ε`, where `ε` is a negative pattern threshold, then A and B are negatively correlated.

* It is null-invariance.

### Compressed Patterns.
#### Pattern Distance
`Dist(P1, P2) = 1 - |T(P1) Ω T(P2)| / |T(P1) U T(P2)|`

#### delta-clustering
For each pattern P, find all patterns which can be expressed by P and whose distance to P is within delta (delta-cover).

### Colossal Pattern
#### Pattern-Fusion


## Constraint-Based
### Constraints
* Knowledge type constraint
* Data constraint
* Dimension / level constraint
* Rule (or pattern) constraint
* Interestingness constraint

### Pattern space pruning constraints
#### Anti-monotonic
If an itemset `S` violated constraint `C`, so does any of its superset.

* mining on itemset S can be terminated

e.g.
1. sum(S.price) ≤ v
2. range(S.price) ≤ v
3. support(S) ≥ theta

#### Data Anti-monotonic
In the mining process, if a data entry `t` cannot satisfy a pattern `p` under `c`, `t` cannot satisfy `p``s superset either. Then data entry `t` can be pruned.

e.g.
1. sum(S.price) ≤ v
2. min(S.price) ≤ v
3. range(S.price) ≤ v

#### Monotonic
If an itemset S satisfied the constraint `C`, so does any of its superset.

* we do not need to check C in subsequent mining.

e.g.
1. sum(S.price) ≥ v
2. min(S.price) ≤ v
3. range(S.price) ≥ v

#### Succinct
IF the constraint `c` can be enforced by directly manipulating the data.

e.g.
1. To find those patterns without item i
2. To find those patterns containing item i
3. min(S.price) ≤ v

#### Convertible

### Data space pruning constraints
#### Data succinct

#### Data anti-monotonic

### Handle Multiple Constraints