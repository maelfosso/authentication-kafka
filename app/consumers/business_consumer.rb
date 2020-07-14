
class BusinessConsumer < ApplicationConsumer
  def consume 
    Karafka.logger.info "New [Business] event: #{params}"
  end 
end
