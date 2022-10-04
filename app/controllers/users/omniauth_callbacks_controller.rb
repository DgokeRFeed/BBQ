class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def github
    auth_service("github")
  end

  def vkontakte
    auth_service("vkontakte")
  end

  private

  def auth_service(service)
    @user = User.from_omniauth(request.env["omniauth.auth"])

    if @user.persisted?
      flash[:notice] = I18n.t("devise.omniauth_callbacks.success", kind: service)
      sign_in_and_redirect @user, event: :authentication
    else
      flash[:error] = I18n.t(
        "devise.omniauth_callbacks.failure",
        kind: service,
        reason: "authentication error"
      )

      redirect_to root_path
    end
  end
end