class CommentsController < ApplicationController
  before_action :set_event, only: %i[create destroy]
  before_action :set_comment, only: %i[destroy]
  
  def create
    @new_comment = @event.comments.build(comment_params)
    @new_comment.user = current_user

    if check_captcha(@new_comment) && @new_comment.save
      SendingMailToSubscribersJob.perform_later(@new_comment)
      redirect_to @event, notice: t("controllers.comments.created")
    else
      render "events/show", alert: t("controllers.comments.error")
    end
  end

  def destroy
    message = { notice: t("controllers.comments.destroyed") }

    if current_user_can_edit?(@comment)
      @comment.destroy
    else
      message = { alert: t("controllers.comments.error") }
    end

    redirect_to @event, message
  end

  private

  def set_event
    @event = Event.find(params[:event_id])
  end

  def set_comment
    @comment = @event.comments.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body, :user_name)
  end
end
