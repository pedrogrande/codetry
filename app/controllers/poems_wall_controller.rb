class PoemsWallController < ApplicationController
  def index
  	@users = User.all
    if params[:language].present?
       @poems = Poem.where(:language => params[:language])
    else
      @poems = Poem.all
    end
  end
end
