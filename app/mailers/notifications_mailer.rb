class NotificationsMailer < ActionMailer::Base

  default :from => "noreply@codetry.org"
  default :to => "contact@codetry.org"

  def new_message(message)
    @message = message
    mail(:subject => "[Codetry.org] #{message.subject}")
  end

end