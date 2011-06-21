class ImportContactsController < ApplicationController
	def invite_friends
		@user = current_user
	end

	def import
	  if params[:login].blank? || params[:password].blank?
	    flash[:error] = "No Email/Password"
	    render "/invite_friends" and return
	  end
		@users = User.find(params[:id])
		begin
			@sites = {"gmail"  => Contacts::Gmail, "yahoo" => Contacts::Yahoo, "hotmail" => Contacts::Hotmail}
			@contacts = @sites[params[:from]].new(params[:login], params[:password]).contacts
			@users , @no_users = [], []
			@contacts.each do |contact|
				#if u = User.find(:first , :conditions => @users.email = ‘#{contact[1]}’ , :include =>[:user])
				if u = User.find(:first , :conditions => "email = '#{contact[1]}'" )
				  unless u == current_user || current_user.requested_friends.include?(u) || current_user.friends.include?(u) || current_user.pending_friends.include?(u)
					 @users << u
					end
				else
					@no_users << {:name => contact[0] , :email => contact[1]}
				end
			end
			respond_to do |format|
				format.html {render :template => 'shared/_contact_list'}
				format.xml {render :xml => @contacts.to_xml}
			end
		rescue Exception => e
		  flash[:error] = e.message
		  redirect_to "/invite_friends" and return
		end
	end

	def invite
		InvitationsMailer.invite(params[:email], params[:name],current_user.email).deliver
		render :json => "{status:'success'}"
	end

end
