class EventMailer < ApplicationMailer
  def subscribtion(event, subscription)
    @email = subscription.user_email
    @name = subscription.user_name

    mail to: event.user.email, subject: "Новая подписка на #{event.title}"
  end

  def comment(event, comment, email)
    @comment = comment
    @event = event

    mail to: email, subject: "Новый комментарий @ #{event.title}"
  end
end
