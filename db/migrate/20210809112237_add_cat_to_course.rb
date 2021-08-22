class AddCatToCourse < ActiveRecord::Migration[6.1]
  def change
    add_reference :courses, :category_name, null: false, foreign_key: true
  end
end
