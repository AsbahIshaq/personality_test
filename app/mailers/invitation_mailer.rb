class InvitationMailer < ApplicationMailer

  def invite_by_email(email)
    mail(to: email, subject: "Personality Test")
  end
end
