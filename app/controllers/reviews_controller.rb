class ReviewsController < ApplicationController
    before_action :authenticate_user!
    before_action :get_book
  
    def create
      @review = @book.reviews.create(review_params)
      @review.user = current_user
      if @review.save
        redirect_to @book, notice: "Comment saved"
      else
        redirect_to @book, alert: "Comment not saved"
      end
    end
  
    def destroy
      @review = @book.reviews.find(params[:id])
      @review.destroy
      redirect_to @book, alert: "Comment deleted"
    end
  
    private
  
    def get_book
      @book = Book.find(params[:book_id])
    end
  
    def review_params
      params.require(:review).permit(:title,:review,:rating)
    end
  end
