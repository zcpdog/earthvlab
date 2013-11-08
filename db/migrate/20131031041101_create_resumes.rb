class CreateResumes < ActiveRecord::Migration
  def change
    create_table :resumes do |t|
      t.string :title
      t.text :content
      t.references :user, index: true
      t.references :page, index: true

      t.timestamps
    end
  end
end
