class CreateEventAttendings < ActiveRecord::Migration[5.0]
  def change
    create_table :event_attendings do |t|

      t.timestamps
    end
  end
end
