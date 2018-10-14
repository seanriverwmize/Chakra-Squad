require 'rails_helper'

describe Product do
  context "when the product has comments" do
    product = FactoryBot.create(:product)
    user = FactoryBot.create(:user)
    before do
      product.comments.create!(rating: 1, user: user, body: "This was complete trash")
      product.comments.create!(rating: 5, user: user, body: "This was a five")
      product.comments.create!(rating: 3, user: user, body: "This was a three")
    end

      it "should return the average rating of all comments" do
        expect(product.average_rating).to eq 3
    end

      it "should be invalid when there is no product name" do
        expect(Product.new(description: "This is a product without a name")).not_to be_valid
      end

  end
end
