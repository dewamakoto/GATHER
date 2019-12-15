class BarsController < ApplicationController
  def show
    @bar = Bar.find(params[:id])
    @favorite = Favorite.new
    @posts = Post.where(bar_id: @bar.id).page(params[:page]).per(3)
    @comment = Comment.new
    @comments = Comment.where(post_id: @post_id).page(params[:page]).per(3)
  end

  def new
    @bar = Bar.new
  end

  def create
    @bar = Bar.new(bar_params)
    if @bar.save
      redirect_to bars_path
    else
      render 'new'
    end
  end

  def search
    @bar = Bar.all
  end

  def index
    @search = Bar.ransack(params[:q])
    @bar_result = @search.result.page(params[:bar]).per(10)
  end


  private
  def bar_params
    params.require(:bar).permit(:name,:sports,:category,:image,:address,:body,:latitude,:longitude)
  end
end
