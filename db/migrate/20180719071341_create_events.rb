class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.datetime :date
      t.string :location
      t.belongs_to :creator, index: true

      t.timestamps
    end
  end
end
