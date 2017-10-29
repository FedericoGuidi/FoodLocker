require 'spec_helper'

describe DaysController, type: :controller do
    before(:all) do
        @day = create(:day)
    end
    
    after(:all) do
        @day.diary.user.destroy
    end
    
    describe "GET #index" do
        it "renders the :index template" do
            log_in(@day.diary.user)
            get :index
            expect(response).to be_success
        end
    end
    
    describe "GET #show" do
        it "renders the :show template" do
            log_in(@day.diary.user)
            get :show, params: { id: @day.id }
            expect(response).to be_success
        end
    end
end