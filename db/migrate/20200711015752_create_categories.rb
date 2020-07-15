class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :subject
      t.string :subject_content

      t.timestamps
    end
  end
end
