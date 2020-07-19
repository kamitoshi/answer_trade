class CreateWatchPoints < ActiveRecord::Migration[5.2]
  def change
    create_table :watch_points do |t|
      t.references :student, foreign_key: true
      t.integer :point, default: 10

      t.timestamps
    end
  end
end
