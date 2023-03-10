class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.text :body
      t.integer :commenter_id
      t.boolean :completed_id
      t.boolean :in_progress_id
      t.integer :incomplete_id

      t.timestamps
    end
  end
end
