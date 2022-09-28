class EventMailer < ApplicationMailer
  def subscription(subscription)
    @event = subscription.event
    @email = subscription.user_email
    @name = subscription.user_name

    mail to: @event.user.email, subject: t("event_mailer.subscription.theme") + @event.title
  end

  def comment(comment, email)
    @comment = comment
    @event = comment.event

    mail to: email, subject: t("event_mailer.comment.theme") + @event.title
  end

  def photo(photo, email)
    @photo = photo
    @event = photo.event

    mail to: email, subject: t("event_mailer.photo.theme") + @event.title
  end
end
