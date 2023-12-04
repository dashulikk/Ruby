# Function to calculate n!
def factorial(n)
  return 1 if n == 0
  (1..n).reduce(:*)
end

# Calculate the series until the desired tolerance is achieved
epsilon = 0.00001
n = 1
sum = 1.0 / 2  # Initial value of the sum
term = 1.0 / 2  # Initial value of the current term

while term.abs >= epsilon
  n += 1
  term *= 1.0 * (n - 1) / n  # Calculate the next term
  sum += term  # Add the term to the sum
end

# Calculate the expected value using ln(2)
expected_value = Math.log(2)

# Output the results
puts "Value of the series with ε=#{epsilon}: #{sum}"
puts "Expected value based on ln(2): #{expected_value}"
