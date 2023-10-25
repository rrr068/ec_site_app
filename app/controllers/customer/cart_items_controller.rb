class Customer::CartItemsController < ApplicationController
  before_action :authenticate_customer!
  before_action :set_cart_item, only: %i[increase decrease destroy]
  
  
  def index
    @cart_items = current_customer.cart_items
  end

  def create
    increase_or_create(params[:cart_item][:product_id])
    redirect_to cart_items_path, notice: '商品をカートに入れました'
  end

  def increase
    @cart_item.increment!(:quantity, 1)
    redirect_to request.referer, notice: '商品を更新しました'
  end

  def decrease
    decrease_or_destroy(@cart_item)
    redirect_to request.referer, notice: '商品を更新しました'
  end

  def destroy
    @cart_item.destroy
    redirect_to request.referer, notice: '商品を削除しました'
  end

  private

  def set_cart_item
    @cart_item = current_cutomer.cart_items.find(params[:id])
  end

  def increase_or_create(product_id)
    cart_item = current_cutomer.cart_items.find_by(product_id:)
    if cart_item
      cart_item.increment!(:quantity, 1)
    else
      current_cutomer.cart_items.build(product_id:).save
    end
  end

  def decrease_or_destroy(cart_item)
    if cart_item.quantity > 1
      cart_item.decrement!(:quantity, 1)
    else
      cart_item.destroy
    end
  end

end