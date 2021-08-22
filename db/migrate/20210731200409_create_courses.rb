class CreateCourses < ActiveRecord::Migration[6.1]
  def change
    create_table :courses do |t|
      t.string :title
      t.integer :created_by
      t.decimal :duration
      t.text :description

      t.timestamps
    end
  end
end
