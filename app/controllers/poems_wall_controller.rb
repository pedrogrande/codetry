class PoemsWallController < ApplicationController
  def index
  	@users = User.all
    if params[:language].present?
       @poems = Poem.where(:language => params[:language])
    elsif params[:tag].present? 
    	@poems = Poem.tagged_with(params[:tag])
    else
      @poems = Poem.all
    end
  end
end
