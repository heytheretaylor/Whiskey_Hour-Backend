class CreateWhiskeys < ActiveRecord::Migration
  def change
    create_table :whiskeys do |t|
      t.string :name
      t.string :category

      t.timestamps null: false
    end
  end
end
