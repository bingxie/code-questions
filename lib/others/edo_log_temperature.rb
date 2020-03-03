# You are working with a team of meteorologists studying temperatures in a city. They have asked you to build a system that will track temperatures and provide metrics.

# Your system should provide a function 'log(temperature)' that they will call once per second to record measured temperatures, as well as functions to query their data for useful metrics. Initially, they would like to be able to know:

# 1) the average of temperatures from the last 24 hours, and
# 2) the maximum temperature from the last 24 hours

# As an example, if the meteorologists wanted to know the maximum temperature recorded for all time, your solution might look like this:

# Let max = NULL

# Log(temperature):
#   IF max IS NULL
#     Set max = temperature
#   ELSE IF temperature > max
#     Set max = temperature

# GetMaxAllTime:
#   Return max

# log()  # tem, timestamp, {timestamp: tem, }

# 24 * 60 * 60

class LogTemperature
  attr_reader :max_temp, :avg_temp

  def initialize
    @queue = []
    @max_temp = nil
    @temp_total = 0
    @avg_temp = nil
  end

  def log(temperature)
    max_size = 5 # 24 * 60 * 60

    removed_temp = @queue.shift if @queue.size == max_size

    @queue.push temperature

    update_max(temperature, removed_temp)

    update_avg(temperature, removed_temp)
  end

  def update_max(temperature, removed_temp)
    if @max_temp.nil?
      @max_temp = temperature
      return
    end

    # worse case: 当所有的问题都是一直在下降的情况，每一次都需要重新计算max
    # removed_temp != temperature 用于处理队列中温度都是一样的
    @max_temp = if removed_temp && removed_temp == @max_temp && removed_temp != temperature
                  @queue.max
                else
                  [@max_temp, temperature].max
                end
  end

  def update_avg(temperature, removed_temp)
    @temp_total -= removed_temp if removed_temp

    @temp_total += temperature

    @avg_temp = @temp_total / @queue.size.to_f
  end
end

log_temp = LogTemperature.new
log_temp.log(7)
log_temp.log(-4)
log_temp.log(0)
log_temp.log(5)
log_temp.log(5)

p log_temp.max_temp
p log_temp.avg_temp

log_temp.log(6)

p log_temp.max_temp
p log_temp.avg_temp
