class PostsController < ApplicationController
  def new
  	@post = Post.new
  end

  def create
  	bar = Bar.find(params[:id])
  	@post = Post.new(post_params)
  	if @post.save
      safes = Vision.get_image_data(@post.image_id)

      aaa = []
      safes.first["safeSearchAnnotation"].each do |safe|
        if safe[1] == "VERY_LIKELY" || safe[1] == "LIKELY"
          aaa.push("LIKELY")
        end
      end

      if aaa.include?("LIKELY")
        flash[:danger]="選択した画像は投稿できません。"
        @post.update(image_id: ENV['NOIMAGE'])
      end

  		redirect_to bar_path
  	else
  		puts @post.errors.full_messages
  		render "new"
  	end
  end

  def index
  	@user = current_user
    @comments = Comment.page(params[:page]).per(3)
  	@posts = Post.where(user_id: current_user.id).page(params[:page]).per(3)
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
