class OrdersController < ApplicationController

  before_action :check_current_user
  before_action :load_object, only: [:show, :destroy]

  def index
    @orders = current_user.orders
  end

  def show; end

  def cart
    @order = get_cart
  end

  def payment
    # if params[:direct] == "true"
    #   @order = current_user.orders.create(state: :direct)
    #   @order.line_items.create(product_id: params[:product_id])
    # else
    # end
    @order = get_cart
  end

  def payment_completed
    @order = get_cart
    @order.update(order_params)
    @order.update(completed_at: Time.now)
    redirect_to order_path(@order)
  end

  def destroy
    @order.destroy
    redirect_to orders_path
  end

  private

  def order_params
    params.require(:order).permit(:user_id, :note, :paied_at, :payment_amount, :state, :address_2 , :address_1, :completed_at, :amount, :number )
  end

  def check_current_user
    redirect_to root_path unless current_user
  end

  def load_object
    @order = Order.where(id: params[:id]).first
  end
end
