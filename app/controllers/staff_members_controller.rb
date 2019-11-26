class StaffMembersController < ApplicationController
    before_action :authorized  

    def index
      @staff_members=StaffMember.all
    end

    def new 
      @staff_member=StaffMember.new
    end

    def create
        @staff_member = StaffMember.create(staff_member_params)
        if @staff_member.errors.any?
        flash[:danger]
        render 'staff_members/new'
        else 
        flash[:success]="Staff member created!"
        redirect_to '/welcome' 
      end
      
    end
    
    private

    def staff_member_params
        params.require(:staff_member).permit(:name,:password_digest)
    end
   
end
