# Mathematical Notation Reference Table

## Basic Set Notation and Operations

| Symbol/Notation | Name | Description | Example |
|-----------------|------|-------------|---------|
| `∈` | Element of | Indicates membership in a set | `3 ∈ {1, 2, 3, 4}` |
| `∉` | Not element of | Indicates non-membership in a set | `5 ∉ {1, 2, 3, 4}` |
| `⊆` | Subset | All elements of first set are in second set | `{1, 2} ⊆ {1, 2, 3}` |
| `⊂` | Proper subset | Subset but not equal | `{1, 2} ⊂ {1, 2, 3}` |
| `⊇` | Superset | Contains all elements of another set | `{1, 2, 3} ⊇ {1, 2}` |
| `⊃` | Proper superset | Superset but not equal | `{1, 2, 3} ⊃ {1, 2}` |
| `∪` | Union | Elements in either set | `{1, 2} ∪ {2, 3} = {1, 2, 3}` |
| `∩` | Intersection | Elements in both sets | `{1, 2} ∩ {2, 3} = {2}` |
| `\` or `−` | Set difference | Elements in first but not second set | `{1, 2, 3} \ {2} = {1, 3}` |
| `Δ` | Symmetric difference | Elements in either set but not both | `{1, 2} Δ {2, 3} = {1, 3}` |
| `∅` or `{}` | Empty set | Set with no elements | `{x : x ≠ x} = ∅` |
| `A'` or `Aᶜ` | Complement | Elements not in set A | If U = {1,2,3,4}, A = {1,2}, then A' = {3,4} |
| `|A|` or `#A` | Cardinality | Number of elements in set | `|{1, 2, 3}| = 3` |
| `P(A)` or `2^A` | Power set | Set of all subsets | `P({1,2}) = {∅, {1}, {2}, {1,2}}` |
| `A × B` | Cartesian product | Set of ordered pairs | `{1,2} × {a,b} = {(1,a), (1,b), (2,a), (2,b)}` |
| `⊍` | Multiset sum | Union counting multiplicities | `{1,1,2} ⊍ {1,2,2} = {1,1,1,2,2,2}` |

## Set Builder Notation

| Symbol/Notation | Name | Description | Example |
|-----------------|------|-------------|---------|
| `{x : P(x)}` | Set builder (colon) | Set of x such that P(x) is true | `{x : x > 0}` (positive numbers) |
| `{x | P(x)}` | Set builder (bar) | Alternative notation for set builder | `{x | x² = 4} = {-2, 2}` |
| `{f(x) : x ∈ A}` | Image notation | Set of outputs of function | `{x² : x ∈ {1,2,3}} = {1,4,9}` |
| `{x ∈ A : P(x)}` | Restricted set builder | Elements from A satisfying P(x) | `{x ∈ ℕ : x < 5} = {1,2,3,4}` |
| `∀x ∈ A` | Universal quantifier | For all x in A | `∀x ∈ ℝ, x² ≥ 0` |
| `∃x ∈ A` | Existential quantifier | There exists x in A | `∃x ∈ ℝ : x² = 2` |
| `∃!x` | Unique existence | Exactly one x exists | `∃!x ∈ ℝ : x + 3 = 7` |
| `⋃ᵢ₌₁ⁿ Aᵢ` | Indexed union | Union of indexed sets | `⋃ᵢ₌₁³ {i} = {1,2,3}` |
| `⋂ᵢ₌₁ⁿ Aᵢ` | Indexed intersection | Intersection of indexed sets | `⋂ᵢ₌₁³ {i,i+1} = ∅` |
| `sup(A)` | Supremum | Least upper bound | `sup({1/n : n ∈ ℕ}) = 1` |
| `inf(A)` | Infimum | Greatest lower bound | `inf({1/n : n ∈ ℕ}) = 0` |

## Propositional Logic

| Symbol/Notation | Name | Description | Example |
|-----------------|------|-------------|---------|
| `¬` or `~` | Negation | Logical NOT | `¬P` (not P) |
| `∧` | Conjunction | Logical AND | `P ∧ Q` (P and Q) |
| `∨` | Disjunction | Logical OR | `P ∨ Q` (P or Q) |
| `⊕` | Exclusive OR | XOR, exactly one is true | `P ⊕ Q` (P xor Q) |
| `→` | Implication | If...then | `P → Q` (if P then Q) |
| `↔` | Biconditional | If and only if | `P ↔ Q` (P iff Q) |
| `⊢` | Entailment | Proves/derives | `{P, P→Q} ⊢ Q` |
| `⊨` | Semantic entailment | Models/satisfies | `A ⊨ B` (A entails B) |
| `⊤` | Tautology | Always true | `P ∨ ¬P ≡ ⊤` |
| `⊥` | Contradiction | Always false | `P ∧ ¬P ≡ ⊥` |
| `≡` | Logical equivalence | Same truth value | `¬(P ∧ Q) ≡ ¬P ∨ ¬Q` |
| `∀` | Universal quantifier | For all | `∀x P(x)` (for all x, P(x)) |
| `∃` | Existential quantifier | There exists | `∃x P(x)` (there exists x such that P(x)) |
| `⊻` | NAND | Not AND | `P ⊻ Q ≡ ¬(P ∧ Q)` |
| `⊽` | NOR | Not OR | `P ⊽ Q ≡ ¬(P ∨ Q)` |

## Common Number Sets

| Symbol/Notation | Name | Description | Example |
|-----------------|------|-------------|---------|
| `ℕ` | Natural numbers | Positive integers (sometimes includes 0) | `ℕ = {1, 2, 3, ...}` |
| `ℕ₀` | Natural numbers with zero | Natural numbers including 0 | `ℕ₀ = {0, 1, 2, 3, ...}` |
| `ℤ` | Integers | Whole numbers including negatives | `ℤ = {..., -2, -1, 0, 1, 2, ...}` |
| `ℤ⁺` | Positive integers | Integers greater than zero | `ℤ⁺ = {1, 2, 3, ...}` |
| `ℤ⁻` | Negative integers | Integers less than zero | `ℤ⁻ = {-1, -2, -3, ...}` |
| `ℚ` | Rational numbers | Numbers expressible as fractions | `ℚ = {p/q : p,q ∈ ℤ, q ≠ 0}` |
| `ℝ` | Real numbers | All points on the number line | `π ∈ ℝ, √2 ∈ ℝ` |
| `ℝ⁺` | Positive reals | Real numbers greater than zero | `ℝ⁺ = {x ∈ ℝ : x > 0}` |
| `ℝ⁻` | Negative reals | Real numbers less than zero | `ℝ⁻ = {x ∈ ℝ : x < 0}` |
| `ℂ` | Complex numbers | Numbers with real and imaginary parts | `ℂ = {a + bi : a,b ∈ ℝ}` |
| `ℍ` | Quaternions | 4-dimensional number system | `ℍ = {a + bi + cj + dk}` |
| `𝕆` | Octonions | 8-dimensional number system | `𝕆` (8-dimensional algebra) |
| `ℙ` | Prime numbers | Numbers with exactly two divisors | `ℙ = {2, 3, 5, 7, 11, ...}` |
| `𝔽` | Finite field | Field with finite elements | `𝔽₂ = {0, 1}` with mod 2 arithmetic |
| `ℵ₀` | Aleph-null | Cardinality of countable infinity | `|ℕ| = ℵ₀` |
| `𝔠` | Continuum | Cardinality of real numbers | `|ℝ| = 𝔠 = 2^{ℵ₀}` |

## Common Operators and Greek Letters

| Symbol/Notation | Name | Description | Example |
|-----------------|------|-------------|---------|
| `π` | Pi | Ratio of circumference to diameter | `π ≈ 3.14159...` |
| `e` | Euler's number | Base of natural logarithm | `e ≈ 2.71828...` |
| `∞` | Infinity | Unbounded quantity | `lim_{x→0} 1/x = ∞` |
| `θ` | Theta | Common angle variable | `sin(θ) = opposite/hypotenuse` |
| `λ` | Lambda | Eigenvalue, parameter, wavelength | `Ax = λx` (eigenvalue equation) |
| `μ` | Mu | Mean, micro- prefix | `μ = E[X]` (expected value) |
| `σ` | Sigma (lowercase) | Standard deviation | `σ² = Var(X)` |
| `Σ` | Sigma (uppercase) | Summation | `Σᵢ₌₁ⁿ i = n(n+1)/2` |
| `Π` | Pi (uppercase) | Product | `Πᵢ₌₁ⁿ i = n!` |
| `ŷ` or `ȳ` | Y-hat, Y-bar | Predicted/mean value | `ŷ = β₀ + β₁x` |
| `∇` | Nabla/Del | Gradient operator | `∇f = (∂f/∂x, ∂f/∂y)` |
| `∂` | Partial | Partial derivative | `∂f/∂x` |
| `∫` | Integral | Integration | `∫ x dx = x²/2 + C` |
| `∮` | Contour integral | Closed path integral | `∮_C f(z) dz` |
| `∏` | Coproduct | Categorical coproduct | `A ∏ B` |
| `⊗` | Tensor product | Tensor multiplication | `V ⊗ W` |
| `⊕` | Direct sum | Direct sum of spaces | `V ⊕ W` |
| `∘` | Composition | Function composition | `(f ∘ g)(x) = f(g(x))` |
| `≈` | Approximately equal | Almost equal to | `π ≈ 3.14` |
| `≡` | Congruent/Identical | Equivalent in context | `a ≡ b (mod n)` |
| `∝` | Proportional to | Varies directly with | `y ∝ x` means `y = kx` |
| `α` | Alpha | First, angle, significance level | `α = 0.05` (significance) |
| `β` | Beta | Second, angle, Type II error | `β` (regression coefficient) |
| `γ` | Gamma | Third, Euler's constant | `γ ≈ 0.5772...` |
| `δ` | Delta (lowercase) | Small change, variation | `δ > 0` (epsilon-delta) |
| `Δ` | Delta (uppercase) | Change, difference | `Δx = x₂ - x₁` |
| `ε` | Epsilon | Small positive quantity | `|x - a| < ε` |
| `φ` or `ϕ` | Phi | Golden ratio, angle | `φ = (1 + √5)/2` |
| `ρ` | Rho | Correlation, density | `ρ(X,Y)` (correlation) |
| `τ` | Tau | Time constant, torque | `τ = 2π` |
| `ω` | Omega (lowercase) | Angular frequency | `ω = 2πf` |
| `Ω` | Omega (uppercase) | Ohm, sample space | `P(Ω) = 1` |
| `ℵ` | Aleph | Cardinality of infinite sets | `ℵ₀ < ℵ₁` |
| `ℓ` | Script ell | Length, often in physics | `ℓ = 1, 2, 3, ...` |
| `ħ` | H-bar | Reduced Planck constant | `ħ = h/2π` |
| `∀` | For all | Universal quantifier | `∀x ∈ ℝ, x² ≥ 0` |
| `∃` | There exists | Existential quantifier | `∃x : x² = 2` |
| `∄` | Does not exist | Negated existence | `∄x ∈ ℝ : x² = -1` |