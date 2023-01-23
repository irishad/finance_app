class CreateOperations < ActiveRecord::Migration[7.0]
  def change
    create_table :operations do |t|
      t.decimal :amount, precision: 8, scale: 2
      t.datetime :odate
      t.string :description
      t.references :category, null: false, foreign_key: true
      t.references :family_member, null: false, foreign_key: true

      t.timestamps
    end
  end
end
