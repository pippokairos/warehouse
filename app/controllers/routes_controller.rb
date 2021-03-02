class RoutesController < ApplicationController

  def index
  end

  def search
    if params[:reference]
      reference = params[:reference].strip
      product = Product.find_by_reference(reference)
      if product.nil?
        flash[:error] = "Product \"#{reference}\" not found"
      else
        @router = Router.new(product)
      end
    end

    render :index
  end
end
