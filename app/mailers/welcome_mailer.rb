class WelcomeMailer < ActionMailer::Base
  default from: "support@artcaring.com"

  def welcome_artist(user)
    @user = user
      mail(to: user.email, subject: "Welcome to ArtCaring!")
      
  end
end
