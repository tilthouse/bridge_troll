require 'spec_helper'

describe CheckinsController do
  before do
    @event = create(:event)
    @session = @event.event_sessions.first
  end

  describe "GET index" do
    it "succeeds" do
      get :index, event_id: @event.id, event_session_id: @session.id
      response.should be_success
    end

    it "assigns the event and session" do
      get :index, event_id: @event.id, event_session_id: @session.id
      assigns(:event).should == @event
      assigns(:session).should == @session
    end
  end
end