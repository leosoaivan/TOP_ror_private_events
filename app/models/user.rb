class User < ApplicationRecord
  has_many :event_attendings, foreign_key: :event_attendee_id
  has_many :attended_events, through: :event_attendings, source: :attended_event
 
  has_many :created_events, foreign_key: :creator_id, class_name: 'Event', dependent: :destroy

  def upcoming_events
    self.attended_events.select { |event| event.date > Date.today }
  end

  def previous_events
    self.attended_events.select { |event| event.date < Date.today }
  end
  
end
