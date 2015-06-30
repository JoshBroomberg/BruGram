module ImagesHelper
	def captionSend image
		caption = image.caption+" "
		image.hashtags.each do |hashtag|
			caption = caption.gsub("#"+hashtag.hashtag+" ", (link_to "#"+hashtag.hashtag+" ", "/hashtag/#{hashtag.hashtag}"))
			caption = caption.gsub("#"+hashtag.hashtag+"#", (link_to "#"+hashtag.hashtag+"#", "/hashtag/#{hashtag.hashtag}"))
		end
		
		caption = caption[0..caption.length-1]
		caption.html_safe
	end

	def show image

	if image.user != current_user
		if image.read_attribute(:public)
			return true	
		end 
	elsif current_user == image.user
		return true
	else
		return false
    end
end
end
