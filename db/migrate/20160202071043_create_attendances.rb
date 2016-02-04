class CreateAttendances < ActiveRecord::Migration
  def change
    create_table :attendances do |t|
      t.integer :user_id
      t.integer :ritual_id
      t.boolean :is_coming

      t.timestamps null: false
    end
  end
end
