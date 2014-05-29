class CommentsController < ApplicationController

  # This method simply instantiates an empty instance of Comment
  def new
    @post = Post.find(params[:post_id])
    @comments = @post.comments.paginate(page: params[:page], per_page: 10)
    @comment = Comment.new
    authorize @comment 
  end

  # This is for when the user clicks save/submit on web form, and 'create' method is called
  # This method will either save to db or return error to user
  # Unlike 'new method' this does not have a corresponding view.
  def create
    @post = Post.find(params[:post_id]) 
    @comment = current_user.comments.build(post_params)
    @comment.post = @post
    @topic = @post.topic


    authorize @comment 
    if @comment.save
      redirect_to [@topic, @post], notice: "Comment was saved successfully."
    else
      flash[:error] = "Error saving the comment. Please try again #{@comment.errors[:body]}"
      redirect_to [@topic, @post]

    end
  end

  def post_params
    params.require(:comment).permit(:body)
  end


end
