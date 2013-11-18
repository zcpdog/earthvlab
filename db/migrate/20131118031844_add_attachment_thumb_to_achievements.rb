class AddAttachmentThumbToAchievements < ActiveRecord::Migration
  def self.up
    change_table :achievements do |t|
      t.attachment :thumb
    end
  end

  def self.down
    drop_attached_file :achievements, :thumb
  end
end
