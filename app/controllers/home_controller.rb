class HomeController < ApplicationController
  def index
    @users = User.all
    @poems = Poem.where(:active => true).paginate(:page => params[:page]).order('created_at DESC')
    
  end

end
