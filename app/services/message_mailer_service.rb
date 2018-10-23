class MessageMailerService

  def self.call(json_message)
    new(json_message).call
  end

  attr_accessor :json_message

  def initialize(json_message)
    self.json_message = json_message
  end

  def call
    parsed_json = JSON.parse(json_message)
    message = Message.new(parsed_json)

    MessageMailer.with(message: message).contact.deliver_now
  end
end