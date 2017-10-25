class NotificationsController < ApplicationController
    
    def index
        @notifications = Notification.paginate(page: params[:page])
    end
    
    def new
        @notification = Notification.new
    end
    
    def show
    end
    
    def create
        @notification=current_user.notifications.build(notification_params)
        if @notification.save
            flash[:success]= @notification.content
            redirect_to root_url
        else
            render 'static_pages/home'
        end
    end
    
    def destroy
        Notification.find(params[:id]).destroy
        flash[:success] = "Notification deleted"
        redirect_to notifications_url
    end
    
    private
        def notification_params
            params.require(:notification).permit(:content, :time, :ntype)
        end
    
end
