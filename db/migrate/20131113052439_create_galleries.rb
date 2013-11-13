class CreateGalleries < ActiveRecord::Migration
  def change
    create_table :galleries do |t|
      t.string :title
      t.attachment :avatar
      t.boolean :show

      t.timestamps
    end
  end
end
