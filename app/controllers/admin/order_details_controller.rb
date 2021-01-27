class Admin::OrderDetailsController < ApplicationController
  before_action :authenticate_admin!

	def update
		@order = OrderDetail.find(params[:id])
		@order_detail = @order.order
		if update_params[:status] == '製作中'
			@order.update(update_params)
			@order_detail.update(status: "製作中")
		elsif update_params[:status] == '製作完了'
			@order.update(update_params)
			@order_detail.update(status: "発送準備中")
		end
		redirect_to admin_orders_path(@order.order)
  end

  def update_making
		@order_detail = OrderDetail.find(params[:id])
		@order_detail.update(making_status: params[:order_detail][:making_status])
		@order = Order.find(@order_detail.order_id)
		if params[:order_detail][:making_status] == '製作中'
			@order.update(status: "製作中")
		end
	  @order.order_details.each_with_index do |order_detail,i|
	  	unless order_detail.making_status == "製作完了"
	  		break
	  	end

			if i+1 == @order.order_details.size
				@order.update(status: "発送準備中")
			end
		end
		# @order = @order_detail.order
		# if params[:order_detail][:making_status] == "制作中"
		# 	@order_detail.update(making_status: "制作中")
		# elsif params[:order_detail][:making_status]  == "制作完了"
		# 	@order_detail.update(making_status: "制作完了")
		# elsif params[:order_detail][:making_status]  == "制作完了"
		# 	@order_detail.update(making_status: "制作待ち")
		# end
		redirect_to request.referer
  end

	   private
	   def update_params
	   	params.require(:order_detail).permit(:making_status)
	   end

end
