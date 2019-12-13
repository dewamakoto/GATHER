class CommentsController < ApplicationController

	def create
		Comment.create(comment_params)
		@comment = Comment.create(body: comment_params[:body], user_id: current_user.id)
		@comment.post = Post.find(params[:comment][:post_id])
		if @comment.save
			#binding.pry
			render :index
			#render json: { message: @comment }
			# redirect_to bar_path(params[:comment][:bar_id])
		else
			render bar_path(params[:comment][:bar_id])
 		end
	end

	def destroy
		@comment = Comment.find(params[:id])
    	@comment.destroy
    	render :index
    	# redirect_to bar_path(params[:comment][:bar_id])
	end


	private
	def comment_params
		params.require(:comment).permit(:user_id,:post_id,:body)
  	end
end