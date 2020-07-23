
class BusinessConsumer < ApplicationConsumer
  def consume 
    Karafka.logger.info "New [Business] event:"
    puts params
    puts
  end 
end
