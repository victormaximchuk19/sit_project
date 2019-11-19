class UsersController < ApplicationController
    
    ALPHA = ('A'..'Z').to_a 
    HEX   = ('A'..'F').to_a + (0..9).to_a

    def new 
        @user=User.new
        @request=Request.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            @request=Request.new(
            request_type: params['request']['request_type'], 
            text: params['request']['text'],
            user_id: @user.id , 
            uniq_url: unique_url, 
            subject: params['request']['subject'])
            @request.save
            redirect_to pages_home_path
         else
          render "new"
        end
    end

    private
    
    def unique_url
        var_unique_url = ''
        return (randomABC(var_unique_url)+
                randomHEX(var_unique_url)+
                randomABC(var_unique_url)+
                randomHEX(var_unique_url)+
                randomABC(var_unique_url))
    end

    def randomABC(str)
          for i in 0..2 do
              str+=ALPHA.sample
          end
          return str
    end
    
    def randomHEX(str)
        for i in 0..1 do
            str+=HEX.sample.to_s
        end
        return str
    end

    def user_params
        params.require(:user).permit(:name, :email)
    end
    
end
