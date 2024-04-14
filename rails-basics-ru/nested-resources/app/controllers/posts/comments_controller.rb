class Posts::CommentsController < Posts::ApplicationController
  before_action :find_post, only: %i[new create]
  before_action :find_comment, except: %i[new create]

  def new
    @comment = @post.post_comments.build
  end

  def edit; end

  def create
    @comment = @post.post_comments.build(comment_params)

    if @comment.save
      redirect_to post_path(@post)
      flash[:success] = 'Comment has been added'
    else
      flash[:failure] = @comment.errors.full_messages.join(' ')
      render :new
    end
  end

  def update
    if @comment.update(comment_params)
      flash[:success] = 'Comment has been updated!'
      redirect_to post_path(@comment.post)
    else
      render :edit
      flash[:failure] = @comment.errors.full_messages.join(' ')
    end
  end

  def destroy
    if @comment.destroy
      redirect_to posts_path
      flash[:success] = 'Comment has been deleted'
    end
  end

  private

  def find_post
    @post = Post.find(params[:post_id])
  end

  def find_comment
    @comment = PostComment.find(params[:id])
  end

  def comment_params
    params.require(:post_comment).permit(:comment, :post_id)
  end
end
