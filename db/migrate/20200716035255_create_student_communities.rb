class CreateStudentCommunities < ActiveRecord::Migration[5.2]
  def change
    create_table :student_communities do |t|
      t.references :student, foreign_key: true
      t.references :community, foreign_key: true

      t.timestamps
    end
  end
end
