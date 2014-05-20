class MessageMailer < ActionMailer::Base
  default to: "support@artcaring.com"

  def new_message(message)
    @message=message
    mail(from: message.email, subject:"#{message.subject}")
  end
end
