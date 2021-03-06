class RateQueue
  def initialize(capacity)
    @capacity = capacity
    @queue = Array.new(capacity, Time.at(0))
    @mutex = Mutex.new
  end

  def push(timestamp)
    @mutex.synchronize do
      while size >= @capacity
        sleep(1)
      end

      sleep(1)  # only one thread can push
      @queue.push timestamp
    end
  end

  def pop
    @mutex.synchronize do
      # blocked pop
      # while size <= 0
      #   sleep(1)
      # end

      @queue.shift
    end
  end

  def size
    @mutex.synchronize do
      @queue.size
    end
  end

  # 由于Ruby自带的Queue不提供peek的功能, 所以自己实现一个有锁机制的Queue
  def peek
    @mutex.synchronize do
      @queue.first
    end
  end
end

class RateLimiter
  REQUEST_LIMIT = 5
  TIME_LIMIT = 60 # second

  def initialize
    @request_hash = {}
  end

  def allowed?(client_id)
    @request_hash[client_id] ||= RateQueue.new(10)

    request_queue = @request_hash[client_id]

    request_queue.pop while request_queue.size > 0 && (Time.now - request_queue.peek) >= TIME_LIMIT

    if request_queue.size < REQUEST_LIMIT
      request_queue.push Time.now
      return true
    end

    false
  end
end

limiter = RateLimiter.new

threads = []
10.times do
  threads << Thread.new do
    p limiter.allowed?('c_1')
  end
end
threads.each(&:join)
