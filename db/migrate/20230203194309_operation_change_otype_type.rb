class OperationChangeOtypeType < ActiveRecord::Migration[7.0]
  def change
    change_column(:operations, :otype, :integer)
  end
end
