require 'rails_helper'

describe Product do
  context "when the product has comments" do
    @product = FactoryBot.create(:product)
    @user = FactoryBot.create(:user)
    before :each do
      Comment.new(user: @user, product: @product, rating: 2, body: "Comment Body")
      Comment.new(user: @user, product: @product, rating: 4, body: "Comment Body")
    end

      it "should return the average rating of all comments" do
        expect(@product.average_rating).to eq 2
    end
  end

  context "when product validations do not all pass" do
    it "should be invalid when there is no product name" do
      expect(Product.new(description: "This is a product without a name")).not_to be_valid
    end
    it "should be invalid when there is no product body" do
      expect(Product.new(name: "Product no description", price: 500)).not_to be_valid
    end
    it "should be invalid when there is no product price" do
      expect(Product.new(description: "This is a product without a price", name: "Product Test2")).not_to be_valid
    end
    it "should be invalid when the product price is negative" do
      expect(Product.new(description: "This is a product with a negative price", name: "Product Test3", price: -3)).not_to be_valid
    end
  end
end
