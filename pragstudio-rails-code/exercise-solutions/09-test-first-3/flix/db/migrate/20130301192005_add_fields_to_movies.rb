class AddFieldsToMovies < ActiveRecord::Migration
  def change
    add_column :movies, :description, :text
    add_column :movies, :released_on, :date
  end
end
