class FavoritesController < ApplicationController
  def index
    @favorite = Favorite.all
  end
    def create
    favorite = current_user.favorites.create(tuitum_id: params[:tuitum_id])
    redirect_to tuita_url, notice: "#{favorite.tuitum.user.name}さんのブログをお気に入り登録しました"
    end

  def destroy
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    redirect_to tuita_url, notice: "#{favorite.tuitum.user.name}さんのブログをお気に入り解除しました"
  end
end

