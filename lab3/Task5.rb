include Math

def tg(x)
  tan(x)
end

def ctg(x)
  1.fdiv tg(x)
end

y = lambda do |c, n, x|
  Math.sqrt(((x ** (2.fdiv c) + n ** (2.fdiv c)) ** 2 - 4 * x ** (2.fdiv c + 2.fdiv(n))) \
              / ((x ** (1.fdiv n) - x ** (1.fdiv c)) ** 2 + 3 * x ** (1.fdiv(n) + 1.fdiv(c))))\
    + (x ** 2 + 2 * x - 4).fdiv(c + x)
end

z = lambda do |x, c|
  (((sin(x) ** 2 + tg(x) ** 2) ** c + 1) * (cos(x) ** 2 - ctg(x) ** 2 + 1)) \
    / ((cos(x) ** 2 + ctg(x) ** 2 + 1) * (sin(x) ** 2 + tg(x) ** 2 - 1))
end

print "c="
c = gets.chomp.to_i

print "n="
n = gets.chomp.to_i

# task 1
puts "Task 1"
interval_length = Rational(n - 1).fdiv(n + c)
(n + c).times do |i|
  x = 1 + i * interval_length + interval_length / 2
  puts "y(#{x}) = #{y.call(c, n, x)}"
end

# task 2
puts "Task 2"
interval_length = (Math::PI - Math::PI / n) / (1.5 * n + c)
(1.5 * n + c).to_i.times do |i|
  x = Math::PI / n + i * interval_length + interval_length / 2
  puts "z(#{x}) = #{z.call(x, c)}"
end

# task 3
puts "Task 3"
interval_length = Rational(c - 2) / (2 * n)
n.times do |i|
  x = 2 + i * interval_length + interval_length / 2
  puts "y(#{x}) = #{y.call(c, n, x)}"
end
(n + 1).upto(2 * n) do |i|
  x = 2 + i * interval_length + interval_length / 2
  puts "z(#{x}) = #{z.call(x, c)}"
end
