class SimplePagesController < ApplicationController
  def index
  end
  def landing_page
    @products = Product.limit(3)

  end
  def contact
  end
  def about
  end
end
