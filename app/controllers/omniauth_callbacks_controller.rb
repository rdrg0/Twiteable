class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def github
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    @user = User.from_omniauth(request.env['omniauth.auth'])

    if @user.persisted?
      sign_in_and_redirect @user
      set_flash_message(:notice, :success, kind: 'Github') if is_navigational_format?
    else
      flash[:alert] = "We can't create an account with your Github. Please try again."
      redirect_to new_user_registration_url
    end
  end

  def failure
    redirect_to root_path
  end
end
