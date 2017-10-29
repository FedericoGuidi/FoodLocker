require 'spec_helper'

describe DiariesController, type: :controller do
    before(:all) do
        @diary = create(:diary)
    end
    
    after(:all) do
        @diary.user.destroy
    end
    
    describe "GET #edit" do
        it "renders the :edit template" do
            log_in(@diary.user)
            get :edit, params: { id: @diary.id }
            expect(response).to be_success
        end
    end
end