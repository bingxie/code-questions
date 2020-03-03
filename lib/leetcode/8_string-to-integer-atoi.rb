# @param {String} str
# @return {Integer}
def my_atoi(str)
  return 0 if str.nil?

  striped = str.strip

  if striped.match?(/^[-+]?\d+/)
    num = striped.split.first.to_i
    return num >= 0 ? [2_147_483_647, num].min : [-2_147_483_648, num].max
  else
    return 0
  end
end

p my_atoi('42')

p my_atoi('000012')

p my_atoi('   -42')

p my_atoi('4193 with words')

p my_atoi('4193with words')

p my_atoi('words and 987')

p my_atoi('-91283472332')

p my_atoi(' ')

p my_atoi('')

p my_atoi(nil)
