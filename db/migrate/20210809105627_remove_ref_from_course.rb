class RemoveRefFromCourse < ActiveRecord::Migration[6.1]
  def change
    remove_column :courses, :references, :string
  end
end
