class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!
  def index
   @cart_item = current_customer.cart_items
  end

  def create
       cart = CartItem.new(cart_params)
      # if同じ商品がカートに入っている場合 CartItem.where(item_id: params[:cart_item][:item_id] ,customer_id: current_cutomer.id).present?
      #   数量を足し算してアップデート
      # else
      #   しょうひんwoかーとのsave
      # end
       if CartItem.where(item_id: params[:cart_item][:item_id] ,customer_id: current_customer.id).present?
       @cart_item = CartItem.find_by(item_id: params[:cart_item][:item_id] ,customer_id: current_customer.id)
        new_amount = @cart_item.amount + cart.amount
        @cart_item.update_attribute(:amount, new_amount)
       else
        cart.customer_id = current_customer.id
        cart.save
       end
       redirect_to public_cart_items_path
  end

  def destroy
    @items = CartItem.find(params[:id])
    @items.destroy
    redirect_to public_cart_items_path
  end

  def destroy_all
    @items = current_customer.cart_items
    @items.each do |f|
    f.destroy
    end
    redirect_to public_items_path
  end

  def update
       cart_item = CartItem.find(params[:id])
       cart_item.update(cart1_params)
       redirect_to public_cart_items_path
  end

  private

  def cart_params
    params.require(:cart_item).permit(:amount ,:item_id)
  end
  def cart1_params
    params.require(:cart_item).permit(:amount)
  end
end

