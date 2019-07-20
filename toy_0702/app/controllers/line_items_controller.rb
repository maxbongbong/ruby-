class LineItemsController < ApplicationController
  def add_cart
    product = Product.where(id: params[:product_id]).first
    get_cart.line_items.create(product: product, quantity: 1, amount: product.price)
    redirect_to cart_orders_path
  end

  def update_amount
    line_item = LineItem.where(id: params[:line_item_id]).first
    if line_item && params[:quantity].present?
      line_item.update quantity: params[:quantity], amount: line_item.product.price*params[:quantity].to_i
    end
  end

  def destroy
    line_item = LineItem.where(id: params[:id]).all
    line_item.destroy
    redirect_to cart_orders_path
  end
end
