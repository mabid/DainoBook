class Notifier < ActionMailer::Base

	default :from => "no-reply@dainobook.com"

	def invite(email, name)
		@root_url = DOMAIN_URL
		@by = current_user.full_name
		mail(:to => email, :subject => "Invitatation to DainoBook from "+ current_user.full_name)
	end


end
