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
      respond_to do |format|
      format.js
      format.html # index.html.erb
      format.json { render json: @poems }
    end
  end
end
