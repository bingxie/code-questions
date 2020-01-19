class Logger
  # Initialize your data structure here.
  def initialize
    @log_hash = {}
  end

  # Returns true if the message should be printed in the given timestamp, otherwise returns false.
  #     If this method returns false, the message will not be printed.
  #     The timestamp is in seconds granularity.
  # :type timestamp: Integer
  # :type message: String
  # :rtype: Boolean
  def should_print_message(timestamp, message)
    if @log_hash[message].nil?
      @log_hash[message] = timestamp
      true
    elsif (timestamp - @log_hash[message]) < 10
      false
    else
      @log_hash[message] = timestamp
      true
    end
  end
end

# Your Logger object will be instantiated and called as such:
obj = Logger.new
