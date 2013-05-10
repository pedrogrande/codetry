class PoemsWallController < ApplicationController
  def index
    @tags = Poem.tag_counts_on(:tags)
  	@users = User.all
    if params[:language].present?
      @poems = Poem.where(:language => params[:language])
    elsif params[:tag].present? 
    	@poems = Poem.tagged_with(params[:tag])
    else
      @poems = Poem.all
    end
  end
  def tag_cloud
    @tags = Poem.tag_counts_on(:tags)
  end
end
