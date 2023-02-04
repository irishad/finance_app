class ReportsController < ApplicationController
  def report_by_category
  end

  def report_by_dates
  end

  def report_by_wallets
  end

  def result_by_category
    @operations = Operation.all
  end

  def result_by_dates
  end

  def result_by_wallets
  end
end
