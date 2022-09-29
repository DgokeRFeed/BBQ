class EventsController < ApplicationController
  before_action :authenticate_user!, except: %i[index]
  before_action :set_event, except: %i[index new create]

  after_action :verify_authorized, only: %i[edit update destroy show]
  after_action :verify_policy_scoped, only: %i[index]

  def index
    @events = policy_scope(Event)
  end

  def show
    begin
      authorize @event
    rescue Pundit::NotAuthorizedError
      flash.now[:alert] = t("controllers.events.wrong_pincode") if params[:pincode].present?
      render "pincode_form"
    end

    @new_comment = @event.comments.build(params[:comment])
    @new_subscription = @event.subscriptions.build(params[:subscription])
    @new_photo = @event.photos.build(params[:photo])
  end

  def new
    @event = current_user.events.build
  end

  def edit
    authorize @event
  end

  def create
    @event = current_user.events.build(event_params)

    if @event.save
      redirect_to @event, notice: t("controllers.events.created")
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    authorize @event

    if @event.update(event_params)
      redirect_to @event, notice: t("controllers.events.updated")
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @event

    @event.destroy
    redirect_to events_url, notice: t("controllers.events.destroyed")
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def set_current_user_event
    @event = current_user.events.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:title, :address, :datetime, :description, :pincode)
  end
end
