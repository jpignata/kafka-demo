require "singleton"

class KafkaLog
  include Singleton

  def initialize
    @queue = Queue.new
  end

  def write(messages)
    @queue.push(messages)
  end

  def start(producer)
    Thread.new do
      while batch = @queue.pop
        batch.each do |message|
          producer.send(Kafka::Message.new(message))
        end
      end
    end
  end
end
