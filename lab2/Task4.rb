number = 123

def to_binary(n)
  res = ""
  while n > 0
    res << (n % 2).to_s
    n = n / 2
  end
  res.reverse
end

puts to_binary number