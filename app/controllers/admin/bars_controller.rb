class Admin::BarsController < ApplicationController
  def show
  	if admin_signed_in?
    	@bar = Bar.find(params[:id])
    	@posts = Post.where(bar_id: @bar.id).page(params[:page]).per(3)
    	@comment = Comment.new
    	@comments = Comment.where(post_id: @post_id).page(params[:page]).per(3)
    else
    	redirect_to root_path
    end
  end

  def index
  	if admin_signed_in?
    	@search = Bar.ransack(params[:q])
    	@bar_result = @search.result.page(params[:bar]).per(10)
    	@all_ranks = Bar.find(Favorite.group(:bar_id).order('count(bar_id) desc').limit(3).pluck(:bar_id))
    else
    	redirect_to root_path
    end
  end

  def edit
  	if admin_signed_in?
  		@bar = Bar.find(params[:id])
  	else
  		redirect_to root_path
  	end
  end

  def update
  	@bar = Bar.find(params[:id])
  	if @bar.update(bar_params)
  		redirect_to admin_bar_path(@bar)
  	else
  		render :edit
  	end
  end

  def destroy
  	@bar = Bar.find(params[:id])
  	@bar.destroy
  	redirect_to admin_bars_path
  end

  private
  def bar_params
    params.require(:bar).permit(:name,:sports,:category,:image,:address,:body,:latitude,:longitude)
  end
end
