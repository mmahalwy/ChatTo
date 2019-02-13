class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def linkedin
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    @user = User.from_omniauth(request.env['omniauth.auth'])
    if @user.persisted?
      # this will throw if @user is not activated
      sign_in_and_redirect @user, event: :authentication
      set_flash_message(:notice, :success, kind: 'LinkedIn') if is_navigational_format?
    else
      session['devise.linkedin_data'] = request.env['omniauth.auth']
      flash[:alert] = @user.errors.full_messages.to_sentence
      redirect_to new_user_registration_url
    end
  end

  def failure
    redirect_to root_path
  end
end