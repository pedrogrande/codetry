class CommentsController < ApplicationController
    before_filter :authenticate_user!

  # GET /comments/1/edit
  def edit
    @comment = Comment.find(params[:id])
  end

  # POST /comments
  # POST /comments.json
  def create
    @poem = Poem.find(params[:poem_id])
    @comment = @poem.comments.build(params[:comment])
    @comment.user = current_user


    respond_to do |format|
      if @comment.save
        format.html { redirect_to user_poem_path(@poem.user, @poem), notice: 'Comment was successfully created.' }
        format.json { render json: @comment, status: :created, location: @comment }
      else
        format.html { render action: "new" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /comments/1
  # PUT /comments/1.json
 # def update
  #  @comment = Comment.find(params[:id])

   # respond_to do |format|
    #  if @comment.update_attributes(params[:comment])
     #   format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
      #  format.json { head :no_content }
      #else
       # format.html { render action: "edit" }
       # format.json { render json: @comment.errors, status: :unprocessable_entity }
      #end
    #end
 # end

  # DELETE /comments/1
  # DELETE /comments/1.json
  
 def destroy
    @post = Post.find(params[:post_id]) #Get the post
    @comment = @post.comments.find(params[:id]) #Get the associated comment
    @comment.destroy
    redirect_to post_path(@post)

  #def destroy
   # @comment = Comment.find(params[:id])
   # @comment.destroy

    #respond_to do |format|
     # format.html { redirect_to comments_url }
     # format.json { head :no_content }
    #end
  end
end