class Users::RegistrationsController < Devise::RegistrationsController
  def update
    if params[:user][:password].blank?
      params[:user].delete('password')
      params[:user].delete('password_confirmation')
    end

    params[:user].delete('headshot') if params[:user][:headshot].blank?

    @user = User.find(current_user.id)
    if @user.update_attributes(params[:user])
      set_flash_message :notice, :updated
      # sign in the user bypassing validation in the case his password changed
      sign_in @user, bypass: true
      redirect_to after_update_path_for(@user)
    else
      render 'devise/registrations/edit'
    end
  end
end
