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
end
