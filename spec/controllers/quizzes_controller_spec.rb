require 'spec_helper'

describe QuizzesController, type: :controller do
    
    describe "GET #new" do
        it "renders the :new template" do
            log_in(User.first)
            get :new
            expect(response).to be_success
        end
    end
    
    describe "GET #edit" do
        it "renders the :edit template" do
            log_in(User.first)
            get :edit
            expect(response).to be_success
        end
    end
    
    describe "PUT update" do
        before :each do
            @quiz=Factory(:quiz, name: "Chiara", gender:"F", height:"1.70", weight: "70", age: "22", water: "3", sport:"true", sport_time:"40", target_weight:"55", kcal:"1300")
        end
        
        context "valid attributes" do
            it "located the requested @quiz" do
                put :update, id: @quiz, quiz: Factory.attributes_for(:quiz)
                response.should redirect_to @quiz
            end
        
            it "changes @quiz's attributes" do
                put :update, id: @quiz, 
                    quiz: Factory.attributes_for(:quiz, name: "Chiara", gender:"F", height:"1.70", weight: "70", age: "22", water: "3", sport:"true", sport_time:"40", target_weight:"55", kcal:"1300")
                    @quiz.reload
                    @quiz.name.should eq("Chiara")
                    @quiz.gender.should eq("F")
                    @quiz.height.should eq("1.70")
                    @quiz.weight.should eq("70")
                    @quiz.age.should eq("22")
                    @quiz.water.should eq("3")
                    @quiz.sport.should eq("true")
                    @quiz.sport_time.should eq("40")
                    @quiz.target_weight.should eq("55")
                    @quiz.kcal.should eq("1300")
                    
            end
        
           it "redirects to the updated quiz" do
                put :update, id: @quiz, quiz: Factory.attributes_for(:quiz)
                response.should redirect_to @quiz
           end
        end
        
    context "invalid attributes" do
        it "locates the requested @quiz" do
            put :update, id: @quiz, quiz: Factory.attributes_for(:invalid_contact)
            assigns(:quiz).should eq(@quiz)      
        end
    
        it "does not change @contact's attributes" do
            put :update, id: @quiz, 
            quiz: Factory.attributes_for(:quiz, name: nil, gender:"F", height:"1.70", weight: "70", age: "22", water: "3", sport:"true", sport_time:"40", target_weight:"55", kcal:"1300")
            @quiz.reload
                    @quiz.name.should_not eq("Chiara")
                    @quiz.gender.should eq("F")
                    @quiz.height.should eq("1.70")
                    @quiz.weight.should eq("70")
                    @quiz.age.should eq("22")
                    @quiz.water.should eq("3")
                    @quiz.sport.should eq("true")
                    @quiz.sport_time.should eq("40")
                    @quiz.target_weight.should eq("55")
                    @quiz.kcal.should eq("1300")
        end
    
        it "re-renders the edit method" do
            put :update, id: @quiz, contact: Factory.attributes_for(:invalid_contact)
            response.should render_template :edit
        end
    end

end    
end
            
            
        