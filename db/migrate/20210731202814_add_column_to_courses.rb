class AddColumnToCourses < ActiveRecord::Migration[6.1]
  def change
    add_column :courses, :category_name, :string
    add_column :courses, :references, :string
  end
end
