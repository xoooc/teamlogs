class CreateLogs < ActiveRecord::Migration
  def change
    create_table :logs do |t|
      t.date :logDate

      t.timestamps
    end
  end
end
