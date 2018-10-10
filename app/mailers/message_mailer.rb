class MessageMailer < ActionMailer::Base
  default to: 'paul@paulbrighton.com',
          from: 'paul@paulbrighton.com'

  def contact(message)
    @message = message
    mail(subject: "A new message from #{@message.name}")
  end
end