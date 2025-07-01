class ContactMailer < ApplicationMailer
  def contact_email(contact)
    @contact = contact

    #送信元メールアドレス
    mail(from: @contact.email,
         to: 's1f102301796@iniad.org',
         subject: "Inquiry from Portfolio Site: #{@contact.subject}")
  end
end
