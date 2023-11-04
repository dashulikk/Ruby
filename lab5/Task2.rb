def compute
  10.times do |j|
    x = (j + 1) * Rational(1, 10)
    print "x = #{x.to_f}"
    1.upto(58) do |n|
      print " |"
      sum = 0
      (n + 1).times do |i|
        sum += yield(i, x)
      end
      print " ", sum.to_f
    end
    puts
  end
end

def factorial(n)
  return 1 if n < 1
  n * factorial(n - 1)
end

f = lambda do |i, x|
  ((2 * i + 1) / factorial(i)) * x ** (2 * i)
end

compute &f