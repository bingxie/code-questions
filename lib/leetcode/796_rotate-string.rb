# @param {String} a
# @param {String} b
# @return {Boolean}
def rotate_string(a, b)
  return true if a == b

  return false if a.size != b.size

  return a == b if a.size == 1

  new_str = a.dup
  (new_str.size - 1).times do |_n|
    new_str = "#{new_str[-1]}#{new_str[0..-2]}"

    return true if new_str == b
  end

  false
end

a = 'abcde'
b = 'cdeab'

p rotate_string(a, b)
