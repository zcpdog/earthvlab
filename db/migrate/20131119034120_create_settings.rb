class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.string :name
      t.references :page, index: true

      t.timestamps
    end
  end
end
