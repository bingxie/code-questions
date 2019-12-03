log = %(2014-01-09T06:16:53.748849+00:00 heroku[router]: at=info method=POST path=/api/online/platforms/facebook_canvas/users/100002266342173/add_ticket host=mygame.heroku.com fwd="94.66.255.106" dyno=web.12 connect=12ms service=21ms status=200 bytes=78\n2014-01-09T06:16:53.742892+00:00 heroku[router]: at=info method=GET path=/api/users/100002266342173/count_pending_messages host=mygame.heroku.com fwd="94.66.255.106" dyno=web.8 connect=9ms service=9ms status=304 bytes=0\n2014-01-09T06:16:55.742892+00:00 heroku[router]: at=info method=GET path=/api/users/100002266342175/count_pending_messages host=mygame.heroku.com fwd="94.66.255.106" dyno=web.8 connect=9ms service=8ms status=304 bytes=0\n2014-01-09T06:16:55.742892+00:00 heroku[router]: at=info method=GET path=/api/users/100002266342175/count_pending_messages host=mygame.heroku.com fwd="94.66.255.106" dyno=web.7 connect=7ms service=9ms status=304 bytes=0\n2014-01-09T06:16:53.766841+00:00 heroku[router]: at=info method=POST path=/logs/save_personal_data host=mygame.heroku.com fwd="5.13.87.91" dyno=web.10 connect=1ms service=42ms status=200 bytes=16\n2014-01-09T06:16:53.766841+00:00 heroku[router]: at=info method=POST path=/logs/save_personal_data host=mygame.heroku.com fwd="5.13.87.91" dyno=web.10 connect=1ms service=42ms status=200 bytes=16\n2014-01-09T06:16:55.742892+00:00 heroku[router]: at=info method=GET path=/api/users/100002266342175/count_pending_messages host=mygame.heroku.com fwd="94.66.255.106" dyno=web.8 connect=9ms service=8ms status=304 bytes=0)

class LogParser
  attr_reader :logs_hash
  def initialize
    @logs_hash = Hash.new { |hash, key| hash[key] = [] }
  end

  def parse_log(log)
    logs = log.split("\n")

    logs.each do |line|
      segments = line.split(' ')
      path = segments[4].split('=')[1].gsub(/\d+/, '{user_id}')
      connect = segments[8].split('=')[1][0..-3].to_i # str.gsub(/\D/, '').to_i
      service = segments[9].split('=')[1][0..-3].to_i

      response_time = connect + service

      @logs_hash[path].push response_time
    end
  end

  def cal_mean_time(times)
    times.sum.to_f / times.size
  end

  def cal_mode_time(times)
    times_count = Hash.new(0)

    times.each do |time|
      times_count[time] += 1
    end

    times_count.max_by { |_k, v| v }.first
  end

  # 1,2,3 | 1,2,3,4 | 1 | 1,2
  def cal_median_time(times)
    sorted_times = times.sort
    size = sorted_times.size
    mid = size / 2

    if size.odd?
      sorted_times[mid]
    else
      (sorted_times[mid - 1] + sorted_times[mid]) / 2.0
    end
  end

  def output
    @logs_hash.each do |path, times|
      p path
      p "Mean time: #{cal_mean_time(times)}"
      p "Mode time #{cal_mode_time(times)}"
      p "Median time #{cal_median_time(times)}"
    end
  end
end

parser = LogParser.new
parser.parse_log(log)

pp parser.logs_hash

parser.output
