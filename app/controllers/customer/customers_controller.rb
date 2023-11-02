class Customer::CustomersController < ApplicationController
  before_action :authenticate_customer!

  def confirm_withdraw
    current_customer.update(status: 'withdraw')
    reset_session
    redirect_to root_path,notice: '退会に成功しました'
  end
end
