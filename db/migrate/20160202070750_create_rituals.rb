class CreateRituals < ActiveRecord::Migration
  def change
    create_table :rituals do |t|
      t.datetime :date_of
      t.integer :whiskey_id
      t.integer :user_turn
      t.string :title
      

      t.timestamps null: false
    end
  end
end
