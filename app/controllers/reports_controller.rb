class ReportsController < ApplicationController
  include ActiveRecord::Querying

  def report_by_category
    @wallets = Wallet.all.map { |wal| [wal.name, wal.id] }
    @otype_options = Operation.get_otype_options

  end

  def report_by_dates
    @wallets = Wallet.all.map { |wal| [wal.name, wal.id] }
    @otype_options = Operation.get_otype_options
    @categories = Category.all.map { |c| [c.name, c.id] }
  end

  def report_by_wallets
    @otype_options = Operation.get_otype_options
    @categories = Category.all.map { |c| [c.name, c.id] }
  end

  def result_by_category
    if params[:start_date].present? && params[:end_date].present?
      start_date = params[:start_date]
      end_date = params[:end_date]
      if start_date > end_date
        redirect_to reports_report_by_category_path, notice: "Дата початку періоду не може бути більше дати кінця періоду."
        return
      end
    end

    odata = Operation.get_operations(start_date, end_date, 'category_id').where(otype: params[:otype])

    osum_by_categories = check_params(odata).joins(:category).group('categories.name').order('LOWER(categories.name) ASC').sum(:amount)

    @categories_col = osum_by_categories.keys
    @sums = osum_by_categories.values
    @type = Operation.get_otype(params[:otype]).to_s
  end

  def result_by_dates
    if params[:start_date].present? && params[:end_date].present?
      start_date = params[:start_date]
      end_date = params[:end_date]
      if start_date > end_date
        redirect_to reports_report_by_dates_path, notice: "Дата початку періоду не може бути більше дати кінця періоду."
        return
      end
    end

    odata = Operation.get_operations(start_date, end_date, 'odate').where(otype: params[:otype])

    osum_by_dates = check_params(odata).order(:odate).group(:odate).sum(:amount)

    @dates = osum_by_dates.keys.map(&:to_s)
    @sums = osum_by_dates.values
    @type = Operation.get_otype(params[:otype]).to_s
  end

  def result_by_wallets
    if params[:start_date].present? && params[:end_date].present?
      start_date = params[:start_date]
      end_date = params[:end_date]
      if start_date > end_date
        redirect_to reports_report_by_wallets_path, notice: "Дата початку періоду не може бути більше дати кінця періоду."
        return
      end
    end

    odata = Operation.get_operations(start_date, end_date, 'wallet_id').where(otype: params[:otype])

    osum_by_wallets = check_params(odata).joins(:wallet).order('LOWER(wallets.name) ASC').group(:wallet_id).sum(:amount)

    @walles_col = osum_by_wallets.keys.map { |wal| Wallet.find(wal).name}
    @sums = osum_by_wallets.values
    @type = Operation.get_otype(params[:otype]).to_s
  end

  private

  def check_params(odata)
    return odata.where(category_id: params[:category_id], wallet_id: params[:wallet_id]) if params[:category_id].present? && params[:wallet_id].present?
    return odata.where(category_id: params[:category_id]) if params[:category_id].present?
    return odata.where(wallet_id: params[:wallet_id]) if params[:wallet_id].present?
    odata
  end

end


