class FavoritesController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    micropost = Micropost.find(params[:micropost_id])
    micropost.favorite(current_user)
    flash[:success] = 'お気に入りしました。'
    redirect_to current_user
  end

  def destroy
    micropost = Micropost.find(params[:micropost_id])
    micropost.unfavorite(current_user)
    flash[:success] = "お気に入り登録を解除しました。"
    redirect_to current_user
  end
end
