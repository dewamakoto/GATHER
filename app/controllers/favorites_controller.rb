class FavoritesController < ApplicationController

	def create
      	@bar = Bar.find(params[:bar_id])
        @favorite = Favorite.new
        @favorite.bar_id = @bar.id
        @favorite.user_id = current_user.id
        @favorite.save
        redirect_to bar_path(@bar), notice: "お気に入りに登録しました"
      end

	def index
		@favorites = Favorite.where(user_id: current_user.id).page(params[:page]).per(12)
	end

	def destroy
        @bar = Bar.find(params[:bar_id])
      	@favorite = Favorite.find_by(bar_id: params[:id], user_id: current_user.id)
        @favorite.destroy
        redirect_to bar_path(@bar)
     end

	private
    	def favorite_params
      		params.require(:favorite).permit(:bar_id, :user_id)
    	end
end