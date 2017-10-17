class UsersController < ApplicationController
    before_action :logged_in_user, only: [:index, :edit, :update, :destroy,
                                          :following, :followers]
    before_action :correct_user,   only: [:edit, :update, :self_destroy]
    before_action :admin_user,     only: [:destroy, :ban, :unban, :promote, :demote]
    
    def index
        @users = User.paginate(page: params[:page])
    end
    
    def show
        @user = User.find(params[:id])
        if current_user.admin? && current_user!= @user
            		redirect_to edit_user_path
            	else
                  @user = User.find(params[:id])
            	end
        @microposts = @user.microposts.paginate(page: params[:page])
    end
    
    def ban
        User.find(params[:id]).update_attributes(banned: true)
        	flash[:success] = "User banned"
        	#redirect_to users_path
    end
    
    def unban
        User.find(params[:id]).update_attributes(banned: 'f')
        flash[:success] = "User unbanned"
        #redirect_to users_path
    end
    
    def promote
        User.find(params[:id]).update_attributes(admin: true)
        flash[:success] << " and is now an admin"
        #redirect_to users_path
    end
    
    def demote
        User.find(params[:id]).update_attributes(admin: false)
        flash[:success] << " and is not an admin"
        #redirect_to users_path
    end
    
    
    def new
        @user = User.new
    end
    
    def create
        @user = User.new(user_params)
        if @user.save
            @user.send_activation_email
            flash[:info] = "Please check your email to activate your account."
            redirect_to root_url
        else
            render 'new'
        end
    end
    
    def edit
        @user = User.find(params[:id])
    end
    
    def update
        @user = User.find(params[:id])
        if @user.update_attributes(user_params)
            flash[:success] = "Profile updated"
            if current_user.admin?
                	    params[:user][:banned] == '1' ? ban : unban
                        params[:user][:admin] == '1' ? promote : demote
                        redirect_to users_path
            else redirect_to @user
            end
        else
            render 'edit'
        end 
    end
    
    def destroy
        User.find(params[:id]).destroy
        flash[:success] = "User deleted"
        redirect_to users_url
    end
    
    def self_destroy
        User.find(params[:id]).destroy
        flash[:success] = "We hope to see you again!"
        redirect_to root_url
    end
    
    def following
        @title = "Following"
        @user  = User.find(params[:id])
        @users = @user.following.paginate(page: params[:page])
        render 'show_follow'
    end

    def followers
        @title = "Followers"
        @user  = User.find(params[:id])
        @users = @user.followers.paginate(page: params[:page])
        render 'show_follow'
    end
    
    private
        def user_params
            params.require(:user).permit(:name, :nickname, :email, :password,
                                         :password_confirmation, :google_auth, :avatar, :banned)
        end
    
        # Before filters
        
        # Confirms the correct user.
        def correct_user
            @user = User.find(params[:id])
            redirect_to(root_url) unless current_user?(@user) || current_user.admin?
        end
    
        # Confirms an admin user.
        def admin_user
            redirect_to(root_url) unless current_user.admin?
        end
    
end
