class CreateRefers < ActiveRecord::Migration
  def change
    create_table :refers do |t|
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
