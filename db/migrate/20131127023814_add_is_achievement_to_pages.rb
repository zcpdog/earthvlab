class AddIsAchievementToPages < ActiveRecord::Migration
  def change
    add_column :pages, :is_achievement, :boolean
  end
end
