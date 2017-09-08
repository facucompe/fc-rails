class RentMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.model_mailer.new_record_notification.subject
  #
  def rent_notification(rent)
    byebug
    @rent = rent
    # mail to: rent.user.mail, subject: "#{rent.book.title} rent"
    mail to: 'facundo.competiello@wolox.com.ar', subject: "#{rent.book.title} rent"
  end
end
