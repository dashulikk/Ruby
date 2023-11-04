expr1 = lambda { |x|
  return ((x - 2).abs / (x ** 2 * Math.cos(x))) ** (1.fdiv 7)
}

expr2 = lambda { |x|
  return 1 / ((Math.tan(x + 1/Math.exp(x))/ Math.sin(x) ** 2) ** (7.fdiv 2))
}

expr3 = lambda { |x|
  return 1 / (1 + x / (1 + x.fdiv(1 + x)))
}

x = 7

# using if operator
if -4 < x && x <= 0
  y = expr1.call(x)
elsif 0 < x && x <= 12
  y = expr2.call(x)
else
  y = expr3.call(x)
end

print "[if]:   ", y, "\n"

# using case operator
case x
when -4..0 then y = expr1.call(x)
when 0..12 then y = expr2.call(x)
else y = expr3.call(x)
end

print "[case]: ", y, "\n"