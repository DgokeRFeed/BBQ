module ApplicationHelper
  def user_avatar(user)
    if user.avatar?
      user.avatar.url
    else
      default_user_avatar
    end
  end

  def default_user_avatar
    asset_path("default_user.png")
  end

  def bi_icon(icon_class)
    content_tag "span", "", class: "bi bi-#{icon_class}"
  end
end
