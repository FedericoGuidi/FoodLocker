class SitesController < ApplicationController
  #before_action :set_site, only: [:show, :edit, :update, :destroy]

  # GET /sites
  # GET /sites.json
  
def index
	#@sites = Site.all
	redirect_to root_path
end

  # GET /sites/1
  # GET /sites/1.json
  def show
	  redirect_to root_path
  end

  # GET /sites/new
  def new
    @site = Site.new
  end

  # GET /sites/1/edit
def edit
	redirect_to root_path
end


def create
#@site = Site.new(site_path)
	if Site.nil?
		@site = Site.new(suspended: false)
	else @site = Site.find(1)
	end

end


	
def suspend
    if current_user.admin? 
      Site.first.update_attributes(suspended: true)
	  flash[:success] = "FoodLocker updated"
      redirect_to root_path
    end
  end
    
  def unsuspend
    if current_user.admin? 
      Site.first.update_attributes(suspended: false)
	  flash[:success] = "FoodLocker updated"
      redirect_to root_path
    end
  end
    
  def update
    params[:site][:suspended] == '1' ? suspend : unsuspend
  end

end
