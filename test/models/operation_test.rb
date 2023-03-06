require "test_helper"

class OperationTest < ActiveSupport::TestCase
  fixtures :categories, :wallets, :operations

  def setup
    @start_date = Date.new(2022, 1, 1)
    @end_date = Date.new(2022, 1, 31)
  end

  test "get_otype returns the correct value" do
    assert_equal "Доходи", Operation.get_otype(:income)
    assert_equal "Витрати", Operation.get_otype(:expense)
  end

  test "get_otype_options returns an array of key-value pairs" do
    options = Operation.get_otype_options
    assert_equal 2, options.length
    assert_equal [:income, "Доходи"], options[0]
    assert_equal [:expense, "Витрати"], options[1]
  end

  test "get_operations returns the correct data" do
    odata = Operation.get_operations(@start_date, @end_date, 'category_id')
    assert_equal 10, odata.length
  end
end
