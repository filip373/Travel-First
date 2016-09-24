class AddSlideValidations < ActiveRecord::Migration[5.0]
  def change
    change_column :slides, :title, :string, limit: 40, null: false
    change_column :slides, :description, :text, limit: 650, null: false
    change_column :slides, :photo, :string, null: false
    change_column :places, :name, :string, null: false
    change_column :places, :teaser, :string, null: false
  end
end
