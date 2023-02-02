class CreateWallets < ActiveRecord::Migration[7.0]
  def change
    create_table :wallets do |t|
      t.string :name
      t.references :family_member, null: false, foreign_key: true

      t.timestamps
    end
  end
end