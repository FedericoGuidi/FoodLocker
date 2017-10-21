class DiariesController < ApplicationController
  # GET /diaries
  # GET /diaries.json
  protect_from_forgery with: :null_session
  
  
  def index
    @diaries = Diary.all
  end

  # GET /diaries/1
  # GET /diaries/1.json
  

  # GET /diaries/new
  def new
    @diary = Diary.new
    @diary.id=current_user.id
  end

  # GET /diaries/1/edit
  def edit
      @diary=Diary.find(params[:id])
  end

  # POST /diaries
  # POST /diaries.json
  def create
      @diary=current_user.build_diary(diary_params)
      if @diary.save
          @diary.update_attribute(:id, current_user.id)
          flash[:success] = "Diary created"
          redirect_to root_url
      else
          render 'new'
      end

  end

  # PATCH/PUT /diaries/1
  # PATCH/PUT /diaries/1.json
  def update
      @diary=Diary.find(params[:id])
      if @diary.update_attributes(diary_params)
          
          flash[:success] = "Diary updated"
          redirect_to root_url
          
      else
          render 'edit'
      end
  end

  # DELETE /diaries/1
  # DELETE /diaries/1.json
  def destroy
    @diary.destroy
    respond_to do |format|
      format.html { redirect_to diaries_url, notice: 'Diary was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  

  private
  
    # Never trust parameters from the scary internet, only allow the white list through.
    def diary_params
      params.require(:diary).permit(:user_id)
    end
end
