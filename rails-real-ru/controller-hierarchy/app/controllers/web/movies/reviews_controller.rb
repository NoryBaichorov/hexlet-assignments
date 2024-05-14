# frozen_string_literal: true

module Web
  module Movies
    class ReviewsController < Web::Movies::ApplicationController
      before_action :set_review, except: %i[index new create]

      def index
        @reviews = resource_movie.reviews
      end

      def new
        @review = resource_movie.reviews.build
      end

      def create
        @review = resource_movie.reviews.build(review_params)

        if @review.save
          redirect_to movie_reviews_path(resource_movie)
          flash[:success] = t('web.movies.reviews.create.success')
        else
          redirect_back(fallback_location: :new)
          flash[:failure] = @review.errors.full_messages.join(' ')
        end
      end

      def edit; end

      def update
        if @review.update(review_params)
          redirect_to movie_reviews_path(resource_movie)
          flash[:success] = t('web.movies.reviews.edit.success')
        else
          redirect_back(fallback_location: :edit)
          flash[:failure] = @review.errors.full_messages.join(' ')
        end
      end

      def destroy
        @review.destroy!
        
        if @review.destroyed?
          redirect_to movie_reviews_path(resource_movie)
          flash[:success] = t('web.movies.reviews.destroy.success')
        end
      end

      private

      def set_review
        @review = Review.find(params[:id])
      end
      
      def review_params
        params.require(:review).permit(:body)
      end
    end
  end
end
