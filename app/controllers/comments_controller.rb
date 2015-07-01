class CommentsController < ApplicationController
  before_action :authenticate_user!
  def new
  	@image = Image.find(params[:image_id])
  	@comment = @image.comments.new
  	@comment.user = current_user
  end

  def create
  	@image = Image.find(params[:image_id])

  	data = comment_params
  	data[:user] = current_user

  	@comment = @image.comments.build(data)
  	@comment.save
  	redirect_to user_image_path(current_user, @image)
  end

  def edit
  	@comment = Comment.find(params[:id])
  end

  def update
  	@comment = Comment.find(params[:id])
  	@comment.update(comment_params)
	redirect_to user_image_path(current_user, @comment.image)  	
  end

  def destroy
  	@comment = Comment.find(params[:id])
  	@comment.destroy
  	redirect_to user_image_path(current_user, @comment.image)  	
  end

  private
  def comment_params
  	params.require(:comment).permit(:body)
  end
end
