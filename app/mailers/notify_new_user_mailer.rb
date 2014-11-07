class NotifyNewUserMailer < ActionMailer::Base
  default to: 'support@artcaring.com'

  def new_notify_new_user(user)
    @user = user
    mail(from: 'support@artcaring.com', subject: "ArtCaring has a new user: #{user.email}!")
  end
end
