class StaffMembersController < ApplicationController
    skip_before_action :authorized, only: [:new, :create]
    def new 
      @staff_member=StaffMember.new
    end

    def create
        @staff_member = StaffMember.create(staff_member_params)
        if @staff_member.errors.any?
        flash[:danger]="Name is unavailable!"
        render 'staff_members/new'
        else 
        session[:staff_member_id] = @staff_member.id
        flash[:success]="Welcome!"
        redirect_to '/welcome' 
      end
        
    end
    private
    def staff_member_params
      params.require(:staff_member).permit(:name,        
        :password_digest)
    end
   
end
