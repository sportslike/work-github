class Public::OrdersController < ApplicationController

  before_action :authenticate_customer!

  def new
    @order = Order.new
  end

  def confirm
    @cart_items = current_customer.cart_items
    @orders = current_customer
    @order = Order.new(order_params)
    if params[:order][:select] = "3"
      address = Address.new(postal_code: @order.postal_code, address: @order.address, name: @order.name)
      address.customer_id = current_customer.id
      address.save
    end
  end

  def create
    order = Order.new(order_params)
    order.customer_id = current_customer.id
    order.save
    current_customer.cart_items.each do |f|
      op = OrderDetail.new(item_id: f.item.id , amount: f.amount , price: f.amount * f.item.price * 1.1, order_id: order.id  , making_status: 0)
      op.save
      f.destroy
    end
    redirect_to public_orders_thanks_path
  end

  def thanks
  end

  def index
    @orders = current_customer.orders.all
  end

  def show
    @order = Order.find(params[:id])
  end

  private

  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name ,:shipping_cost ,:total_payment ,:status)
  end

end

