class GoogleAuthenticationController < ApplicationController
    def new
    end
    
    def create
        code = params[:google_authentication][:code]
        if code == current_user.otp_code
            current_user.update_attribute(:google_auth, true)
            flash[:success] = "Google Authentication enabled!"
            redirect_to current_user
        else
            flash[:danger] = "Invalid code. Try again."
            redirect_to configure_url
        end
    end
    
    def destroy
        current_user.update_attribute(:google_auth, false)
        flash[:success] = "Google Authentication disabled!"
        redirect_to current_user
    end
end
