class ContactMailer < ApplicationMailer
    def contact_mail(tuitum)
      @tuitum = tuitum
       mail to:@tuitum.user.email, subject: "お問い合わせの確認メール"
    end
end
