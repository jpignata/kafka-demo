class Log
  include Singleton

  def initialize
    @buffer = []
  end

  def write(payload)
    message = Kafka::Message.new(payload)
    @buffer.push(message)
  end

  def flush
    batch = @buffer.pop(@buffer.length)
    queue.push(batch)
  end

  def queue
    @queue ||= Queue.new
  end
end
