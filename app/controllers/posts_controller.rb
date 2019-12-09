class PostsController < ApplicationController
  def new
  	@post = Post.new
  end

  def create
  	bar = Bar.find(params[:id])
  	@post = Post.new(post_params)
  	if @post.save
  		redirect_to bar_path
  	else
  		render "new"
  end

  def index
  end

  private
  def post_params
  	params.require(:post).permit(:image,:sports,:rate,:title,:body)
end
