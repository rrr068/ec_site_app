class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_order

  def show; end

  def update
    @order.update(order_params)
    redirect_to admin_order_path(@order), notice: '購入履歴が更新されました'
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:status)
  end
end