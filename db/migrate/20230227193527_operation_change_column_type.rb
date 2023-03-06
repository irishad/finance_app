class OperationChangeColumnType < ActiveRecord::Migration[7.0]
  def change
    change_column(:operations, :otype, :string)
  end
end
