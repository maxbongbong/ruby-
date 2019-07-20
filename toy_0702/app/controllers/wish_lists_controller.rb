class WishListsController < ApplicationController

  before_action :check_current_user

  def index
    @wish_lists = current_user.wish_lists
  end

  def create
    current_user.wish_lists.where(product_id: wish_list_params[:product_id]).first_or_create wish_list_params
    redirect_to wish_lists_path
  end

  def destroy
    wish_list = WishList.where(id: params[:id]).first
    wish_list.destroy
    redirect_to wish_lists_path
  end

  def wish_list_params
    params.require(:wish_list).permit(:user_id, :product_id)
  end

  def check_current_user
    redirect_to root_path unless current_user
  end
end
