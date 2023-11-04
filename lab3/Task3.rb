# 2)
sum = 0
9.times do |i|
  sum += 1.fdiv(3 ** i)
end

puts "2) #{sum}"

# 5)
print "n="
n = gets.to_i

def recursive_sqrt(n, res=0)
  if n > 0
    recursive_sqrt(n - 1, Math.sqrt(2 + res))
  else
    res
  end
end

puts recursive_sqrt(n)