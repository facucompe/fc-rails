class RentMailer < ApplicationMailer
  def rent_notification(rent)
    @rent = rent
    set_locale
    mail to: rent.user.mail, subject: "#{rent.book.title} rent"
  end

  def set_locale
    I18n.locale = @rent.user.locale
  end
end
