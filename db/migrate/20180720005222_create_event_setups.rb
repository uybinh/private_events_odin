class CreateEventSetups < ActiveRecord::Migration[5.2]
  def change
    create_table :event_setups do |t|
      t.references :attended_event, foreign_key: true
      t.references :attendee, foreign_key: true

      t.timestamps
    end
  end
end
