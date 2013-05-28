class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :asignee
      t.timestamp :deadline
      t.string :description
      t.string :priority
      t.string :tag

      t.timestamps
    end
  end
end
