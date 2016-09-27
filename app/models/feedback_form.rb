class FeedbackForm < MailForm::Base
  attribute :email, validate: /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :message, validate: true
  attribute :nickname, captcha: true

  # Declare the e-mail headers. It accepts anything the mail method
  # in ActionMailer accepts.
  def headers
    {
      subject: 'Travel First feedback',
      to: ENV.fetch('FEEDBACK_RECEIVING_EMAIL'),
      from: email
    }
  end
end
