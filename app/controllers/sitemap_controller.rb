class SitemapController < ApplicationController
	def index
		@static_pages = [root_url, contributors_url, contact_url, privacy_policy_url, usage_policy_url, press_url]
    	@users = User.all
    	@poems = Poem.all
    	respond_to do |format|
    		format.xml
     	end
   	end
 end
