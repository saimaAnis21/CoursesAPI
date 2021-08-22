class ChangeCourseColType < ActiveRecord::Migration[6.1]
  def change
    change_column :courses, :category_name_id, 'integer USING CAST(category_name_id AS integer)'
  end
end
