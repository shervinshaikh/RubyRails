class CreateRegistrations < ActiveRecord::Migration
  def change
    create_table :registrations do |t|
      t.string :name
      t.string :email
      t.string :how_heard
      t.references :event, index: true

      t.timestamps
    end
  end
end
