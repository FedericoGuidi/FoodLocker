class QuizzesController < ApplicationController
    
    #before_action :logged_in_user
    
    def index
    end
    
    def new
        @quiz=Quiz.new
        @quiz.id=current_user.id
    end
    
    def create
        @quiz=current_user.build_quiz(quiz_params)
        if @quiz.save
            @quiz.update_attribute(:id, current_user.id)
            flash[:success] = "Quiz created"
            redirect_to root_url
        else
            render 'new'
        end
    end
    
    def update
        @quiz=Quiz.find(params[:id])
         if @quiz.update_attributes(quiz_params)
             
            flash[:success] = "Quiz updated"
            redirect_to root_url
             
         else
             render 'edit'
        end
    end
    
    def edit
        @quiz=Quiz.find(params[:id])
    end
    
    private
    
    def quiz_params
        params.require(:quiz).permit(:name, :gender, :height, :weight, :age, :water, :sport, :sport_time, :target_weight)
    end
    
    
    
end
