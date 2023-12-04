require 'bigdecimal'

def function(a, b, c, x)
  is_whole = (a.to_i | b.to_i) & (a.to_i | c.to_i) == 0
  result = if x < 0 && b != 0
             a * x ** 2 + b
           elsif x > 0 && b == 0
             (x - a).quo(x - c)
           else
             x.quo c
           end
  if is_whole
    result.to_i
  else
    result.to_s('F').to_f
  end
end

