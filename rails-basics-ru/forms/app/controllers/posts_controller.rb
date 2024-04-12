# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :find_post_by_id, only: %i[edit update show destroy]

  def index
    @posts = Post.all
  end

  def show; end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(posts_params)

    if @post.save
      flash[:success] = 'Post has been successfully created!'
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def edit; end

  def update
    if @post.update(posts_params)
      flash[:success] = 'Post has been successfully updated!'
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  def destroy
    if @post.destroy
      flash[:success] = 'Post has been successfully deleted!'
      redirect_to posts_path
    else
      redirect_to root_path
    end
  end

  private

  def find_post_by_id
    @post = Post.find(params[:id])
  end

  def posts_params
    params.require(:post).permit(:title, :body, :summary, :published)
  end
end
