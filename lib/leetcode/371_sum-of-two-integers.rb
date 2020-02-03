# @param {Integer} a
# @param {Integer} b
# @return {Integer}
def get_sum(a, b)
  # http://stackoverflow.com/questions/8698959/how-to-force-ruby-to-store-a-small-number-as-32-bit-integer

  p "a: #{a}, b: #{b}"
  a = Array(a).pack('l').unpack1('l')
  b = Array(b).pack('l').unpack1('l')

  return a if b == 0

  get_sum(a ^ b, (a & b) << 1)
end
#p get_sum(1, 3)

p get_sum(1, -1)
