class CommentsController < ApplicationController

	def create
		Comment.create(comment_params)
		@comment = Comment.create(body: comment_params[:body], user_id: current_user.id)
		@comment.post = Post.find(params[:comment][:post_id])
		if @comment.save
			redirect_to bar_path(params[:comment][:bar_id])
		else
			puts @comment.errors.full_messages
			render bar_path(params[:comment][:bar_id])
 		end
	end

	def destroy
		@comment = Comment.find(params[:id])
    	@comment.destroy
    	redirect_to bar_path(params[:comment][:bar_id])
	end


	private
	def comment_params
		params.require(:comment).permit(:user_id,:post_id,:body)
  	end
end
