class AddPageIdToAchievements < ActiveRecord::Migration
  def change
    add_reference :achievements, :page, index: true
  end
end
