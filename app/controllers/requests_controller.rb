class RequestsController < ApplicationController
    before_action :authorized
    def index
        @user_requests = Request.all
    end

    def show
        @user_request = Request.find(params[:id])
    end
    
    def edit        
        @user_request = Request.find(params[:id])
    end

    def update
        @user_request = Request.find_by_id(params[:id])
        @user_request.update(request_status)
        flash[:success]='Status changed successfully!'
        redirect_to '/request/answer/' + @user_request.id.to_s
    end

    private
    def request_status
        params.require(:request).permit(:status) 
    end
end
