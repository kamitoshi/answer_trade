class CreateCommunities < ActiveRecord::Migration[5.2]
  def change
    create_table :communities do |t|
      t.string :name, null: false
      t.string :slogan
      t.text :detail

      t.timestamps
    end
    add_index :communities, :name
  end
end
