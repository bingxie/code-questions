# https://iamdi.dev/playing-with-ruby-threads-and-queues/
# https://www.rubyguides.com/2019/10/ruby-queues/
class Worker
  def initialize(num_threads, queue)
    @num_threads = num_threads
    @threads = []

    @queue = queue
  end

  def start
    @working = true

    @num_threads.times do
      @threads << Thread.new do
        while @working && !@queue.closed?
          puts "#{@queue.num_waiting} threads are waiting"
          job = @queue.pop(false) # if queue is empty, worker thread will wait
          job.perform
        end
      end
    end

    # @thread = Thread.new do
    #   while @working
    #     while !@queue.empty?
    #       Thread.new do
    #         job = @queue.pop
    #         job.perform
    #       end
    #     end
    #     puts "waiting"
    #     sleep(2)
    #   end
    # end
  end

  def stop
    @working = false
    @threads.each(&:exit)
    @threads.clear

    true
  end
end

# Since threads are useful for heavy I/O operations this worker is perfect to do HTTP requests, manipulate with files on disk, make DB requests.  sending emails

class Job
  attr_reader :message, :to

  def initialize(message, to)
    @message = message
    @to = to
  end
end

class EmailJob < Job
  def perform
    puts 'call email service'
    sleep(2)
    puts "send email: #{@message} to #{@to}"
  end
end

class SmsJob < Job
  def perform
    puts 'call sms service'
    sleep(1)
    puts "send sms: #{@message} to #{@to}"
  end
end

class JobQueue < Queue
  def enqueue(job)
    push job
  end
end

class App
  queue = JobQueue.new

  email_job = EmailJob.new('Email content', 'bing708@gmail.com')
  sms_job = SmsJob.new('sms message', '0455500146')

  worker = Worker.new(1, queue) # try 1, 2, 3, 8 threads to see the differeces
  worker.start

  queue.enqueue(email_job)
  queue.enqueue(sms_job)

  sms_job = SmsJob.new('sms another message', '012345678')
  queue.enqueue(sms_job)

  sleep(5)

  worker.stop
  queue.close
end
