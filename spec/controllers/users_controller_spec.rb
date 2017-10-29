require 'spec_helper'

describe UsersController, type: :controller do
    before(:all) do
        @user = create(:user)
    end
    
    after(:all) do
        @user.destroy
    end
    
    describe "GET #new" do
        it "renders the :new template" do
            get :new
            expect(response).to be_success
        end
    end
    
    describe "GET #edit" do
        it "renders the :edit template" do
            log_in(@user)
            get :edit, params: { id: @user.id }
            expect(response).to be_success
        end
    end
    
    describe "POST #create" do
        context "valid attributes" do
            it "create a @user" do
                post :create, params: { id: @user.id, user: attributes_for(:user)}
                expect(response).to be_success
            end
        end
        
        context "invalid attributes" do
            it "re-renders the new method" do
                post :create, params: { id: @user.id, user: attributes_for(:invalid_user)}
                expect(response).to be_success
            end
        end
    end
    
    describe "PUT #update" do
        context "valid attributes" do
            it "changes @user's attributes" do
                log_in(@user)
                put :update, params: { id: @user.id, user: attributes_for(:user) }
                expect(response).to redirect_to @user
            end
        end
        
        context "invalid attributes" do
            it "re-renders the edit method" do
                log_in(@user)
                put :update, params: {id: @user.id, user: attributes_for(:invalid_user)}
                expect(response).to be_success
            end
        end
    end
    
end