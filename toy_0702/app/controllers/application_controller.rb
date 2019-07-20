class ApplicationController < ActionController::Base
  helper_method :get_cart

  def get_cart
    if current_user
      return current_user.orders.where(state: :cart).first_or_create
    end
  end
end
