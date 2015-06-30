class ImagesController < ApplicationController
	def index
        @user = User.find(params[:user_id])
        @images = @user.images
	end

	def feed
		@images = current_user.images
		current_user.followees.each do |followee|
			@images+=followee.images
		end
		@images.shuffle!
	end

	def show
		@image = Image.find(params[:id])
	end

	def new
		@image = current_user.images.new

	end

	def create
		@image = current_user.images.build(image_params)
		hashtags @image.caption
		@image.save
		redirect_to user_image_path(current_user, @image)

	end

	def edit
		@image = Image.find(params[:id])

	def update
		@image = Image.find(params[:id])
		@image.update(image_params)
		hashtags @image.caption
		redirect_to user_image_path(current_user,@image)
	end

	def destroy
		@image = Image.find(params[:id])
		@image.destroy
		redirect_to feed_path(current_user)


	end

	def hash
		@hashtagText = params[:hash]
		hashtag = Hashtag.find_by(hashtag: @hashtagText)
		@images = hashtag.images

	end

	def image_params
 	 params.require(:image).permit(:caption, :public, :image)
    end

    def hashtags(caption)
       letterArr = caption.split("")
       hashFound = false
       hash = ""
       letterArr.each_with_index do |letter, index|
       		if hashFound && letter!=" " && letter!="#"
       			hash << letter
       			
       		end
       		if hashFound && (letter == " "||letter=="#"||index==(letterArr.length-1))
       			hashFound = false
       			if Hashtag.where(hashtag: hash).count == 0

	       			@hashtag = @image.hashtags.new(hashtag: hash)
	       			@hashtag.save
	       		else
	       			@hashtag = Hashtag.where(hashtag: hash).first
	       			if !@image.hashtags.include?(@hashtag)
	       				@image.hashtags << (@hashtag)
	       			end

	       		end

       			hash = ""
       		end
       		if letter == "#"
       			hashFound = true
       		end
        end
    end

end
end
