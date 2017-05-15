require 'rails_helper'

describe User do
  let(:user) { User.create(name: 'Leo') }
  let(:creator) { User.create(name: 'creator') }

  let(:event1) {
    creator.created_events.create(
      name: 'BBQ',
      date: DateTime.now + 1.day
    )
  }
  let(:event2) {
    creator.created_events.create(
      name: 'Concert',
      date: DateTime.now - 1.day
    )
  }

  it { is_expected.to have_many(:attended_events).through(:event_attendings) }
  it { is_expected.to have_many(:created_events).class_name('Event') }
  
  it "has a valid factory" do
    expect(build(:user)).to be_valid
  end
  
  it "is valid with a name" do
    expect(user).to be_valid
  end
  
  it "is invalid without a name" do
    other_user = build(:user, name: nil)
    expect(other_user).to_not be_valid
  end

  it "is invalid with a duplicate user name" do
    other_user = create(:user, name: 'Steve')
    duplicate_user = User.new(name: 'Steve')
    expect(duplicate_user).to_not be_valid
  end

  describe "#upcoming_events" do
    it "returns events after today" do
      user.attended_events << [event1, event2]
      expect(user.upcoming_events).to eq([event1])
    end
  end

  describe "#previous_events" do
    it "returns events after today" do
      user.attended_events << [event1, event2]
      expect(user.previous_events).to eq([event2])
    end
  end
end
