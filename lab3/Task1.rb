A = true
B = false
C = true
X = 2
Y = 10
Z = -50

# number 1

# a) ¬(A ∨ B) ∧ (A ∧ ¬B)
result_a = (!A || !B) && (A && !B)

# b) (Z ≠ Y) ≤ (6 ≥ Y) ∧ A ∨ B ∨ C ∧ X ≥ 1.5
result_b = (Z != Y) && (6 >= Y) && (A || B || C) && (X >= 1.5)

# c) (8 - X * 2 ≤ Z) ∧ (X^2 <= Y^2) ∨ (Z ≥ 15)
result_c = (8 - X * 2 <= Z) && (X**2 <= Y**2) || (Z >= 15)

# d) X > 0 ∧ Y < 0 ∨ Z ≥ (X * Y - Y / X) + (-Z)
result_d = (X > 0) && (Y < 0) || (Z >= (X * Y - Y / X) + (-Z))

# e) ¬(A ∨ B ∧ ¬(C ∨ (¬A ∨ B)))
result_e = !(A || (B && !(C || (!A || B))))

# f) X^2 + Y^2 ≥ 1 ∧ X ≥ 0 ∧ Y ≥ 0
result_f = (X**2 + Y**2 >= 1) && (X >= 0) && (Y >= 0)

# g) (A ∧ (C ∧ B <> B ∨ A) ∨ C) ∧ B
result_g = (A && (C && B != (B || A)) || C) && B

# Display the results
puts "a) Result: #{result_a}"
puts "b) Result: #{result_b}"
puts "c) Result: #{result_c}"
puts "d) Result: #{result_d}"
puts "e) Result: #{result_e}"
puts "f) Result: #{result_f}"
puts "g) Result: #{result_g}"


# ------------------------------

# number 2
a = 2.5
P = true
condition1 = Math.log(a) > a
condition2 = !P
condition3 = Math.sqrt(a) < a**4
result = (condition1 || condition2) && condition3
puts "Result: #{result}"
