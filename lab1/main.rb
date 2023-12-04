include Math

def expression_1(phi, a, b, c, x)
  sum1 = (((sin(3 * x)) ** 3) + (atan(phi) - 6 * (10 ** 3.1))) / (sqrt((a * x ** 2) + (b * x) + c))
  sum2 = exp(x) * tan(x + 2).abs
  sum1 + sum2
end

print "phi = "
phi = gets.chomp.to_f
print "a = "
a = gets.chomp.to_f
print "b = "
b = gets.chomp.to_f
print "c = "
c = gets.chomp.to_f
print "x = "
x = gets.chomp.to_f

puts "result = " << expression_1(phi, a, b, c, x).to_s
