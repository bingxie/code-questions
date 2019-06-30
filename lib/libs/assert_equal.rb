class String
  # colorization
  def colorize(color_code)
    "\e[#{color_code}m#{self}\e[0m"
  end

  def red
    colorize(31)
  end

  def green
    colorize(32)
  end

  def yellow
    colorize(33)
  end

  def blue
    colorize(34)
  end

  def pink
    colorize(35)
  end

  def light_blue
    colorize(36)
  end
end

module AssertEqual
  def assert_equal(a, b, desc = "")
    if a == b
      puts "#{desc} ... #{'PASS'.green}"
    else
      puts "#{desc} ... #{'FAIL'.red}: #{a} != #{b}"
    end
  end

  def assert_true(value, desc = "")
    puts "#{desc} ... #{value ? 'PASS' : "FAIL: #{value} is not true"}"
  end

  def assert_false(value, desc = "")
    puts "#{desc} ... #{value ? "FAIL: #{value} is not false" : 'PASS'}"
  end

  def assert_raises(desc = '')
    begin
      yield
      puts "#{desc} ... #{'FAIL'.red}"
    rescue
      puts "#{desc} ... #{'PASS'.green}"
    end
  end
end