class AdminController < ApplicationController
  before_filter :authenticate_user!
  
  def index
  	authorize! :index, @user, :message => 'Not authorized as an administrator.'
  	@users = User.limit(5)
  end
end
