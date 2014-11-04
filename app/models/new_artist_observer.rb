class NewArtistObserver < ActiveRecord::Observer
  observe :user

  def after_create(user)

      #Notifications.user("support@artcaring.com", "New Artist signed up", user.email).deliver
      WelcomeMailer.welcome_artist(user).deliver
      NotifyNewUserMailer.new_notify_new_user(user).deliver

  end

end
