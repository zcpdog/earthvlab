class AddAttachmentThumbToRefers < ActiveRecord::Migration
  def self.up
    change_table :refers do |t|
      t.attachment :thumb
    end
  end

  def self.down
    drop_attached_file :refers, :thumb
  end
end
