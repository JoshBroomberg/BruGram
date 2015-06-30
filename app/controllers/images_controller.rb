class ImagesController < ApplicationController
	def index
        @images = current_user.images
	end

	def feed
		@images = Image.all
	end

	def show
		@image = Image.find(params[:id])
	end

	def new
		@image = current_user.images.new

	end

	def create
		@image = current_user.images.build(image_params)
		@image.save
		redirect_to user_image_path(current_user, @image)

	end

	def edit
		@image = Image.find(params[:id])

	end

	def update
		@image = Image.find(params[:id])
		@image.update(image_params)
		redirect_to user_image_path(current_user,@image)
	end

	def destroy
		@image = Image.find(params[:id])
		@image.destroy
		redirect_to feed_path(current_user)


	end

	private
	def image_params
 	 params.require(:image).permit(:caption, :public, :image)
    end


end
