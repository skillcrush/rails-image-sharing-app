module ApplicationHelper

  def current_user
  	@user ||= User.where("id=?",session[:user_id]).first
  end

  def logged_in?
    !current_user.nil? && !current_user.id.nil?
  end
  
end
