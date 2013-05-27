class CreateLogItems < ActiveRecord::Migration
  def change
    create_table :log_items do |t|
      t.string :name
      t.text :description
      t.string :tag
      t.string :kind

      t.timestamps
    end
  end
end
