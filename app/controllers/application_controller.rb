class ApplicationController < ActionController::Base
    before_action :authorized
    helper_method :current_staff_member 
    helper_method :logged_in?
    add_flash_types :success,:danger


    def current_staff_member    
        StaffMember.find_by(id: session[:staff_member_id])  
    end
    
    def logged_in?
    !current_staff_member.nil?
    end

    def authorized
        redirect_to '/welcome' unless logged_in?
     end

end
