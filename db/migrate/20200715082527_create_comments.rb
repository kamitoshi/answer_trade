class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.references :student, foreign_key: true
      t.references :video, foreign_key: true
      t.text :detail

      t.timestamps
    end
  end
end
