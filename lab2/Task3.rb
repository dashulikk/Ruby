binary = "1000010001"

def to_decimal(binary)
  res = 0
  binary.reverse.chars.each.with_index do |n, i|
    res += 2 ** i if n == "1"
  end
  res
end

puts to_decimal(binary)