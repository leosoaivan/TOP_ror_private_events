require 'rails_helper'

RSpec.describe Event do
  let(:creator) { User.create(name: 'creator') }
  
  let(:event1) {
    creator.created_events.create(
      name: 'The Concert',
      date: DateTime.now
    )
  }
  let(:event2) {
    creator.created_events.create(
      name: 'BBQ',
      date: DateTime.now + 1.day
    )
  }
  let(:event3) {
    creator.created_events.create(
      name: 'Dallying at the zoo',
      date: DateTime.now - 1.day
    )
  }

  it { is_expected.to have_many(:attendees).through(:event_attendings) }
  it { is_expected.to belong_to(:creator).class_name('User') }

  it "is valid with a name AND date AND creator" do
    expect(event1).to be_valid
  end
  
  it "is invalid without an event name" do
    event1.name = nil
    expect(event1).to_not be_valid
  end
    
  it "is invalid without an event date" do
    event1.date = nil
    expect(event1).to_not be_valid
  end

  it "is invalid without an event creator" do
    event = Event.new(name: 'BBQ', date: DateTime.now)
    expect(event).to_not be_valid
  end

  it "returns a collection of past events" do
    expect(Event.past).to eq([event3])
  end

  it "returns a collection of upcoming events" do
    expect(Event.upcoming).to eq([event1, event2])
  end
  
end