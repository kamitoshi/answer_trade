class CreateEducationalBackgrounds < ActiveRecord::Migration[5.2]
  def change
    create_table :educational_backgrounds do |t|
      t.references :student, foreign_key: true
      t.string :primary_school
      t.string :middle_school
      t.string :high_school
      t.boolean :is_public, default: false

      t.timestamps
    end
  end
end
