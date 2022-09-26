class SendingMailToSubscribersJob < ApplicationJob
  queue_as :default

  def perform(model)
    all_emails = model.event.subscriptions.map(&:user_email) + [model.event.user.email] - [model.user.email]
    if model.instance_of?(Comment)
      all_emails.each do |mail|
        EventMailer.comment(model.event, model, mail).deliver_later
      end
    elsif model.instance_of?(Photo)
      all_emails.each do |mail|
        EventMailer.photo(model.event, model, mail).deliver_later
      end
    end
  end
end
