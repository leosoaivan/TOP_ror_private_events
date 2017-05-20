require 'rails_helper'

RSpec.describe EventsController, type: :controller do
  let(:user) { create(:user) }
  let(:event) { user.created_events.build(name: 'BBQ', date: DateTime.now) }
  let(:event_params) { { event: { name: event.name, date: event.date } } }
  let(:request) { post :create, params: event_params }

  describe "GET #new" do
    it "assigns a new Event to @event" do
      get :new
      expect(assigns(:event)).to be_a_new(Event)
    end
  end
  
  describe "POST #create" do
    before(:each) do
      cookies[:name] = user.name
    end
    
    it "assigns a built event to @event" do
      request
      expect(assigns(:event).name).to eq(event.name)
    end

    context "with a saved @event" do
      it "redirects to @event" do
        request
        expect(response).to redirect_to event_path(assigns[:event])
      end
    end
    
    context "with an unsaved @event" do
      before(:each) do
        event.name = nil
      end
      
      it "flashes a warning" do
        request
        expect(flash[:danger]).to be_present
      end
      
      it "re-renders the new page" do
        request
        expect(response).to render_template :new
      end
    end
  end

  describe "GET #show" do
    it "assigns a created event to @event" do
      event.save
      get :show, params: { id: event }
      expect(assigns(:event)).to eq(event)
    end
  end
end
