class CreateFamilyMembers < ActiveRecord::Migration[7.0]
  def change
    create_table :family_members do |t|
      t.string :name
      t.references :wallet, null: false, foreign_key: true

      t.timestamps
    end
  end
end
