producer = Kafka::Producer.new(topic: "posts")
KafkaLog.instance.start(producer)
