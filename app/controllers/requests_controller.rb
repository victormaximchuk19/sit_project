class RequestsController < ApplicationController
    def index
        @user_request = Request.all
    end
    
    def show
        @user_request = Request.find(params[:id])
    end
end
