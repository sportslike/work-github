class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!

  def index
  	@orders = Order.page(params[:page]).per(10).order('created_at DESC')
  end

  def show
  	@order = Order.find(params[:id])
  	@order_items = @order.order_details
  	@total_price = @order_items.sum{|o| o.price * o.amount}
  end

   def update_order
		@order = Order.find(params[:id])
		if params[:order][:status] == '入金確認'
			@order.update(order_params)
			@order_items = @order.order_details
			@order_items.update_all(making_status: '製作待ち')
		else
			@order.update(order_params)
		end
			redirect_to admin_order_path
   end

	   private
	   def order_params
	   	params.require(:order).permit(:status)
	   end
end
