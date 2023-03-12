class Operation < ApplicationRecord
  belongs_to :category
  belongs_to :wallet

  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates :odate, presence: true
  validates :description, presence: true
  validates :otype, presence: true

  paginates_per 10

  @@otypes = {
    income: "Доходи",
    expense: "Витрати"
  }

  def self.get_otype(key)
    @@otypes[key.to_sym]
  end
  
  def self.get_otype_options
    @@otypes.keys.map { |key| [key, self.get_otype(key)] }
  end

  def self.get_operations(start_date, end_date, attr)
    Operation.select(:amount, attr.to_sym).where('odate BETWEEN ? AND ?', start_date,
      end_date)
  end

  def self.set_start_date_default
    today = Date.today
    previous_month = today.prev_month

    first_day_previous_month = Date.new(previous_month.year, previous_month.month, 1)

    first_day_previous_month.strftime("%Y-%m-%d")
  end

  def self.set_end_date_default
    today = Date.today
    previous_month = today.prev_month

    last_day_previous_month = previous_month.end_of_month

    last_day_previous_month.strftime("%Y-%m-%d")
  end
  
end
