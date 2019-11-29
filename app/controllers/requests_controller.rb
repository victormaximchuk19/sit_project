class RequestsController < ApplicationController
    before_action :authorized, except: :show
    def index
        @user_requests = Request.all
    end

    def show_all
        if !params['search'].blank?
            @user_requests = Request.where("LOWER(subject) LIKE LOWER(?) OR uniq_url LIKE (?)", "%#{params['search']}%", params['search'])
          else
            @user_requests = Request.all
          end
    end

    def show
        @user_request = Request.find_by_uniq_url(params[:uniq_url])
    end
    
    def edit        
        @user_request = Request.find_by_uniq_url(params[:uniq_url])
    end

    def update_owner
        @user_request = Request.find_by_uniq_url(params[:uniq_url])
        @user_request.update(new_request_owner)
        flash[:success]='Owner changed successfully!'
        redirect_to requests_all_path
    end    
    
    def update_status
        @user_request = Request.find_by_uniq_url(params[:uniq_url])
        @user_request.update(request_status)
        flash[:success]='Status changed successfully!'
        UserMailer.status_updated(@user_request).deliver
        redirect_to '/request/answer/' + @user_request.uniq_url
    end

    def send_answer
        @user_request=Request.find_by_uniq_url(params[:uniq_url])
        if !params[:answer] == "" 
            answer = params[:answer] 
            UserMailer.answer(@user_request, answer).deliver
            flash[:success]='Your answer send successfully!'
            redirect_to '/request/answer/' + @user_request.uniq_url
        else
            flash[:danger] = 'Answer field cant be blank!'
            redirect_to '/request/answer/' + @user_request.uniq_url
        end
    end

    def destroy
        @user_request=Request.find_by_uniq_url(params[:uniq_url])
        UserMailer.request_deleted(@user_request).deliver
        @user_request.destroy
        flash[:success]='Request deleted!'
        redirect_to requests_all_path
    end

    private
    def request_status
        params.require(:request).permit(:status) 
    end

    def new_request_owner
        params.require(:data).permit(:request_owner)
    end

    def search_params
        params.require(:search)
      end
end
