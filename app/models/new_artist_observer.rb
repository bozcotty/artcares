class NewArtistObserver < ActiveRecord::Observer
  observe :user

  def after_save(user)
   # Notifications.user("support@artcaring.com", "New Artist signed up", user.email).deliver
   WelcomeMailer.welcome_artist(@user).deliver
  end
end
