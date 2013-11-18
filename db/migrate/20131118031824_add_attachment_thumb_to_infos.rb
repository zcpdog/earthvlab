class AddAttachmentThumbToInfos < ActiveRecord::Migration
  def self.up
    change_table :infos do |t|
      t.attachment :thumb
    end
  end

  def self.down
    drop_attached_file :infos, :thumb
  end
end
