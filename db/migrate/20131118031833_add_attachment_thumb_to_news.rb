class AddAttachmentThumbToNews < ActiveRecord::Migration
  def self.up
    change_table :news do |t|
      t.attachment :thumb
    end
  end

  def self.down
    drop_attached_file :news, :thumb
  end
end
