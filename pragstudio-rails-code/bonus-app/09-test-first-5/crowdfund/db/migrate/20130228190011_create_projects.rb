class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.text :description
      t.decimal :target_pledge_amount

      t.timestamps
    end
  end
end
