require 'rails_helper'

RSpec.describe Event, type: :model do
  it { should have_many(:attendees).through(:event_attendings) }
  it { should belong_to(:creator).class_name('User') }
end
