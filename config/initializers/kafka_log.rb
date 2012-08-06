producer = Kafka::Producer.new(topic: "blog_log")
KafkaLog.instance.start(producer)
