class ConnectFour
  attr_reader :board

  def initialize
    @board = Array.new(6) { Array.new(7, '') }
  end

  def parse(string)
    extended_string = extend_string(string)
    pp extended_string
    @board.each_with_index do |row, i|
      row.each_with_index do |_value, j|
        index =  i * 7 + j
        row[j] = extended_string[index]
      end
    end

    pp @board
  end

  def extend_string(string)
    str = ""
    number = nil
    string.each_char do |char|
      if char.to_i > 0
        number = char.to_i
        next
      elsif number
        number.times { str.concat(char) } # str.concat(char * number)
        number = nil
      else
        str.concat(char)
      end
    end

    str
  end

  def valid?
    (0..6).each do |j|
      # col_string = ""
      not_space = false
      (0..5).each do |i|
        if not_space
          return false if @board[i][j] == '_'
        else
          next if @board[i][j] == '_'

          not_space = true
        end
      end
    end

    true
  end
end


cf = ConnectFour.new
cf.parse('9_r4_brbrbr_3b2rb_b2r2br_r2b3rb')

p cf.valid?

p cf.board.flatten.count {|x| x == 'b'}  # count check
p cf.board.flatten.count {|x| x == 'r'}
