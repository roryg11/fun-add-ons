class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.string :title
      t.string :description
      t.boolean :completed
      t.integer :goal_id
      t.timestamps null: false
    end
  end
end
