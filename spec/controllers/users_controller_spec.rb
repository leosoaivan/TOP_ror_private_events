require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:user1) { create(:user) }
  let(:user2) { create(:user) }

  describe "GET #index" do
    it "assigns all users to @users" do
      get :index
      expect(assigns(:users)).to match_array([user1, user2])
    end
  end

  describe "GET #new" do
    it "assigns a new User to @user" do
      get :new
      expect(assigns(:user)).to be_a_new(User)
    end
  end

  describe "POST #create" do
    context "with a saved user" do
      it "redirects to the @user page" do
        user = build(:user)
        post :create, params: { user: { name: user.name } }
        expect(response).to redirect_to user_path(assigns[:user])
      end
    end

    context "with an unsaved user" do
      let(:request) { post :create, params: { user: { name: nil } } }   
      
      it "flashes a warning" do
        request
        expect(flash[:danger]).to be_present
      end

      it "re-renders the sign-up page" do
        request
        expect(response).to render_template :new
      end
    end
  end

  describe "GET #show" do
    it "assigns a user to @user" do
      get :show, params: { id: user1 }
      expect(assigns(:user)).to eq(user1)
    end
  end

end
