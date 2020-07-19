class CreateAspires < ActiveRecord::Migration[5.2]
  def change
    create_table :aspires do |t|
      t.references :student, foreign_key: true
      t.string :school_name, null: false
      t.string :faculty

      t.timestamps
    end
  end
end
