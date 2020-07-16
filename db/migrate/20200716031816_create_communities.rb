class CreateCommunities < ActiveRecord::Migration[5.2]
  def change
    create_table :communities do |t|
      t.string :name, null: false
      t.string :slogan
      t.text :detail
      t.integer :admin_id

      t.timestamps
    end
    add_index :communities, :name, unique: true
  end
end
