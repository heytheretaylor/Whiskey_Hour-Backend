class AddAttachmentImageToWhiskeys < ActiveRecord::Migration
  def self.up
    change_table :whiskeys do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :whiskeys, :image
  end
end
