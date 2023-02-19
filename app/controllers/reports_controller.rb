class ReportsController < ApplicationController
  def report_by_category
    @wallets = Wallet.all.map { |wal| [wal.name, wal.id]}
    @otypes = Operation.otypes
  end

  def report_by_dates
    @wallets = Wallet.all.map { |wal| [wal.name, wal.id]}
    @otypes = Operation.otypes
    @categories = Category.all.map { |c| [c.name, c.id]}
  end

  def report_by_wallets
    @otypes = Operation.otypes
    @categories = Category.all.map { |c| [c.name, c.id]}
  end

  def result_by_category
    @operations = Operation.all
  end

  def result_by_dates
  end

  def result_by_wallets
  end
end
