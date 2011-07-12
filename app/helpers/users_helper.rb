module UsersHelper
  def render_activity(act)
		case act.item_type
    when "Status"
      render :partial => "feed/status", :locals => { :status => act }
    when "Link"
      render :partial => "feed/link", :locals => { :link => act }
    when "Photo"
      render :partial => "feed/photo", :locals => { :photo => act }
    when "Video"
      render :partial => "feed/video", :locals => { :video => act }
    when "EditProfile"
      render :partial => "feed/profile_activity", :locals => { :profile_act => act }
		end
	end
end
