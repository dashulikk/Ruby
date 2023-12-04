def area(nodes)
  s = 0
  (0...nodes.length).each { |i|
    x1 = nodes[i][0]
    x2 = i + 1 >= nodes.length ? nodes[0][0] : nodes[i + 1][0]
    y1 = nodes[i][1]
    y2 = i + 1 >= nodes.length ? nodes[0][1] : nodes[i + 1][1]
    s += (x1 + x2) * (y2 - y1)
  }
  s.abs / 2.0
end

nodes = [[150,49], [221,78], [219,121], [208,158], [167,182],
         [108,192], [72,171], [59,133], [76,115], [91,97],
         [75,78], [67,58], [79,47], [98,30], [118,22],
         [136,30], [143,37]]
puts area(nodes)