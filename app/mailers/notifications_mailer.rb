class NotificationsMailer < ActionMailer::Base

  default :from => "info@codetry.org"
  default :to => "andrewkemp70@gmail.com"

  def new_message(message)
    @message = message
    mail(:subject => "[Codetry.org] #{message.subject}")
  end

end