class UsersController < ApplicationController

    skip_before_action :verify_authenticity_token

    # Post - /royalkitchen/user/signup
    def signup 
        @user = User.new(set_params)
        @user.password = params[:password_digest]
        if @user.save 
            render json: "you have created Royal kitchen account successfully"
        else
            render json: @user.errors
        end
    end


    # Post - /royalkitchen/user/login
    def login
        if User.find_by(email: params[:email])
            @user = User.find_by(email: params[:email])
            
            if @user.authenticate(params[:password])
                render json: "Login Success!! Welcome back to Royal Kitchen. Order your favourite dish now."
            else
                render json: "Password you entered is incorrect"
            end
        else 
            render json: "The email you entered is not register with Royal Kitchen"
        end
    end












    private 

    def set_params 
        params.require(:user).permit(:username,:email,:password_digest)
    end
end
