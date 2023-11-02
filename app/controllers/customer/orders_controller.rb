class Customer::OrdersController < ApplicationController
  before_action :authenticate_customer!

  def index
    @orders = current_customer.orders.latest
  end

  def show
    @oreder = current_customer.orders.find(paramas[:id])
  end

  def success; end
  
end
