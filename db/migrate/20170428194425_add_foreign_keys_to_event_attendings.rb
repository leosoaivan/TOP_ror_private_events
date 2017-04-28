class AddForeignKeysToEventAttendings < ActiveRecord::Migration[5.0]
  def change
    add_foreign_key :event_attendings, :users, column: :event_attendee_id
    add_foreign_key :event_attendings, :events, column: :attended_event_id
  end
end
