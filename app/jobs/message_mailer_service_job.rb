class MessageMailerServiceJob
  include Sidekiq::Worker
  
  def perform(message)
    MessageMailerService.call(message)
  end
end