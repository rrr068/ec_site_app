class OrderMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_mailer.complete.subject
  #
  def complete
    email = args[:email]
    @url  = 'http://localhost:3000/orders'
    mail(to: email, subject: '購入を成功しました')
  end
end
