require 'matrix'

# random matrices as said in requirements
n = 8
A = Matrix.build(n, n) do |row, col|
  row == col ? 1 : rand(10)
end
B = Matrix.build(n, n) do |row, col|
  row == col ? 1 : rand(10)
end

def print_matrix(matrix)
  (1...8).each { |i|
    (1...8).each { |j|
      print matrix[i, j], ", "
    }
    puts
  }
end

puts "Matrix B"
print_matrix(B)

puts "Task 1"
print_matrix(B * -1)

puts "Task 2"
print_matrix(A + B)

puts "Matrix A"
print_matrix(A)

puts "Task 3"
print_matrix(A.transpose)

puts "Task 4"
print_matrix(A * B)

puts "Task 5"
puts B.trace

def rand_array(n)
  Array.new(n) do
    rand(10)
  end
end

X = Vector.elements(rand_array n)
Y = Vector.elements(rand_array n)

def print_vector(x, row = true)
  return "x must by of type Vector" unless x.is_a? Vector
  if row
    print "(", x.to_a.join(", "), ")\n"
  else
    x.each do |i|
      print i
    end
  end
end

puts "Task 6"
puts X.inner_product Y

puts "Task 7"
# The cross product of two vectors is defined
# only in three-dimensional space
x = Vector.elements([X.[](0), X.[](1), X.[](2)])
y = Vector.elements([Y.[](0), Y.[](1), Y.[](2)])
puts x.cross_product y

puts "Task 8"
puts X.magnitude

puts "Task 9"
# vector column X has 1 column when matrix A has 8 row - ErrDimensionMismatch
# so it is better to perform reverse operation A * X
8.times do |i|
  ai = 0
  8.times do |j|
    ai += A[i, j] * X[j]          # row of the first matrix mult by the row of the second matrix
  end
  puts ai
end

x = Matrix.column_vector(X)
puts "Task 9 (alt)"
puts A * x

puts "Task 10"
8.times do |j|
  aj = 0
  8.times do |i|
    aj += Y[i] * B[i, j]
  end
  print aj, " "
end
puts

y = Matrix.row_vector Y
puts "Task 10 (alt)"
puts y * B