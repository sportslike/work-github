class Admin::GenresController < ApplicationController
  before_action :authenticate_admin!

  def index
    @genre = Genre.new
    @genres = Genre.all
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      # binding.pry
      redirect_to admin_genres_path, notice: 'ジャンルを登録しました'
    else
      @genres = Genre.all
      render :index
    end
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
      redirect_to admin_genres_path, notice: 'ジャンルを編集しました'
    else
      render :edit
    end
  end

  private
    def genre_params
      params.require(:genre).permit(:name,:is_delete)
    end
end

