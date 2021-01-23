class Public::ItemsController < ApplicationController
  def index
		Item.joins(:item_genre)
		@items = Item.all
		@genres = Genre.where(is_delete: false)
  end

def show
		@item = Item.find(params[:id])
		@genres = Genre.where(is_delete: false)
unless  customer_signed_in?
    @cart_item = CartItem.new
else
    @cart_item = current_customer.cart_items.new
end
end

	def genres
		@items = Item.where(item_genre_id: params[:genres_id]).where(is_active: true).order(name: "ASC")
	  @genre = ItemGenre.find(params[:genres_id])
		@genres = ItemGenre.where(is_delete: false)
	end

  private
    def item_params
      params.require(:item).permit(:image_id, :name, :introduction, :genre_id, :price, :is_active)
    end
end

