# @param {String} a
# @param {String} b
# @return {String}
def add_binary(a, b)
  a_chars = a.chars
  b_chars = b.chars

  results = []

  carrier = 0
  while !a_chars.empty? || !b_chars.empty?
    a_bit = a_chars.pop || 0
    b_bit = b_chars.pop || 0

    sum = a_bit.to_i + b_bit.to_i + carrier
    carrier, remainder = sum.divmod 2

    results.push remainder
  end

  results.push(carrier) if carrier == 1

  results.reverse.join
end

p add_binary('11', '1')
