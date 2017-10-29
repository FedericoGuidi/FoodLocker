require 'spec_helper'

describe QuizzesController, type: :controller do
    
    before(:all) do
        @quiz = create(:quiz)
    end
    
    after(:all) do
        @quiz.user.destroy
    end
    
    describe "GET #new" do
        it "renders the :new template" do
            log_in(@quiz.user)
            get :new
            expect(response).to be_success
        end
    end
    
    describe "GET #edit" do
        it "renders the :edit template" do
            log_in(@quiz.user)
            get :edit, params: { id: @quiz.id }
            expect(response).to be_success
        end
    end
    
    describe "PUT #update" do
        context "valid attributes" do
            it "changes @quiz's attributes" do
                put :update, params: { id: @quiz.id, quiz: attributes_for(:quiz) }
                expect(response).to redirect_to root_url
            end
        end
        
        context "invalid attributes" do
            it "re-renders the edit method" do
                put :update, params: {id: @quiz.id, quiz: attributes_for(:invalid_quiz)}
                expect(response).to be_success
            end
        end
    end
    
    describe "POST #create" do
        context "valid attributes" do
            it "create a @quiz for user" do
                log_in(@quiz.user)
                post :create, params: { id: @quiz.id, quiz: attributes_for(:quiz)}
                expect(response).to redirect_to root_url
            end
        end
        
        context "invalid attributes" do
            it "re-renders the new method" do
                log_in(@quiz.user)
                post :create, params: { id: @quiz.id, quiz: attributes_for(:invalid_quiz)}
                expect(response).to be_success
            end
        end
    end
end
            
            
        