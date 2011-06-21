class InvitationsMailer < ActionMailer::Base
    default :from => "no-reply@dainobook.com"

  def invite(email, name, from_name)
    @root_url = "http://localhost:3000"
    @by = from_name
    mail(:to => email, :subject => "Invitatation to DainoBook from "+ from_name)
  end

end
