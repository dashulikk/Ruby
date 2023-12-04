require 'matrix'

n = 0

while true do
print "Dimension please:"
n = gets.to_i
if (3..9).include?(n)
  break
else
  puts "Oops, wrong dimension. Must be in [3..9]"
end
end


k = 11

A = Matrix.build(n, n) do |row, col|
  row == col ? Rational(2) : Rational(k + 2)
end

b = Vector.elements(Rational(1).step(n, 1).to_a)


(0...n).each { |i|
  (0...n).each { |j|
    print A[i, j].to_i, " "
  }
  puts
}

puts b.map { |i| i.to_i }
def gaussian_method(matrix, b)
  n = matrix.column_count
  n.times do |i|
    divisor = matrix[i, i]

    i.upto(n - 1) do |j|
      matrix[i, j] /= divisor
    end
    b[i] /= divisor

    (i + 1).upto(n - 1) do |k|
      mult = matrix[k, i]
      i.upto(n - 1) do |s|
        matrix[k, s] -= matrix[i, s] * mult
      end
      b[k] -= b[i] * mult
    end
  end

  x = Vector.zero(n)
  (n - 1).downto(0) do |i|
    x[i] = b[i]
    (i + 1).upto(n - 1) do |j|
      x[i] -= x[j] * matrix[i, j]
    end
  end

  x
end

puts "x = (#{gaussian_method(A, b).to_a.join(", ")})"