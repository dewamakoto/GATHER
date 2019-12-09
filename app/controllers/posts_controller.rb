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
  		puts @post.errors.full_messages 
  		render "new"
  	end
  end

  def index
  end

  private
  def post_params
  	params.require(:post).permit(:image,:sports,:rate,:title,:body,:user_id,:bar_id)
  end
end
