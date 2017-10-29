require 'spec_helper'

describe RecipesController, type: :controller do
    before(:all) do
        @recipe = create(:recipe)
    end
    
    after(:all) do
        @recipe.user.destroy
    end
    
    describe "GET #new" do
        it "renders the :new template" do
            log_in(@recipe.user)
            get :new
            expect(response).to be_success
        end
    end
    
    describe "POST #create" do
        context "valid attributes" do
            it "create a @recipe for user" do
                log_in(@recipe.user)
                post :create, params: { id: @recipe.id, recipe: attributes_for(:recipe)}
                expect(response).to redirect_to root_url
            end
        end
        
        context "invalid attributes" do
            it "re-renders the new method" do
                log_in(@recipe.user)
                post :create, params: { id: @recipe.id, recipe: attributes_for(:invalid_recipe)}
                expect(response).to be_success
            end
        end
    end
    
    describe "GET #show" do
        it "renders the :show template" do
            log_in(@recipe.user)
            get :show, params: { id: @recipe.id }
            expect(response).to be_success
        end
    end
    
    describe "GET #index" do
        it "renders the :index template" do
            log_in(@recipe.user)
            get :index
            expect(response).to be_success
        end
    end
    
    describe "GET #search" do
        it "renders the :search template" do
            log_in(@recipe.user)
            get :search
            expect(response).to be_success
        end
    end
end