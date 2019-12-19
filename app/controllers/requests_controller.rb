class RequestsController < ApplicationController
    before_action :authorized, except: :show
    def index
        @user_requests_unassigned = Request.where(status: 'Waiting for staff response')
        @user_requests_opened = Request.where(status: 'Opened', staff_member_id: current_staff_member.id.to_s)
        @user_requests_on_hold = Request.where(status: 'On hold', staff_member_id: current_staff_member.id.to_s)
        @user_requests_closed = Request.where(status: 'Closed', staff_member_id: current_staff_member.id.to_s)
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
        if @user_request.status == 'Waiting for staff response'
           @user_request.update(staff_member_id: current_staff_member.id, status: 'Opened')
           UserMailer.status_updated(@user_request).deliver
        end
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
        if  !(params[:answer] == "") 
            answer = Answer.create(answer_text: params[:answer],request_id: @user_request.id) 
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
        params.require(:data).permit(:staff_member_id)
    end

    def search_params
        params.require(:search)
      end
end
