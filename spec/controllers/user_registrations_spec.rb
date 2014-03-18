require 'spec_helper'

describe UserRegistrationsController do

  describe 'GET #new' do
    before :each do
      get :new
    end

    #it "assigns a new UserRegistration to resource" do
    #  expect(assigns(:resource)).to be_a_new(UserRegistration)
    #end

    it "renders the :new template" do
      expect(response).to render_template :new
    end
  end

  describe "POST #create" do

    context "with valid attributes" do
      it "saves the new user in the database" do
        expect{
          post :create, user_registration: attributes_for(:user_registration)
        }.to change(User, :count).by(1)
      end

      it "redirects to root path" do
        post :create, user_registration: attributes_for(:user_registration)
        expect(response).to redirect_to root_path
      end
    end

    context "with invalid attributes" do
      it "does not save the new user in the database" do
        expect{
          post :create, user_registration: attributes_for(:invalid_user_registration)
        }.to_not change(User, :count)
      end

      it "re-renders the :new template" do
        post :create, user_registration: attributes_for(:invalid_user_registration)
        expect(response).to render_template :new
      end
    end

  end

end
