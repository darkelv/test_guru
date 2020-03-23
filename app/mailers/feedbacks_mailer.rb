class FeedbacksMailer < ApplicationMailer

  def process_message(meassage_body, user)
    @message = meassage_body
    @user = user

    mail to: User.admin.last.email, subject: "TestGuru Feedback"
  end
end
