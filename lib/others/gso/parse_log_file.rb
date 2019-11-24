log = %Q(2014-01-09T06:16:53.748849+00:00 heroku[router]: at=info method=POST path=/api/online/platforms/facebook_canvas/users/100002266342173/add_ticket host=mygame.heroku.com fwd="94.66.255.106" dyno=web.12 connect=12ms service=21ms status=200 bytes=78\n2014-01-09T06:16:53.742892+00:00 heroku[router]: at=info method=GET path=/api/users/100002266342173/count_pending_messages host=mygame.heroku.com fwd="94.66.255.106" dyno=web.8 connect=9ms service=9ms status=304 bytes=0\n2014-01-09T06:16:55.742892+00:00 heroku[router]: at=info method=GET path=/api/users/100002266342175/count_pending_messages host=mygame.heroku.com fwd="94.66.255.106" dyno=web.8 connect=9ms service=8ms status=304 bytes=0\n2014-01-09T06:16:55.742892+00:00 heroku[router]: at=info method=GET path=/api/users/100002266342175/count_pending_messages host=mygame.heroku.com fwd="94.66.255.106" dyno=web.7 connect=7ms service=9ms status=304 bytes=0\n2014-01-09T06:16:53.766841+00:00 heroku[router]: at=info method=POST path=/logs/save_personal_data host=mygame.heroku.com fwd="5.13.87.91" dyno=web.10 connect=1ms service=42ms status=200 bytes=16)

#puts log

logs = log.split("\n")

class LogParser
  attr_reader :logs_hash
  def initialize
    @logs = []
    @logs_hash = Hash.new { |hash, key| hash[key] = [] }
  end

  def parse(log)
    @logs = log.split("\n")

    @logs.each do |log|
      segments = log.split
      # pp segments
      path = segments[4].gsub(/\d+/, '{user_id}').split('=')[1]  # use gsub
      connect = get_number(segments[8])
      service = get_number(segments[9])
      # dyno = segments[7].split('=')[1]

      response_time = connect + service
      @logs_hash[path] << response_time
    end
  end

  def cal_mean_time(response_times)
    response_times.sum.to_f / response_times.size
  end

  def calculate_max_dyno(data_array)
    # max_dyno_hash = Hash.new(0)
    data_array.each_with_object(Hash.new(0)) do |data, hash|  # Learn to use: each_with_object
      hash[data[:dyno]] += 1
    end.max.first

    # max_dyno_hash.max[0]
  end

  def cal_median_time(response_times)
    sorted_times = response_times.sort
    size = response_times.size
    middle = size / 2

    if size.even?
      return (sorted_times[middle - 1] + sorted_times[middle]) / 2.to_f
    else
      return sorted_times[middle]
    end
  end

  def cal_mode_time(response_times)
    time_count = response_times.each_with_object(Hash.new(0)) do |time, hash|
      hash[time] += 1
    end

    time_count.max_by { |_k, v| v }.first
  end

  def output
    @logs_hash.each do |path, response_times|
      puts "#{path} requested #{response_times.size}, avg-connect: #{cal_mean_time(response_times)}, median_time: #{cal_median_time(response_times)} mode_time: #{cal_mode_time(response_times)}"
    end
  end

  private

  def get_number(str)
    str.gsub(/\D/, '').to_i  # use gsub
  end
end

parser = LogParser.new
parser.parse(log)

p parser.logs_hash

parser.output
