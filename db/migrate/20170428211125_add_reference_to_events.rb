class AddReferenceToEvents < ActiveRecord::Migration[5.0]
  def change
    add_reference   :events, :creator, references: :users
    add_foreign_key :events, :users, column: :creator_id
  end
end
