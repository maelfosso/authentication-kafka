# require 'kafka'

# $kafka = Kafka.new(['192.168.8.102:9092']) # , logger: Rails.logger)

# $kafka_consumer = $kafka.consumer(
#   group_id: "group"
# )
# $kafka_consumer.subscribe("business", start_from_beginning: true)
# $kafka_consumer.each_message(
#   automatically_mark_as_processed: false
# ) do |message| 
#   puts message.topic, message.partition
#   puts message.offset, message.key, message.value
# end

# $kafka.each_message(topic: "business") do |message|
#   puts message.offset, message.key, message.value
# end

# $kafka_producer = $kafka.async_producer(
#   delivery_interval: 10,
# )

# at_exit { 
#   $kafka_producer.shutdown 
#   $kafka_consumer.stop
# }
