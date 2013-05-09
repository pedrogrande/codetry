class AdminController < ApplicationController
  
  def index
  	authorize! :index, @user, :message => 'Not authorized as an administrator.'
  	@users = User.limit(5)
  end
end
