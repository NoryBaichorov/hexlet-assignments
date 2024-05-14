# frozen_string_literal: true

module Web
  module Movies
    class CommentsController < Web::Movies::ApplicationController
      before_action :set_comment, except: %i[index new create]

      def index
        @comments = resource_movie.comments
      end

      def new
        @comment = resource_movie.comments.build
      end

      def create
        @comment = resource_movie.comments.build(comment_params)

        if @comment.save
          redirect_to movie_comments_path(resource_movie)
          flash[:success] = t('web.movies.comments.create.success')
        else
          redirect_back(fallback_location: :new)
          flash[:failure] = @comment.errors.full_messages.join(' ')
        end
      end

      def edit; end

      def update
        if @comment.update(comment_params)
          redirect_to movie_comments_path(resource_movie)
          flash[:success] = t('web.movies.comments.edit.success')
        else
          redirect_back(fallback_location: :edit)
          flash[:failure] = @comment.errors.full_messages.join(' ')
        end
      end

      def destroy
        @comment.destroy

        if @comment.destroyed?
          redirect_to movie_comments_path(resource_movie)
          flash[:success] = t('web.movies.comments.destroy.success')
        end
      end

      private

      def set_comment
        @comment = Comment.find(params[:id])
      end

      def comment_params
        params.require(:comment).permit(:body)
      end
    end
  end
end
