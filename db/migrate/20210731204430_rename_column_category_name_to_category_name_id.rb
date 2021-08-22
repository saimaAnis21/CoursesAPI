class RenameColumnCategoryNameToCategoryNameId < ActiveRecord::Migration[6.1]
  def change
    rename_column :courses, :category_name, :category_name_id
  end
end
