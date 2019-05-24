class ReviewsController < ApplicationController

  def create
    @van = Van.find(params[:van_id])
    @review = Review.new(review_params)
    @review.van = @van
    @review.user = current_user
    authorize @review
    if @review.save
      respond_to do |format|
        format.html { redirect_to @van }
        format.js
      end
    else
      respond_to do |format|
        format.html { render 'vans/show' }
        format.js
      end
    end
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end
end
