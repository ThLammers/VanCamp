class ReviewsController < ApplicationController

  def create
    @van = Van.find(params[:van_id])
    @review = Review.new(review_params)
    @review.van = @van
    authorize @review
    if @review.save
      redirect_to van_path(@van)
    else
      render 'vans/show'
    end
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end
end
