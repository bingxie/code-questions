class DoorLock
  def initialize(locked)
    @locked = locked
    @mutex = Mutex.new
  end

  def open?
    @mutex.synchronize { !@locked }
  end

  def unlock!
    unless open?
      @mutex.synchronize do
        puts 'Opening the door!'
        @locked = false
      end
    end
  end
end

door_lock = DoorLock.new(true)

# 5个线程,只有一个可以unlock the door
5.times.map do
  Thread.new do
    door_lock.unlock! unless door_lock.open?
  end
end.each(&:join)
