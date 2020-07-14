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
class KarafkaApp < Karafka::App
  setup do |config|
    config.kafka.seed_brokers = %w[kafka://192.168.8.100:9092]
    config.client_id = 'nkapsi_accounts_development'
    # config.logger = Rails.logger
  end

  # Comment out this part if you are not using instrumentation and/or you are not
  # interested in logging events for certain environments. Since instrumentation
  # notifications add extra boilerplate, if you want to achieve max performance,
  # listen to only what you really need for given environment.
  # Karafka.monitor.subscribe(WaterDrop::Instrumentation::StdoutListener.new)
  # Karafka.monitor.subscribe(Karafka::Instrumentation::StdoutListener.new)
  # Karafka.monitor.subscribe(Karafka::Instrumentation::ProctitleListener.new)

  # Uncomment that in order to achieve code reload in development mode
  # Be aware, that this might have some side-effects. Please refer to the wiki
  # for more details on benefits and downsides of the code reload in the
  # development mode
  #
  # Karafka.monitor.subscribe(
  #   Karafka::CodeReloader.new(
  #     *Rails.application.reloaders
  #   )
  # )

  consumer_groups.draw do
    topic :business do
      # consumer ExampleConsumer
      # Karafka.logger.info "New [Business] event: #{params}"
      consumer BusinessConsumer
    end

    # consumer_group :bigger_group do
    #   topic :test do
    #     consumer TestConsumer
    #   end
    #
    #   topic :test2 do
    #     consumer Test2Consumer
    #   end
    # end
  end
end

Karafka.monitor.subscribe('app.initialized') do
  # Put here all the things you want to do after the Karafka framework
  # initialization
end

KarafkaApp.boot!
