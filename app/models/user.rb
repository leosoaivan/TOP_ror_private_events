class User < ApplicationRecord
  serialize :attended_events, Hash

  has_many :event_attendings, foreign_key: :event_attendee_id
  has_many :attended_events, through: :event_attendings, source: :attended_event
 
  has_many :created_events, foreign_key: :creator_id, class_name: 'Event', dependent: :destroy
end