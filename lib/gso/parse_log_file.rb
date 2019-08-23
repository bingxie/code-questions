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
      pp segments
      path = segments[4].gsub(/\d+/, '{user_id}').split('=')[1]
      connect = get_number(segments[8])
      dyno = segments[7].split('=')[1]

      new_log_data = {
        connect: connect,
        dyno: dyno
      }

      @logs_hash[path] << new_log_data
    end
  end

  def calculate_avg_connect_time(data_array)
    total = data_array.reduce(0) { |s, data| s += data[:connect]}
    total / data_array.size
  end

  def calculate_max_dyno(data_array)
    # max_dyno_hash = Hash.new(0)
    data_array.each_with_object(Hash.new(0)) do |data, hash|
      hash[data[:dyno]] += 1
    end.max[0]

    # max_dyno_hash.max[0]
  end

  def output
    @logs_hash.each do |path, data|
      puts "#{path} requested #{data.size}, avg-connect: #{calculate_avg_connect_time(data)}, max-dyno: #{calculate_max_dyno(data)}"
    end
  end

  private

  def get_number(str)
    str.gsub(/\D/, '').to_i
  end
end

parser = LogParser.new
parser.parse(log)

p parser.logs_hash

parser.output