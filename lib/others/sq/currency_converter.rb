class CurrencyConverter
  attr_reader :usd_bases

  def initialize
    @usd_bases = { 'USD' => 1.000 }
  end

  def add_conversion(from, to, rate)
    if to == 'USD'
      value = (1 / rate).round(3)
      usd_bases[from] = value
    end
  end

  def convert_rate(from, to)
    if from == 'USD'
      usd_bases[to]
    else
      (usd_bases[to] / usd_bases[from]).round(3)
    end
  end
end

converter = CurrencyConverter.new
converter.add_conversion('INR', 'USD', 0.014)
p converter.usd_bases

converter.add_conversion('AUD', 'USD', 0.72)
p converter.usd_bases

p converter.convert_rate('USD', 'INR')
p converter.convert_rate('USD', 'AUD')

p converter.convert_rate('INR', 'AUD')
p converter.convert_rate('AUD', 'INR')

# converter.add_conversion('AUD', 'CNY', 4.9)