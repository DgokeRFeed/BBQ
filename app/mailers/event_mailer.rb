class EventMailer < ApplicationMailer
  def subscription(subscription)
    @event = subscription.event
    @email = subscription.user_email
    @name = subscription.user_name

    mail to: @event.user.email, subject: default_i18n_subject(title: @event.title)
  end

  def comment(comment, email)
    @comment = comment
    @event = comment.event

    mail to: email, subject: default_i18n_subject(title: @event.title)
  end

  def photo(photo, email)
    @photo = photo
    @event = photo.event

    mail to: email, subject: default_i18n_subject(title: @event.title)
  end
end
