class PhotosController < ApplicationController
  before_action :set_event, only: %i[create destroy]
  before_action :set_photo, only: %i[destroy]

  def create
    @new_photo = @event.photos.build(photo_params)
    @new_photo.user = current_user

    if @new_photo.save
      notify_subscribers(@event, @new_photo)
      redirect_to @event, notice: t("controllers.photo.created")
    else
      render "events/show", alert: t("controllers.photo.error")
    end
  end

  def destroy
    message = { notice: t('controllers.photo.destroyed') }

    if current_user_can_edit?(@photo)
      @photo.destroy
    else
      message = { alert: t("controllers.photo.error") }
    end

    redirect_to @event, message
  end

  private

  def set_event
    @event = Event.find(params[:event_id])
  end

  def set_photo
    @photo = @event.photos.find(params[:id])
  end

  def photo_params
    params.fetch(:photo, {}).permit(:photo)
  end

  def notify_subscribers(event, photo)
    all_emails = event.subscriptions.map(&:user_email) + [event.user.email]
    all_emails.delete(current_user.email) if current_user.present?
    all_emails.each do |mail|
      EventMailer.photo(event, photo, mail).deliver_now
    end
  end
end
