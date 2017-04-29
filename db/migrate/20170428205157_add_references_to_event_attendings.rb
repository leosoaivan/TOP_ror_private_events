class AddReferencesToEventAttendings < ActiveRecord::Migration[5.0]
  def change
    add_reference   :event_attendings, :event_attendee, references: :users
    add_foreign_key :event_attendings, :users, column: :event_attendee_id

    add_reference   :event_attendings, :attended_event, references: :events
    add_foreign_key :event_attendings, :events, column: :attended_event_id
  end
end