class VerificationsController < ApplicationController
    
    def new
    end
    
    def create
        code = params[:verification][:code]
        user = User.find(params[:id])
        if code == user.otp_code
            log_in user
            params[:rem] == '1' ? remember(user) : forget(user)
            redirect_back_or user
        else
            flash[:danger] = "Invalide code. Try again."
            redirect_to new_verification_path(:id => params[:id], :rem => params[:rem])
        end
    end
    
    # Hidden Facebook mail
    
    def email
        #flash[:danger] = "Please provide your Facebook email."
        #redirect_to root_url
    end
    
    def create_email
    end
end