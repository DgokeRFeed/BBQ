module ApplicationHelper
  def bi_icon(icon_class)
    content_tag "span", "", class: "bi bi-#{icon_class}"
  end

  def event_photo(event)
    asset_path("event.jpg")
  end

  def event_photo_thumb(event)
    asset_path("event_thumb.jpg")
  end

  def default_user_avatar
    asset_path("default_user.png")
  end

  def user_avatar(user)
    if user.avatar.attached?
      user.avatar.variant(:normal)
    else
      default_user_avatar
    end
  end

  def user_avatar_thumb(user)
    if user.avatar.attached?
      user.avatar.variant(:thumb)
    else
      default_user_avatar
    end
  end
end
