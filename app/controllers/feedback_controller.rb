class FeedbackController < ApplicationController
  def deliver
    if FeedbackForm.new(feedback_params).deliver
      flash[:notice] = 'Thank you for your feedback.'
    else
      flash[:alert] = 'Cannot send your message.'
    end
    redirect_to(controller: :home, action: :index)
  end

  private

  def feedback_params
    params.require('feedback_form').permit(:email, :message)
  end
end
