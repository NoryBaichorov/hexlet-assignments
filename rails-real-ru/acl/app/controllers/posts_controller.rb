# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :set_post, except: %i[index new create]
  after_action :verify_authorized, except: %i[index show]

  # BEGIN
  def index
    @posts = Post.all
  end

  def show
  end

  def new
    @post = current_user.posts.build
    authorize @post
  end

  def create
    @post = current_user.posts.build(post_params)
    authorize @post

    if @post.save
      flash.now[:success] = 'Post was created!'
      redirect_to @post
    else
      redirect_to(fallback_location: new_post_path)
      flash[:failure] = @post.errors.full_messages.join(' ')
    end
  end

  def edit
    authorize @post
  end

  def update
    authorize @post

    if @post.update(post_params)
      redirect_to post_path(@post)
      flash[:success] = 'Post has been updated'
    else
      redirect_back(fallback_location: edit_post_path(@post))
      flash[:failure] = @post.errors.full_messages.join(' ')
    end
  end

  def destroy
    authorize @post

    if @post.destroy
      redirect_to posts_path
      flash[:success] = 'Post has been removed'
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end
  
  def post_params
    params.require(:post).permit(:title, :body, :author_id)
  end
  # END
end
