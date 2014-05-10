class Users::RegistrationsController < Devise::RegistrationsController


  def update

    # required for settings form to submit when password is left blank
    if params[:user][:password].blank?
      params[:user].delete("password")
      params[:user].delete("password_confirmation")
    end

    if params[:user][:headshot].blank?
      params[:user].delete("headshot")
    end

    if params[:user][:sample_work_1].blank?
      params[:user].delete("sample_work_1")
    end

    if params[:user][:sample_work_2].blank?
      params[:user].delete("sample_work_2")
    end

    if params[:user][:sample_work_3].blank?
      params[:user].delete("sample_work_3")
    end

    @user = User.find(current_user.id)
    if @user.update_attributes(params[:user])
      set_flash_message :notice, :updated
      # sign in the user bypassing validation in the case his password changed
      sign_in @user, :bypass => true
      redirect_to after_update_path_for(@user)
    else
      render "devise/registrations/edit"
    end
  end
end