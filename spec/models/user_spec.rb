require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many(:created_events).with_foreign_key('creator_id').class_name('Event') }
  it { should have_many(:attended_events).through(:event_attendings) }
end
