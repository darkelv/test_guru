class FeedbacksController < ApplicationController
  before_action :authenticate_user!

  def new
    @feedback = Feedback.new
  end

  def create
    feedback = Feedback.new(feedback_params)
    if feedback.valid?
      FeedbacksMailer.process_message(feedback.body, current_user).deliver_now
      redirect_to new_feedback_url, flash: {success: I18n.t('admin.feedbacks.create.success')}
    else
      flash[:error] = I18n.t('admin.feedbacks.create.error')
      render new
    end
  end

  private

  def feedback_params
    params.require(:feedback).permit(:body)
  end
end
