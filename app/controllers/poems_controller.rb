class PoemsController < ApplicationController
  before_filter :authenticate_user!, :except => :show
  before_filter :get_user
  
  def upvote
    @poems = Poem.find(params[:id])
    @poems.liked_by current_user
    respond_to do |format|
      format.html {redirect_to :back, notice: 'Thanks for voting' }
      format.js
    end
  end

  def downvote
    @poems = Poem.find(params[:id])
    @poems.downvote_from current_user
    respond_to do |format|
      format.html {redirect_to :back}
      format.js
    end
  end
  # impressionist :actions=>[:show,:index]
  # GET /poems
  # GET /poems.json
  def index
    if current_user == @user
      @poems = @user.poems.all
      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @poems }
      end
    else
      redirect_to root_path
    end
  end

  # GET /poems/1
  # GET /poems/1.json
  def show
    @poem = @user.poems.find(params[:id])
    @comments = Comment.all
    impressionist(@poem)

    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @poem }
    end
    
  end

  # GET /poems/new
  # GET /poems/new.json


  def new
    @poem = @user.poems.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @poem }
    end
  end

  # GET /poems/1/edit
  def edit
    if @user == current_user
      @poem = @user.poems.find(params[:id])
    end
  end

  # POST /poems
  # POST /poems.json
  def create
    @poem = @user.poems.build(params[:poem])
    @poem.user = current_user

    respond_to do |format|
      if @poem.save
        format.html { redirect_to user_poems_path, notice: 'Poem was successfully created.' }
        format.json { render json: @poem, status: :created, location: @poem }
      else
        format.html { render action: "new" }
        format.json { render json: @poem.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /poems/1
  # PUT /poems/1.json
  def update
    @poem = @user.poems.find(params[:id])

    respond_to do |format|
      if @poem.update_attributes(params[:poem])
        format.html { redirect_to user_poem_path(@poem.user, @poem), notice: 'Poem was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @poem.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /poems/1
  # DELETE /poems/1.json
  def destroy
    if current_user == @user || current_user.has_role?(:admin)
      @poem = @user.poems.find(params[:id])
      @poem.destroy

      respond_to do |format|
        format.html { redirect_to user_poems_path(@user) }
        format.json { head :no_content }
      end
    end
  end

  private

  def get_user
    @user = User.find(params[:user_id])
  end
end
