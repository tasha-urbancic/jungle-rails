class ReviewsController < ApplicationController
  def create
    @product = Product.find params[:product_id]
    @review = @product.reviews.create(review_params)

    if @review.save!
      redirect_to @product, notice: 'Review was successfully created.'
    else
      render template: 'products/show'
    end

  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def review_params
    params.require(:review).permit(:description, :rating).merge(user: current_user)
  end

end
