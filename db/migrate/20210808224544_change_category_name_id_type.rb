class ChangeCategoryNameIdType < ActiveRecord::Migration[6.1]
  def change
    # change_column :courses, :category_name_id, :integer
    change_column :courses, :category_name_id, 'numeric USING CAST(category_name_id AS numeric)'
  end
end
