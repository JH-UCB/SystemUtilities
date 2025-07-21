# Statistical Tests Reference for Data Science and Machine Learning

## Tests for Comparing Means

| Test Name | Purpose | Null Hypothesis (H₀) | Test Statistic | Assumptions | Example Use Case |
|-----------|---------|---------------------|----------------|-------------|------------------|
| **One-sample t-test** | Compare sample mean to known value | μ = μ₀ | t = (x̄ - μ₀)/(s/√n)<br>where:<br>• x̄ = sample mean<br>• μ₀ = hypothesized mean<br>• s = sample std dev<br>• n = sample size | • Normal distribution<br>• Random sampling<br>• Continuous data | Testing if average customer satisfaction differs from industry standard of 7.5 |
| **Independent samples t-test** | Compare means of two independent groups | μ₁ = μ₂ | t = (x̄₁ - x̄₂)/√(sp²(1/n₁ + 1/n₂))<br>where:<br>• sp² = pooled variance<br>• n₁, n₂ = sample sizes | • Normal distribution<br>• Equal variances<br>• Independent samples<br>• Continuous data | Comparing conversion rates between A/B test groups |
| **Welch's t-test** | Compare means when variances unequal | μ₁ = μ₂ | t = (x̄₁ - x̄₂)/√(s₁²/n₁ + s₂²/n₂)<br>where:<br>• s₁², s₂² = sample variances | • Normal distribution<br>• Unequal variances<br>• Independent samples | Comparing salaries between two departments with different variability |
| **Paired t-test** | Compare means of paired/matched samples | μd = 0 | t = d̄/(sd/√n)<br>where:<br>• d̄ = mean difference<br>• sd = std dev of differences | • Normal distribution of differences<br>• Paired observations | Before/after treatment effects in same subjects |
| **One-way ANOVA** | Compare means across 3+ groups | μ₁ = μ₂ = ... = μk | F = MSB/MSW<br>where:<br>• MSB = between-group variance<br>• MSW = within-group variance<br>• k = number of groups | • Normal distribution<br>• Equal variances<br>• Independent samples | Comparing model performance across multiple algorithms |
| **Two-way ANOVA** | Test main effects and interactions | No main effects or interactions | F = MS(effect)/MS(error)<br>for each effect | • Normal distribution<br>• Equal variances<br>• Balanced design | Testing effects of hyperparameters and data size on model accuracy |
| **Repeated Measures ANOVA** | Compare means across repeated measurements | μ₁ = μ₂ = ... = μk | F = MS(treatment)/MS(error)<br>with adjusted df | • Sphericity<br>• Normal distribution<br>• No missing data | Tracking model performance over multiple time periods |
| **MANOVA** | Compare multiple dependent variables | μ₁ = μ₂ = ... = μk<br>(vector equality) | Wilks' Λ, Pillai's trace, etc. | • Multivariate normality<br>• Equal covariance matrices | Comparing multiple metrics (precision, recall, F1) across models |

## Non-parametric Tests for Location

| Test Name | Purpose | Null Hypothesis (H₀) | Test Statistic | Assumptions | Example Use Case |
|-----------|---------|---------------------|----------------|-------------|------------------|
| **Mann-Whitney U test** | Compare two independent groups (non-parametric) | Distributions are identical | U = min(U₁, U₂)<br>where U₁, U₂ are rank sums | • Independent samples<br>• Ordinal or continuous data<br>• Similar distribution shapes | Comparing user ratings (1-5 scale) between two app versions |
| **Wilcoxon signed-rank test** | Compare paired samples (non-parametric) | Median difference = 0 | W = min(W⁺, W⁻)<br>where W⁺, W⁻ are positive/negative rank sums | • Paired samples<br>• Ordinal or continuous<br>• Symmetric differences | Comparing algorithm rankings before/after optimization |
| **Kruskal-Wallis test** | Compare 3+ groups (non-parametric) | All groups have same distribution | H = (12/n(n+1))∑(Ri²/ni) - 3(n+1)<br>where:<br>• Ri = rank sum for group i<br>• ni = size of group i | • Independent samples<br>• Ordinal or continuous | Comparing customer satisfaction across multiple product versions |
| **Friedman test** | Compare 3+ related groups | All treatments have same effect | χ²r = (12/nk(k+1))∑Ri² - 3n(k+1)<br>where:<br>• k = number of treatments<br>• Ri = rank sum for treatment i | • Related samples<br>• Ordinal or continuous | Comparing multiple algorithms on same datasets |

## Tests for Proportions and Categorical Data

| Test Name | Purpose | Null Hypothesis (H₀) | Test Statistic | Assumptions | Example Use Case |
|-----------|---------|---------------------|----------------|-------------|------------------|
| **One-proportion z-test** | Test if proportion equals hypothesized value | p = p₀ | z = (p̂ - p₀)/√(p₀(1-p₀)/n)<br>where:<br>• p̂ = sample proportion<br>• p₀ = hypothesized proportion | • Large sample (np₀ ≥ 10, n(1-p₀) ≥ 10)<br>• Random sampling | Testing if model accuracy exceeds 90% benchmark |
| **Two-proportion z-test** | Compare two proportions | p₁ = p₂ | z = (p̂₁ - p̂₂)/√(p̂(1-p̂)(1/n₁ + 1/n₂))<br>where p̂ = pooled proportion | • Large samples<br>• Independent groups | Comparing click-through rates between two ad campaigns |
| **Chi-square test of independence** | Test association between categorical variables | Variables are independent | χ² = ∑((O - E)²/E)<br>where:<br>• O = observed frequency<br>• E = expected frequency | • Expected frequencies ≥ 5<br>• Independent observations | Testing if feature selection method affects model type choice |
| **Chi-square goodness of fit** | Test if data follows expected distribution | Data follows specified distribution | χ² = ∑((O - E)²/E) | • Expected frequencies ≥ 5<br>• Categories are exhaustive | Testing if errors follow normal distribution |
| **Fisher's exact test** | Test association (small samples) | Variables are independent | Based on hypergeometric distribution | • 2×2 contingency table<br>• Fixed marginals | Testing if rare event occurrence differs between two models |
| **McNemar's test** | Compare paired proportions | p₁ = p₂ (marginal homogeneity) | χ² = (b - c)²/(b + c)<br>where b, c are discordant pairs | • Paired binary data<br>• Large sample | Comparing classification accuracy on same test set |

## Tests for Correlation and Association

| Test Name | Purpose | Null Hypothesis (H₀) | Test Statistic | Assumptions | Example Use Case |
|-----------|---------|---------------------|----------------|-------------|------------------|
| **Pearson correlation test** | Test linear correlation | ρ = 0 | t = r√(n-2)/√(1-r²)<br>where:<br>• r = sample correlation<br>• n = sample size | • Bivariate normal<br>• Linear relationship<br>• Continuous variables | Testing if feature importance correlates with coefficient magnitude |
| **Spearman rank correlation** | Test monotonic relationship | ρs = 0 | Similar to Pearson on ranks | • Ordinal or continuous<br>• Monotonic relationship | Testing if model complexity relates to training time |
| **Kendall's tau** | Test ordinal association | τ = 0 | z = τ/√(2(2n+5)/9n(n-1)) | • Ordinal data<br>• Many ties handled well | Testing agreement between two ranking algorithms |
| **Partial correlation test** | Test correlation controlling for other variables | ρxy.z = 0 | t = rxy.z√(n-k-2)/√(1-r²xy.z)<br>where k = number controlled | • Multivariate normal<br>• Linear relationships | Testing feature correlation after controlling for confounders |

## Tests for Variance and Distribution

| Test Name | Purpose | Null Hypothesis (H₀) | Test Statistic | Assumptions | Example Use Case |
|-----------|---------|---------------------|----------------|-------------|------------------|
| **F-test for variances** | Compare two variances | σ₁² = σ₂² | F = s₁²/s₂²<br>where s₁² > s₂² | • Normal distributions<br>• Independent samples | Testing if two models have equal prediction variance |
| **Levene's test** | Test equality of variances (robust) | σ₁² = σ₂² = ... = σk² | F based on absolute deviations | • Independent samples<br>• Any distribution | Checking ANOVA assumption of equal variances |
| **Bartlett's test** | Test equality of variances | σ₁² = σ₂² = ... = σk² | χ² statistic | • Normal distributions<br>• Sensitive to non-normality | Testing homoscedasticity in regression residuals |
| **Brown-Forsythe test** | Test equality of variances (very robust) | σ₁² = σ₂² = ... = σk² | F based on median deviations | • Independent samples<br>• Robust to outliers | Testing variance equality with skewed distributions |

## Normality Tests

| Test Name | Purpose | Null Hypothesis (H₀) | Test Statistic | Assumptions | Example Use Case |
|-----------|---------|---------------------|----------------|-------------|------------------|
| **Shapiro-Wilk test** | Test for normality | Data is normally distributed | W statistic based on order statistics | • Best for small samples (n < 50)<br>• Continuous data | Testing if residuals are normally distributed |
| **Kolmogorov-Smirnov test** | Test against any distribution | Data follows specified distribution | D = max|Fn(x) - F(x)|<br>where:<br>• Fn = empirical CDF<br>• F = theoretical CDF | • Continuous distribution<br>• Fully specified H₀ | Testing if data follows exponential distribution |
| **Anderson-Darling test** | Test for normality (sensitive to tails) | Data is normally distributed | A² weighted by tail importance | • Continuous data<br>• More powerful than K-S | Testing if log-transformed data is normal |
| **Jarque-Bera test** | Test normality via skewness/kurtosis | Skewness = 0, Kurtosis = 3 | JB = n(S²/6 + (K-3)²/24)<br>where:<br>• S = skewness<br>• K = kurtosis | • Large sample<br>• Based on moments | Quick normality check for large datasets |

## Time Series Tests

| Test Name | Purpose | Null Hypothesis (H₀) | Test Statistic | Assumptions | Example Use Case |
|-----------|---------|---------------------|----------------|-------------|------------------|
| **Augmented Dickey-Fuller** | Test for unit root (stationarity) | Series has unit root (non-stationary) | ADF statistic | • Time series data<br>• No structural breaks | Testing if stock prices are stationary |
| **KPSS test** | Test for stationarity | Series is stationary | KPSS statistic | • Complements ADF<br>• Tests null of stationarity | Confirming time series stationarity |
| **Ljung-Box test** | Test for autocorrelation | No autocorrelation up to lag k | Q = n(n+2)∑(ρ̂k²/(n-k))<br>where ρ̂k = autocorrelation at lag k | • Used on residuals<br>• Tests white noise | Testing if model residuals are white noise |
| **Durbin-Watson test** | Test for first-order autocorrelation | No first-order autocorrelation | DW = ∑(et - et-1)²/∑et²<br>where et = residuals | • Linear regression<br>• First-order only | Detecting autocorrelation in regression residuals |
| **Granger causality test** | Test if X predicts Y | X does not Granger-cause Y | F-statistic on restricted vs unrestricted model | • Stationary series<br>• Linear relationships | Testing if one feature helps predict another |

## Model Comparison and ML-Specific Tests

| Test Name | Purpose | Null Hypothesis (H₀) | Test Statistic | Assumptions | Example Use Case |
|-----------|---------|---------------------|----------------|-------------|------------------|
| **Likelihood ratio test** | Compare nested models | Simpler model is adequate | LR = -2ln(L₀/L₁)<br>where L = likelihood | • Nested models<br>• Large sample | Comparing logistic regression models |
| **DeLong's test** | Compare AUC/ROC curves | AUC₁ = AUC₂ | z based on covariance matrix | • Binary classification<br>• Same test set | Comparing classifier performance |
| **McNemar's test** | Compare classifier accuracy | Equal misclassification rates | χ² = (b - c)²/(b + c)<br>where b, c = discordant predictions | • Paired predictions<br>• Binary outcomes | Comparing two models on same data |
| **Cochran's Q test** | Compare multiple classifiers | All classifiers perform equally | Q = k(k-1)∑(Gj - Ḡ)²/∑Ri(k-Ri)<br>where k = number of classifiers | • Binary outcomes<br>• Same test set | Comparing multiple binary classifiers |
| **Nemenyi test** | Post-hoc test after Friedman | No difference between pairs | CD = qα√(k(k+1)/6N)<br>where k = algorithms, N = datasets | • Following Friedman test<br>• Multiple comparisons | Identifying which algorithms differ significantly |
| **Diebold-Mariano test** | Compare forecast accuracy | Equal predictive accuracy | DM = d̄/√(σ̂d²/T)<br>where d = loss differential | • Time series forecasts<br>• Various loss functions | Comparing time series model forecasts |

## Tests for Model Assumptions

| Test Name | Purpose | Null Hypothesis (H₀) | Test Statistic | Assumptions | Example Use Case |
|-----------|---------|---------------------|----------------|-------------|------------------|
| **Breusch-Pagan test** | Test homoscedasticity | Homoscedastic errors | LM = nR² from auxiliary regression | • Linear regression<br>• Large sample | Testing constant variance in residuals |
| **White test** | Test homoscedasticity (general) | Homoscedastic errors | nR² from auxiliary regression with interactions | • No specific form<br>• Detects any heteroscedasticity | General heteroscedasticity test |
| **Ramsey RESET test** | Test functional form | Model correctly specified | F-statistic on added polynomial terms | • Linear regression<br>• Tests omitted variables | Testing if model needs non-linear terms |
| **Variance Inflation Factor** | Test multicollinearity | VIF < 10 (rule of thumb) | VIFᵢ = 1/(1-Rᵢ²)<br>where Rᵢ² from regression of Xᵢ on other X's | • Multiple regression<br>• Not a formal test | Detecting multicollinearity among features |
| **Hosmer-Lemeshow test** | Goodness of fit for logistic regression | Model fits well | χ² based on observed vs expected in deciles | • Binary outcome<br>• Large sample | Testing logistic regression calibration |