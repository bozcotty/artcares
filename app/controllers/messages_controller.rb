class MessagesController < ApplicationController
  
  def new 
    @message = Message.new
  end

  def create
    @message = Message.new(params[:message])
    if @message.valid?
      MessageMailer(@message).deliver
      redirect_to root_url, notice: "Your message has been sent. Thank you for contacting us."
    else
      render "new"
    end
  end

end
