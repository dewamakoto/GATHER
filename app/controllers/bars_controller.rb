class BarsController < ApplicationController
  def show
    @bar = Bar.find(params[:id])
    @posts = Post.page(params[:page]).per(3)
    @posts = Post.where(bar_id: @bar.id)
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
  end

  def index
    @search = Bar.ransack(params[:q])
    @bar_result = @search.result.page(params[:bar]).per(10)
  end

  private
  def bar_params
    params.require(:bar).permit(:name,:sports,:category,:image,:address,:body)
  end
end
