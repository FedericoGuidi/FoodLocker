class DaysController < ApplicationController
    
    def new
        @day=Day.new
    end
    
    def index
        @days = Day.paginate(page: params[:page])
    end
    
    def show
        @day = Day.find(params[:id])
    end
    
    def create
        @day=diary.days.build(day_params)
        if @day.save
            flash[:success]= "Day created!"
            redirect_to root_url
        else
            render 'static_pages/home'
        end
    end
    
    def update
        @day=Day.find(params[:id])
        if @day.update_attributes(day_params)
            
            flash[:success] = "Day updated"
            redirect_to root_url
            
            else
            render 'edit'
        end
    end
    
    def edit
        @day=Day.find(params[:id])
    end
    
    def destroy
        @day.destroy
        flash[:success] = "Day deleted"
        redirect_to request.referrer || root_url
    end
    
    
    private
    
        def day_params
            params.require(:day).permit(:date,:breakfast,:breakfast_kcal,:lunch,:lunch_kcal,:dinner,:dinner_kcal,:snack,:snack_kcal,:water,:note)
        end
end
