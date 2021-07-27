class ContactMailer < ApplicationMailer
  def create(contact)
    @contact = contact
    mail to: 'izszzz@yahoo.co.jp', subject: 'Stave お問い合わせ'
  end
end
