class SessionsController < ApplicationController
  
  def new
  end

  def create
    @staff_member = StaffMember.find_by(name: params[:session][:name])
    if @staff_member && @staff_member.password_digest == params[:session][:password_digest]
       session[:staff_member_id] = @staff_member.id
       flash[:success]="Success login!"
       redirect_to '/welcome'
    else
      flash[:danger]="Wrong name or password!"
       redirect_to '/stafflogin'
    end
  end

  def login
  end

  def welcome
  end

  def page_requires_login
  end
  
  def destroy
    session.delete(:staff_member_id)
    @current_staff_member = nil
    redirect_to pages_home_path
  end
end
