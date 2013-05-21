module PoemsWallHelper
	include ActsAsTaggableOn::TagsHelper

	def modal(index)
		"#myModal-" + index.to_s
	end

	def modal_id(index)
		"myModal-" + index.to_s
	end

	def reddit_url(poem)
		"http://www.reddit.com/buttonlite.js?i=1&styled=off&url=" + user_poem_url(poem.user, poem) + "&newwindow=1"
	end
end
