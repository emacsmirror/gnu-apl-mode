;;; -*- lexical-binding: t -*-

;;;
;;; Each element has the following structure:
;;;
;;;  (SYMBOL
;;;      ((TYPE NAME SUMMARY &optional DESCRIPTION)
;;;       ...)
;;;       IBM-COPYRIGHT-P)
;;;
;;;  SYMBOL - A one-character string or list of alternatives, the actual symbol
;;;  TYPE - The use-type, i.e. "Monadic", "Dyadic"...
;;;  SUMMARY - Short one-line summary
;;;  DESCRIPTION - Long description of the symbol
;;;  IBM-COPYRIGHT-P - T if the text is an APL2 reprint
;;;

(defvar gnu-apl--symbol-doc
  '(("+"
     (("Monadic" "Conjugate" "Z is R with its imaginary part negated"
       "Z←+R

R and Z: Numeric")
      ("Dyadic" "Add" "Adds R to L"
       "Z←L+R

L, R and Z: Numeric"))
     t)

    ;; ========================================

    ("−"
     (("Monadic" "Negation" "Reverses the sign of R"
       "Z←−R
Reverses the sign of R.

R and Z: Numeric
")
      ("Dyadic" "Subtract" "Subtracts R from L"
       "Z←L−R
Subtracts R from L.

L, R, and Z: Numeric"))
     t)

    ;; ========================================

    ("×"
     (("Monadic" "Signum" "¯1 if R<0; 0 if R=0; 1 if R>0"
       "Z←×R
Yields the number of magnitude 1 with the same phase as R for
nonzero R. If R is 0, Z is 0.

R and Z: Numeric")
      ("Dyadic" "Multiply" "Multiplies L by R"
       "Z←L×R
Multiplies L by R.

L, R, and Z: Numeric"))
     t)

    ;; ========================================

    ("÷"
     (("Monadic" "Reciprocal" "1 divided by R"
       "Z←÷R
Divides 1 by R.

R and Z: Numeric, nonzero")
      ("Dyadic" "Divide" "Divides L by R"
       "Z←L÷R
Divides L by R.

L, R, and Z: Numeric"))
     t)

    ;; ========================================

    ("⋆"
     (("Monadic" "Exponential" "e to the R power"
       "Z←⋆R
Determines the Rth power of the base of the natural logarithms e,
where e is approximately 2.7182818284590452.

R and Z: Numeric")
      ("Dyadic" "Power" "L raised to the R power"
       "Z←L⋆R
Raises base L to the Rth power.

Z, R and Z: Numeric"))
     t)

    ;; ========================================

    ("○"
     (("Monadic" "Pi times" "Multiply by π"
       "Z←○R
Multiplies any number by π (approximately
3.1415926535897933).

R and Z: Numeric")
      ("Dyadic" "Circle functions" "Trigonometric functions of R selected by L"
       "Z←L○R
L determines which of a family of circular, hyperbolic, Pythagorean,
and complex number functions to apply to R.

L: Integer such that ¯12≤L and L≤12
R and Z: Numeric

Functions:

 L     L○R            L      L○R
  0   (1-R⋆2)⋆5
 ¯1   arcsin R          1   sin R
 ¯2   arccos R          2   cosin R
 ¯3   arctan R          3   tan R
 ¯4   (1+R⋆2)⋆5         4   (1+R⋆2)⋆5
 ¯5   arcsinh R         5   sinh R 
 ¯6   arccosh R         6   cosh R
 ¯7   arctanh R         7   tanh R
 ¯8   -(8○R)            8   -(1-R⋆2)⋆0.5 for R≥0, (¯1-R⋆2)⋆0.5 for R<0
 ¯9   R                 9   Real R
¯10   +R               10   |R
¯11   0J1 R            11   Imaginary R
¯12   ⋆0J1 R           12   Phase R"))
     t)

    ;; ========================================

    ("?"
     (("Monadic" "Roll" "Selects an integer at random from the population ⍳R"
"Z←?R

R: Positive integer
Z: Integer in the set ιR

Implicit arguments: ⎕IO and ⎕RL")
      ("Dyadic" "Deal" "Selects L integers at random from the population ⍳R without replacement"
       "Z←L?R

L and R: Simple scalar or one-item vector, nonnegative integer
Z: Simple vector, integer in set ⍳R

Implicit arguments: ⎕IO and ⎕RL

 ⍴Z ←→ ,L
⍴⍴Z ←→ ,1"))
     t)

    ;; ========================================

    ("∊"
     (("Monadic" "Enlist" "Creates a simple vector whose items are the simple scalars in R"
       "Z←∊R

Z: Simple vector

 ⍴Z ←→ Number of simple scalars in R
⍴⍴Z ←→ ,1")
      ("Dyadic" "Member" "1 for elements of L present in R; 0 where not."
"Z←L∊R

Yields a Boolean array Z with the same shape as L. An item of Z is
1 if the corresponding item of L can be found anywhere in R. An
item of Z is 0 otherwise.

Z: Simple Boolean array

Implicit argument: ⎕CT

 ⍴Z ←→ ⍴L
⍴⍴Z ←→ ⍴⍴L"))
     t)

    ;; ========================================

    ("⌈"
     (("Monadic" "Ceiling" "Least integer greater than or equal to R"
"Z←⌈R
For real numbers, yields the smallest integer that is not
less than R (within the comparison tolerance).
For complex numbers, depends on the relationship of the real
and imaginary parts of R.

R and Z: Numeric

Implicit argument: ⎕CT")
      ("Dyadic" "Maximum" "The greater value of L or R"
"Z←L⌈R
Returns the larger of L and R.

L, R, and Z: Numeric, real"))
     t)

    ;; ========================================

    ("⌊"
     (("Monadic" "Floor" "Greatest integer less than or equal to R"
       "Z←⌊R

For real numbers, yields the largest integer that does not exceed
R (within the comparison tolerance).

For complex numbers, depends on the relationship of the real and
imaginary parts of R.

R and Z: numeric

Implicit Argument: ⎕CT")
      ("Dyadic" "Minimum" "The smaller value of L or R"
       "Z←L⌊R
Returns the smaller of L and R.

L, R and Z: Numeric, real"))
     t)

    ;; ========================================

    ("⍴"
     (("Monadic" "Shape" "Yields the size of each axis of R"
       "Z←⍴R
Yields the size of each axis of R.

Z: Simple nonnegative integer vector.

 ⍴Z ←→ ⍴⍴R
⍴⍴Z ←→ ,1")
      ("Dyadic" "Reshape" "Structures the items of R into an array of shape L"
       "Z←LρR

L: Simple scalar or vector, not negative integers.

 ⍴Z ←→ ,L
⍴⍴Z ←→ ⍴,L"))
     t)

    ;; ========================================

    ("↑"
     (("Monadic" "First" "Selects the first item of R taken in row major order"
       "Z←↑R
Selects the first item of R taken in row major order. If R is empty,
yields the prototype of R.

 ⍴Z ←→ Depends on shape of the first item
⍴⍴Z ←→ Depends on rank of the first item")
      ("Dyadic" "Take" "Select the first or last L elements of R"
       "Z←L↑R
Selects subarrays from the beginning or end of the
Ith axis of R, according to whether L[I]
is positive or negative.

L: Simple scalar or vector, integer

 ⍴Z ←→ ,L
⍴⍴Z ←→ ⍴,L")
      ("Dyadic with axis" "Take with axis" "Select the first or last L elements of R"
       "Z←L↑[X]R
Selects subarrays from the beginning or end of
the X[I]th axis of R, according to whether
L[I] is positive or negative.

L: Simple scalar or vector, integer
R and Z: Nonscalar array
X: Simple scalar or vector; nonnegative integers: X∊⍳⍴⍴R; or empty

Implicit argument: ⎕IO

 (⍴Z)[,X] ←→ ,L
      ⍴⍴Z ←→ ⍴⍴R"))
     t)

    ;; ========================================

    ("↓"
     (("Dyadic" "Drop" "Remove the first or last L elements of R"
       "Z←L↓R
Removes subarrays from the beginning or end of the Ith axis of R,
according to whether L[I] is positive or negative.

L: Simple scalar or vector, integer

Z: Nonscalar array
 ⍴Z ←→ 0 (ρR)| L
⍴⍴Z ←→ (⍴,L) ⍴⍴R")
      ("Dyadic with axis" "Drop with axis" "Remove the first or last L elements of R"
       "↓[] Drop with Axis
Z←L↓[X]R
Removes subarrays from the beginning or end of the X[I]th
axis of R, according to whether L[I] is positive or negative.

L: Simple scalar or vector, integer
R and Z: Nonscalar array
X: Simple scalar or vector; nonnegative integers: Xε⍳⍴⍴R; or empty

Implicit argument: ⎕IO

 (⍴Z)[,X] ←→ 0 (⍴R)[,X]| L
      ⍴⍴Z ←→ ⍴⍴R"))
     t)

    ;; ========================================

    (("∣" "|")
     (("Monadic" "Magnitude" "Yields the distance between 0 and R"
       "Z←|R

R: Numeric
Z: Numeric, real")
      ("Dyadic" "Modulo" "The remainder from dividing R by L"
       "Z←L|R
For real positive L and R, the remainder from dividing R by L.
For all numbers, Z is R-L×⌊R÷L+L=0.

Note: ⌊ is computed with a comparison tolerance of zero.

L, R, and Z: Numeric

Implicit Argument: ⎕CT")))

    ;; ========================================

    (","
     (("Monadic" "Ravel" "Creates a vector from the items in R, taken in row-major order"
       "Z←,R

Z: Vector

 ⍴Z ←→ , /⍴R
⍴⍴Z ←→ ,1")
      ("Dyadic" "Catenate" "Elements of R appended to the elements of L"
       "Z←L,R
Joins L and R. If L and R are nonscalar arrays, L and R are
joined along the last axis. If L and R are scalars, Z is a
two-item vector.

¯1↑⍴Z ←→ Case dependent
  ⍴⍴Z ←→ ,/(⍴⍴L),(⍴⍴R),1")
      ("Monadic with axis" "Ravel with axis" "Create an array of R reshaped according to X"
       "Z←,[X]R
Creates an array that contains the items of R reshaped according
to axes X: If X is a fraction, a new axis of length 1 is formed;
if X is an integer, the X axes of R are combined.

X: Simple scalar fraction or simple scalar or vector of
   nonnegative integers or empty

Implicit argument: ⎕IO

 ⍴Z ←→ Depends on the value of X
⍴⍴Z ←→ Depends on the value of X")
      ("Dyadic with axis" "Catenate with axis" "Join L and R along the axis indicated by X"
       "Z←L,[X]R
Joins L and R along the axis indicated by X.

Z: Nonscalar
X: Simple scalar or one item vector, integer: X∊⍳(⍴⍴L) ⍴⍴R

Implicit argument: ⎕IO

 ⍴Z ←→ Case dependent
⍴⍴Z ←→ (⍴⍴L) ⍴⍴R")
      ("Dyadic with axis (fraction)" "Laminate" "Join L and R by forming a new axis of length 2"
       "Z←L,[X]R
Joins L and R by forming a new axis of length 2, which is
filled with L and R.

Z: Nonscalar
X: Simple scalar fraction between ¯1+⎕IO and ⎕IO+(⍴⍴L) ⍴⍴R

Implicit argument: ⎕IO
 ⍴Z ←→ Case dependent
⍴⍴Z ←→ 1+(⍴⍴L)⌈⍴⍴R"))
     )

    ;; ========================================

    ("\\"
     (("Dyadic" "Expand" "Expands the last axis of R under the control of the Boolean vector LO"
       "Z←LO\\R
Positions in Z that correspond to ones in LO are filled with
items of R. Positions in Z that correspond to 0's in LO are
filled with the fill item (↑0⍴⊂↑R).

LO: Simple Boolean scalar or vector
Z: Nonscalar array

¯1↓⍴Z ←→ 1↓⍴R
¯1↑⍴Z ←→ ⍴,LO
  ⍴⍴Z ←→ ⍴⍴R")
      ("Dyadic with axis" "Expand with axis" "Expands the Xth axis of R under the control of the Boolean
vector LO"
       "Z←LO\\[X]R

Expand with axis is similar to expand, except that expansion
occurs along the Xth axis.

LO: Simple Boolean scalar or vector
R and Z: Nonscalar array
X: Simple scalar or one-item vector, integer: X∊⍳⍴⍴R

Implicit Argument: ⎕IO

 (⍴Z)[,X] ←→ ⍴,LO
 ⍴⍴Z      ←→ ⍴⍴R")
      ("Axis operator" "Scan" "The Ith item along the last axis is determined by the LO-reduction of I↑[⍴⍴R]R"
       "Z←LO\\R

The Ith item along the last axis is determined by the
LO-reduction of I↑[⍴⍴R]R.

LO: Dyadic function

⍴Z ←→ ⍴R
⍴⍴Z ←→ ⍴⍴R"))
     t)

    ;; ========================================

    ("⍀"
     (("Axis with index" "Expand with axis" "Expands the Xth axis of R under the control of the Boolean
vector LO"
       "Z←LO [X]R

LO: Simple Boolean scalar or vector
R and Z: Nonscalar array
X: Simple scalar or one-item vector, integer: X∊⍳⍴⍴R

Implicit Argument: ⎕IO

 (⍴Z)[,X] ←→ ⍴,LO
 ⍴⍴Z      ←→ ⍴⍴R"))
     t)

    ;; ========================================

    ("/"
     (("Dyadic" "Replicate" "Repeats each subarray along the last axis under the control of the vector LO"
       "Z←LO/R
Repeats each subarray along the last axis under the control of
the vector LO.

LO: Simple scalar or vector, integer
 Z: Nonscalar array

¯1↓⍴Z ←→ ¯1↓⍴R
  ⍴⍴Z ←→ ⍴⍴R")
      ("Axis operator" "Reduce" "Evaluate R as if LO is placed between each element"
       "Z←LO/R
Has the effect of placing the function LO between adjacent pairs of items along
the last axis of R and evaluating the resulting expression for each subarray.

LO: Dyadic function

 ⍴Z ←→ 1↓⍴R
⍴⍴Z ←→ 0⌈¯1+⍴⍴R"))
     t)

    ;; ========================================

    ("⍳"
     (("Monadic" "Interval" "Vector of the first R integers"
       "Z←⍳R
Produces R consecutive ascending integers, beginning with ⎕IO.

R: Simple scalar or one-item vector, nonnegative integer
Z: Simple vector, nonnegative integers

Implicit argument: ⎕IO

 ⍴Z ←→ ,R
⍴⍴Z ←→ ,1")
      ("Dyadic" "Index of" "The location (index) of B in A; 1+⌈/⍳⍴A if not found"
       "Z←L⍳R
Yields the first occurrence in L of items in R.

L: Vector
Z: Nonnegative integers

Implicit arguments: ⎕IO, ⎕CT

 ⍴Z ←→ ⍴R
⍴⍴Z ←→ ⍴⍴R"))
     t)

    ;; ========================================

    ("⌹"
     (("Monadic" "Matrix inverse" "Inverse of matrix B")
      ("Dyadic" "Matrix divide" "Solution to system of linear equations Ax = B")))

    ;; ========================================

    ("⌽"
     (("Monadic" "Reversal" "Reverse elements of B along last axis")
      ("Dyadic" "Rotation" "The elements of B are rotated A positions")))

    ;; ========================================

    ("⊖"
     (("Monadic" "Reversal" "Reverse elements of B along first axis")
      ("Dyadic" "Rotation" "The elements of B are rotated A positions along the first axis")))

    ;; ========================================

    ("⍟"
     (("Monadic" "Logarithm" "Natural logarithm of B")
      ("Dyadic" "Logarithm" "Logarithm of B to base A")))

    ;; ========================================

    ("⍕"
     (("Monadic" "Format" "A character representation of B")
      ("Dyadic" "Format" "Format B into a character matrix according to A")))

    ;; ========================================

    ("⍉"
     (("Monadic" "Transpose" "Reverse the axes of B")
      ("Dyadic" "Transpose" "The axes of B are ordered by A")))

    ;; ========================================

    ("!"
     (("Monadic" "Factorial" "Product of integers 1 to B")
      ("Dyadic" "Combinations" "Number of combinations of B taken A at a time")))

    ;; ========================================

    ("<"
     (("Dyadic" "Less than" "Comparison: 1 if true, 0 if false")))

    ;; ========================================

    ("≤" nil nil
     "Less than or equal" "Comparison: 1 if true, 0 if false")

    ;; ========================================

    ("="
     (("Dyadic" "Equality" "Comparison: 1 if true, 0 if false")))

    ;; ========================================

    ("≥"
     (("Dyadic" "Greater than or equal" "Comparison: 1 if true, 0 if false")))

    ;; ========================================

    (">"
     (("Dyadic" "Greater than" "Comparison: 1 if true, 0 if false")))

    ;; ========================================

    ("≠"
     (("Dyadic" "Not equal" "Comparison: 1 if true, 0 if false")))

    ;; ========================================

    ("∨"
     (("Dyadic" "Logical disjunction" "Logic: 0 if A and B are 0; 1 otherwise")))

    ;; ========================================

    ("∧"
     (("Dyadic" "Logical conjunction" "Logic: 1 if A and B are 1; 0 otherwise")))

    ;; ========================================

    ("⍱"
     (("Dyadic" "Logical Nor" "Logic: 1 if both A and B are 0; otherwise 0")))

    ;; ========================================

    ("⍲"
     (("Dyadic" "Logical Nand" "Logic: 0 if both A and B are 1; otherwise 1")))

    ;; ========================================

    ("∼"
     (("Dyadic" "Not" "Logical: ∼1 is 0, ∼0 is 1")) nil)

    ;; ========================================

    ("⍋"
     (("Monadic" "Grade up" "Indices of B which will arrange B in ascending order")))

    ;; ========================================

    ("⍒"
     (("Monadic" "Grade down" "Indices of B which will arrange B in descending order")))

    ;; ========================================

    ("⍎"
     (("Monadic" "Execute" "Execute an APL expression")))

    ;; ========================================

    ("←"
     (("Dyadic" "Assignment" "Assign the value of B to A")))

    ;; ========================================

    ("→"
     (("Monadic" "Goto" "Go to line B")))

    ;; ========================================

    ("∇"
     (("Monadic" "Function definition" "Define or modify a function")))

    ;; ========================================

    ("⊂"
     (("Monadic" "Enclose" "Produce a scalar from B")
      ("Dyadic" "Partition" "Divide B into vectors based on A")))

    ;; ========================================

    ("⊃"
     (("Monadic" "Disclose" "Produce an array from B")
      ("Dyadic" "Pick" "Select a value from B based on A")))

    ;; ========================================

    ("∪"
     (("Monadic" "Unique" "Return an array of all unique elements in B")))

    ;; ========================================

    ("⍷"
     (("Dyadic" "Find" "Return a boolean array indicating the positions of the array A in B")))

    ;; ========================================

    ("≡"
     (("Monadic" "Depth" "Return the levels of nesting in B")
      ("Dyadic" "Match" "Returns true if A has the same structure as well as data as B")))

    ;; ========================================

    ("⊥"
     (("Dyadic" "Decode" "Yields the values of array R evaluated in a number system with radices L"
       "Z←L⊥R
Yields the values of array R evaluated in a number system with
radices L.

L, R, and Z: Simple numeric array

⍴Z ←→ (1↓L),1↓⍴R
⍴⍴Z ←→ (0 1+⍴⍴L)+(0⌈¯1+⍴⍴R)")) t)

    ;; ========================================

    ("⊤"
     (("Dyadic" "Encode" "Yields the representation of R in the number system whose radices are L"
       "Z←L⊤R
Yields the representation of R in the number system whose radices
are L.

L, R, and Z: Simple numeric array

⍴Z ←→ (⍴L),⍴R
⍴⍴Z ←→ (⍴⍴L)+⍴⍴R")) t))
  "Documentation for APL symbols.")
