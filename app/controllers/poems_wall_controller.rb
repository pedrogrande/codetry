class PoemsWallController < ApplicationController
  def index
    
    @poems = Poem.where(:active => true).paginate(:page => params[:page]).order('created_at DESC')
    @tags = Poem.tag_counts_on(:tags)
  	@users = User.all
    if params[:language].present?
      @poems = Poem.where(:language => params[:language]).paginate(:page => params[:page], :per_page => 10)
    elsif params[:tag].present? 
    	@poems = Poem.tagged_with(params[:tag]).paginate(:page => params[:page], :per_page => 10)
    else
      @poems = Poem.paginate(:page => params[:page], :per_page => 10)
    end
      respond_to do |format|
      format.js
      format.html # index.html.erb
      format.json { render json: @poems }
    end

  end


end
