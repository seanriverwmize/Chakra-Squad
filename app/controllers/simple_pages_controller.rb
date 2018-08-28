class SimplePagesController < ApplicationController
  def index
  end
  def landing_page
    @featured_product = Product.first
  end
  def contact
  end
  def about
  end
end
