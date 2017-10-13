class ProductsController < ApplicationController

  def index
    @products = Product.all.order(created_at: :desc)
  end

  def show
    @product = Product.find params[:id]
    # @review = Review.new(review_params)
  end

  # private

  # # Never trust parameters from the scary internet, only allow the white list through.
  # def review_params
  #   params.require(:review).permit(:description, :rating)
  # end

end
