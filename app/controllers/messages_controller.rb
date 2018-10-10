class MessagesController < ApplicationController
  def new
  end

  def create
    @message = Message.new(message_params)
    if @message.valid?
      MessageMailer.contact(@message).deliver_now

      redirect_to static_pages_contact_path, notice: "Your message has been sent, I will get back to you soon."
    else
      render :new
    end
  end

  private

  def message_params
    params.require(:message).permit(:name, :email, :body)
  end
end