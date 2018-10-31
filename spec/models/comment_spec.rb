require 'rails_helper'

describe Comment do
  context "when one of the required validations is not passed" do
    @user = FactoryBot.create(:user)
    @product = FactoryBot.create(:product)
    it "Should be invalid because there is no body" do
      expect(Comment.new(user: @user, product: @product, rating: 2)).to_not be_valid
    end
    it "Should be invalid because there is no rating" do
      expect(Comment.new(user: @user, product: @product, body: "this is a comment body")).to_not be_valid
    end
    it "Should be invalid because there is no product" do
      expect(Comment.new(user: @user, body: "this is a comment body", rating: 2)).to_not be_valid
    end
    it "Should be invalid because there is no user" do
      expect(Comment.new(product: @product, body: "this is a comment body", rating: 2)).to_not be_valid
    end
    it "Should be invalid because rating is a string, not an integer" do
      expect(Comment.new(user: @user, product: @product, body: "This is the comment body", rating: "string")).to_not be_valid
    end
  end
end
