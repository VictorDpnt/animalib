class ReviewsController < ApplicationController
  before_action :set_review, only: [:destroy]

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    if @review.save
      redirect_to profile_path, notice: 'Review was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @review.destroy
    redirect_to reviews_url, notice: 'Review was successfully destroyed.'
  end

  private

  def set_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:content, :rating, :booking_id)
  end
end
