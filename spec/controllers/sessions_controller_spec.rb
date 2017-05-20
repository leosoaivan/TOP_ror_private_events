require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  let(:user) { create(:user) }
  let(:session_params) { { session: { name: user.name } } }
  let(:request) { post :create, params: session_params }

  describe "POST #create" do
    context "with a known user" do
      it "assigns the user to @user" do
        request
        expect(assigns(:user)).to eq(user)
      end

      it "assigns the user's name to cookies" do
        request
        expect(response.cookies['name']).to eq(user.name)
      end

      it "redirects to the user's page" do
        request
        expect(response).to redirect_to user_path(assigns[:user])
      end
    end
    
    context "with an unknown user" do
      let(:unknown_user) { build(:user) }
      let(:session_params) { { session: { name: unknown_user.name } } }
      
      it "flashes a warning " do
        request
        expect(flash[:danger]).to be_present
      end

      it "re-renders the login page" do
        request
        expect(response).to render_template :new
      end
    end
  end
end
