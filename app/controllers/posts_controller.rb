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
  	@user = current_user
  	@posts = Post.page(params[:page]).per(5)
  	@posts = Post.where(user_id: current_user.id)
  end

  def destroy
  	@posts = Post.find(params[:id])
    @posts.destroy
    redirect_to posts_path
  end

  private
  def post_params
  	params.require(:post).permit(:image,:sports,:rate,:title,:body,:user_id,:bar_id)
  end
end
