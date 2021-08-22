class RemoveCatNameFromCourse < ActiveRecord::Migration[6.1]
  def change
    remove_column :courses, :category_name_id, :integer
  end
end
