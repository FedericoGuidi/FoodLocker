class SessionsController < ApplicationController
    
    def new
    end
    
    def create
        user = User.find_by(email: params[:session][:email].downcase)
        if user && !user.admin && Site.first.suspended?
            redirect_to suspended_path
        else
            if user && user.authenticate(params[:session][:password])
                if user.activated?
                        if user.google_auth
                            redirect_to new_verification_path(:id => user.id, :rem => params[:session][:remember_me])
                        else
                            log_in user
                            params[:session][:remember_me] == '1' ? remember(user) : forget(user)
                            user.create_diary if user.diary.blank?
                            if user.quiz.blank?
                                redirect_to new_quiz_path
                            else
                                redirect_back_or user
                            end
                        end

                else
                    message  = "Account not activated. "
                    message += "Check your email for the activation link."
                    flash[:warning] = message
                    redirect_to root_url
                end
            else
                flash.now[:danger] = 'Invalid email/password combination' # Not quite right!
                render 'new'
            end
        end
    end
    
    def destroy
        log_out if logged_in?
        redirect_to root_url
    end
    
    # Facebook Login
    
    def create_fb
        user = User.from_omniauth(request.env["omniauth.auth"])
        user.create_diary if user.diary.blank?
        if user.email.blank?
            flash[:danger] = "You need to provide your email in order to sign-up with Facebook."
            redirect_to new_user_path
        else
            user.update_attribute(:activated, true)
            user.save
            user.create_diary if user.diary.blank?
            if user.google_auth
                redirect_to new_verification_path(:id => user.id)
            else
                log_in user
                if user.quiz.blank?
                    redirect_to new_quiz_path
                    else
                    redirect_back_or user
                end
            end
        end
    end
    
    def after_sign_in_path_for(resource)
            if resource.is_a?(User) && resource.banned?
              sign_out resource
              flash[:error] = "This account has been suspended for violation of...."
              root_path
            else
              super
            end
       end

    def destroy_fb
        log_out if logged_in?
        redirect_to root_url
    end
    
end
