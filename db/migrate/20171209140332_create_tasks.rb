class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.string :user_uuid, null: false
      t.string :title, null: false
      t.string :queue, null: false
      t.datetime :completed_at
      t.datetime :deleted_at
      t.timestamps
    end

    add_index :tasks, :user_uuid
    add_index :tasks, :queue
    add_index :tasks, :completed_at
    add_index :tasks, :deleted_at
  end
end
