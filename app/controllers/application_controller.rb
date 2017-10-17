class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    before_action :suspended?
    before_action :banned?
    include SessionsHelper
    private

    # Confirms a logged-in user.
    def logged_in_user
        unless logged_in?
            store_location
            flash[:danger] = "Please log in."
            redirect_to login_url
        end
    end
    
    def suspended?
        if (Site.find(1).suspended? && (current_user.nil? || (current_user.present? && !current_user.admin?))) && request.env['PATH_INFO'] != login_path
            redirect_to suspended_path unless request.fullpath == '/suspended'
        end
    end
    
    def banned?
            if current_user.present? && current_user.banned?
              log_out
              flash[:error] = "This account has been suspended."
              redirect_to root_path
            end
      end

end
