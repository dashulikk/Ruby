def prm(a, b, n)
  h = (b - a).fdiv n
  sum = 0
  n.times do |i|
    xi = a + (i + 1) * h - h.fdiv(2)
    sum += yield(xi)
  end
  h * sum
end

def trp(a, b, n)
  h = (b - a).fdiv n
  sum = yield(a).fdiv(2) + yield(b).fdiv(2)
  1.upto(n - 1) do |i|
    sum += yield(a + h * i)
  end
  h * sum
end

f1 = lambda do |x|
  1 / ((x + 1) * Math.sqrt(x ** 2 + 1))
end

f2 = lambda do |x|
  x * Math.atan(x)
end

n = 20

puts "Rectangle method"
puts "1) = #{prm(0, 0.6, n, &f1)}"
puts "2) = #{prm(0, 0.6, n, &f2)}"

puts "Trapeze method"
puts "1) = #{trp(0, 0.6, n, &f1)}"
puts "2) = #{trp(0, 0.6, n, &f2)}"